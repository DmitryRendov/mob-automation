# Ollama + Open WebUI

Ansible roles to deploy [Ollama](https://ollama.com/) and [Open WebUI](https://github.com/open-webui/open-webui) on LLM hosts.

Defaults target a **16 GB RAM** machine with an Intel CPU/iGPU: one model loaded at a time, Q4_K_M quantizations, and conservative parallelism settings.

## Inventory

The `ollama` host lives in `inventory/live` under the `[llm]` group:

```
[llm]
ollama  ansible_ssh_host=192.168.100.11  ansible_port=1222
```

Group variables in `group_vars/llm.yml` enable Docker, Intel GPU packages, and firewall ports `11434` (Ollama) and `8080` (Open WebUI).

## Prerequisites

- Debian/Ubuntu target with sudo access
- SSH key auth configured (via the `common` role)
- Enough disk space for models (~5 GB each)

## Full setup

From the `ansible/` directory:

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama" -v
```

This runs, in order:

1. **common** — base packages, firewall, Docker CE, Intel GPU drivers (`intel-level-zero-gpu`, OpenCL)
2. **ollama** — installs Ollama, applies tuned systemd env, pulls default models
3. **openwebui** — runs Open WebUI in Docker (host networking)

First run can take a while while models download.

## Step-by-step (optional)

Run common provisioning first if you only want base system setup:

```bash
ansible-playbook -i ./inventory/live common.yml \
  -e "user=minecraft env=ollama" -v
```

Then deploy Ollama and Open WebUI (skip common if already done by editing the playbook or running role-specific tasks manually).

## Default models

Pulled automatically when `ollama_pull_models: true` (default):

| Model | Tag | Approx. size |
|-------|-----|--------------|
| Mistral 7B Instruct | `mistral:7b-instruct-q4_K_M` | ~4.4 GB |
| Llama 3.1 8B Instruct | `llama3.1:8b-instruct-q4_K_M` | ~4.9 GB |
| Qwen 2.5 7B Instruct | `qwen2.5:7b-instruct-q4_K_M` | ~4.4 GB |

Skip pre-pulling on slow links:

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama ollama_pull_models=false" -v
```

Pull manually on the host:

```bash
ollama pull mistral:7b-instruct-q4_K_M
```

## Access

| Service | URL |
|---------|-----|
| Open WebUI | `http://<host>:8080` |
| Ollama API | `http://<host>:11434` |

On first Open WebUI visit, create a local admin account.

Quick API test from the host:

```bash
curl http://127.0.0.1:11434/api/tags
ollama run mistral:7b-instruct-q4_K_M "Hello"
```

## Tuning variables

Override at the CLI or in `host_vars/ollama`:

```yaml
# Fewer loaded models / shorter cache — saves RAM
ollama_env:
  OLLAMA_MAX_LOADED_MODELS: "1"
  OLLAMA_KEEP_ALIVE: "2m"

# Custom model list
ollama_models:
  - mistral:7b-instruct-q4_K_M
  - qwen2.5:7b-instruct-q4_K_M

# Open WebUI port
openwebui_port: 8080
```

## Intel GPU (optional)

Intel GPU driver install is **off by default** (`intel_gpu_enabled: false` in `group_vars/llm.yml`). The main `ollama.yml` playbook skips it, so missing packages like `intel-level-zero-gpu` won't block deployment.

### Skip entirely (default)

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama" -v
```

Or explicitly:

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama intel_gpu_enabled=false" \
  --skip-tags intel_gpu -v
```

### Run only Intel GPU setup

Dedicated playbook (installs whatever packages exist in apt; skips missing ones):

```bash
ansible-playbook -i ./inventory/live intel-gpu.yml \
  -e "user=minecraft env=ollama" -v
```

Or via tags on the main playbook:

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama intel_gpu_enabled=true" \
  --tags intel_gpu -v
```

On **Ubuntu**, `intel_gpu_add_repo: true` (default) adds Intel's GPU apt repository, then installs `intel-level-zero-gpu` as a single transaction so apt can resolve matching dependencies. Packages are **not** bulk-installed together — that avoids version conflicts between `intel-opencl-icd`, `intel-gpu-compute`, and `level-zero`.

If the Intel-repo stack fails (common on older iGPUs missing `libigc1`), the role falls back to Ubuntu's `intel-opencl-icd`.

### Include Intel GPU in a full deploy

```bash
ansible-playbook -i ./inventory/live ollama.yml \
  -e "user=minecraft env=ollama intel_gpu_enabled=true" -v
```

To also apply Intel-oriented Ollama env vars (for IPEX-LLM builds), keep `intel_gpu_enabled=true` — the ollama role uses the same flag.

**Official Ollama uses CPU inference by default.** Intel env vars prepare the host if you switch to an [IPEX-LLM](https://github.com/intel-analytics/ipex-llm) Ollama build later.

For Intel GPU acceleration today, see:

- [IPEX-LLM Ollama quickstart](https://github.com/intel-analytics/ipex-llm/blob/main/docs/mddocs/Quickstart/ollama_quickstart.md)
- [mattcurf/ollama-intel-gpu](https://github.com/mattcurf/ollama-intel-gpu) (Docker Compose reference)

On 16 GB RAM, Q4 models on CPU are a practical default; iGPU offload helps most on newer Intel Arc / Meteor Lake parts.

## Role layout

```
roles/ollama/
  defaults/main.yml     # models, env tuning
  tasks/main.yml        # install, configure, pull
  templates/override.conf.j2
  handlers/main.yml

roles/openwebui/
  defaults/main.yml     # image, port, data dir
  tasks/main.yml        # docker container
```
