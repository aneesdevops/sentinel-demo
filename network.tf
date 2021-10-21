# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Azure Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  #count = 2
  #name                = "mypublicip-${count.index}"
  name                = "mypublicip"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  #domain_name_label = "app1-vm-${count.index}-${random_string.myrandom.id}"  
  domain_name_label = "app1-vm-202111123" 
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  #count =2 
  #name                = "vmnic-${count.index}"
  name                = "vmnic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id, count.index)
    public_ip_address_id = azurerm_public_ip.mypublicip.id      
  }
}

resource "azurerm_network_security_group" "mynsg" {
  name                = "mynsg-win"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}