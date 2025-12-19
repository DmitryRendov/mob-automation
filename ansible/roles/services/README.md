# Services Role

Ansible role for setting git, aws, and wireguard services.

## Extra Variables

Most of extra variables are sensitive data, so prepare a file named local.vars.yml and inclusde the following variables:

### Required Secrets

| Variable | Description | Example |
|----------|-------------|---------|
| `wireguard.client_public_key` | Client Public key | `your-public-key-here` |
| `wireguard.server_private_key` | Server Private key | `your-private-key-here` |
| `aws.access_key` | AWS Integration user Access key | `your-aws_access_key_id` |
| `aws.secret_key` | AWS Integration user Secret Key | `your-aws_secret_access_key` |
| `git.username, git.email` | Git global user name and email | `username, email` |
| `git.ssh_key_name` | Your integration Git SSH key name | `id_ed25519` |
| `git.ssh_key` | Your integration Git SSH key | `key` |


```bash
---
wireguard:
  client_public_key: ""
  server_private_key: ""

aws:
  access_key: ""
  secret_key: ""

git:
  username: ""
  email: ""
  ssh_key_name: id_ed25519_mobdeploy
  ssh_key: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    WMZkdqHD9CW....
    -----END OPENSSH PRIVATE KEY-----
```

## Usage

```bash
ansible-playbook -i ./inventory/live services.yml \
-e "user=minecraft env=mobserver-vps" \
-e "@local.vars.yml" -v
```

## Security Notes

- Never commit secrets to version control
- Use Ansible Vault for sensitive variables
- Store secrets in a secure credential management system
