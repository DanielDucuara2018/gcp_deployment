# ☁️ GCP Deployment with Terraform

This project provisions a basic **Google Cloud Platform (GCP)** infrastructure using **Terraform**. It includes:

* **Virtual Private Cloud (VPC):** A custom-mode VPC with a specified IP range.
* **Subnet:** A subnet deployed in a specified GCP region.
* **Firewall Rule:** A firewall rule allowing inbound SSH (port 22) access.
* **Compute Engine Virtual Machine (VM):** A VM instance deployed within the subnet, assigned an external IP address for public access.
* **Cloud NAT Configuration:** A Cloud NAT setup to enable the VM to access external internet resources securely without exposing additional ports.
* **Startup Script:** An optional startup script (`init.sh`) to initialize the VM on boot.

This setup provides a foundational infrastructure layer suitable for development or testing environments in GCP, emphasizing secure access and internet connectivity through SSH and NAT configurations.

---

## 📁 Project Structure

```bash
gcp_deployment/
├── resources/             # Directory for additional resources (e.g., scripts, images)
├── firewall.tf            # Defines firewall rules
├── output.tf              # Specifies output variables
├── provider.tf            # Configures the GCP provider
├── variables.tf           # Declares input variables
├── vms.tf                 # Configures Compute Engine VM instances
├── vpc.tf                 # Sets up the Virtual Private Cloud network
└── README.md              # Project documentation
```

---

## 🚀 Features

* **Infrastructure as Code (IaC):** Utilize Terraform to define and manage GCP resources declaratively.
* **Modular Configuration:** Organized `.tf` files for clear separation of concerns and easier maintenance.
* **Scalable Deployments:** Easily adapt configurations for different environments and scales.
* **Automated Provisioning:** Streamline the creation and management of infrastructure components.

---

## 🛠️ Getting Started

### Prerequisites

* A Google Cloud Platform account with billing enabled.
* [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
* [Terraform](https://www.terraform.io/downloads.html) installed.
* Enable necessary GCP APIs, such as Compute Engine API.([YouTube][1], [Google Cloud][2])

### Deployment Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/DanielDucuara2018/gcp_deployment.git
   cd gcp_deployment
   ```
   
2. **Create SSH keys**

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

3. **Initialize Terraform:**

   ```bash
   terraform init
   ```

4. **Format the Configuration Files (Optional but Recommended):**

   ```bash
   terraform fmt
   ```

5. **Validate the Configuration:**

   ```bash
   terraform validate
   ```

6. **Review the Execution Plan:**

   ```bash
   terraform plan
   ```

7. **Apply the Configuration:**

   ```bash
   terraform apply
   ```

   *To apply without a prompt:*
   
   ```bash
   terraform apply -auto-approve
   ```

8. **SSH Connection**

   ```bash
   ssh -i ~/.ssh/id_rsa ubuntu@<external-ip>
   ```

9. **(Optional) Destroy the Infrastructure:**

   ```bash
   terraform destroy
   ```
---

## 📌 Notes

* Ensure that the `provider.tf` file is correctly configured with your GCP project ID and desired region.
* Customize the `variables.tf` file to define values specific to your deployment needs.
* Review and adjust the configurations in the `.tf` files to match your infrastructure requirements.

---

## 🤝 Contributing

Contributions are welcome! Feel free to fork the repository and submit a pull request for any enhancements or bug fixes.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
