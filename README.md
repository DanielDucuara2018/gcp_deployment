## ✅ Basic Terraform Workflow

1. **Initialize the project**

   This sets up Terraform by downloading the required providers and modules.

   ```bash
   terraform init
   ```

2. **Format the code (optional but recommended)**

   Ensures that the Terraform files are properly formatted.

   ```bash
   terraform fmt
   ```

3. **Validate the configuration**

   Checks whether the configuration is syntactically valid.

   ```bash
   terraform validate
   ```

4. **See what Terraform will do (dry-run)**

   Shows you what actions Terraform will take without making any changes.

   ```bash
   terraform plan
   ```

5. **Apply the configuration**

   Actually provisions the infrastructure described in your manifests.

   ```bash
   terraform apply
   ```

   You can also auto-approve the apply without prompting:

   ```bash
   terraform apply -auto-approve
   ```

6. **(Optional) Destroy the infrastructure**

   Tears down all the resources that were created.

   ```bash
   terraform destroy
   ```

   Auto-approve destroy:

   ```bash
   terraform destroy -auto-approve
   ```

## SSH Connection

```bash
ssh -i ~/.ssh/id_rsa ubuntu@<external-ip>
```
