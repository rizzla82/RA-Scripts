# The ansible support_install playbook will install the following packages:
# git tree tfenv terragrunt and vs code.
#
# The script will enable local user bin so after the installation every thing will run without sudo.

Place the script in the Downloads folder on your profile.

Open the script file support_install.yml, then find and replace username with your login name.

Replace username with jsmith.

Save script.

Using: sudo -i

Install Ansible

apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible

If in a rush:

apt install ansible


Check Ansible version
ansible --version

cd /home/jsmith/Downloads

ansible-playbook support_install.yml -vvv

Ansible is not designed to running locally.
ingnore the local error.

***Please only run this on a clean install or a new user profile.***

Please use tfenv to install the required terraform versions.
*** Dont use sudo for the following ***

  tfenv install 0.11.12
  tfenv use 0.11.12
  tfenv list
  terraform version








