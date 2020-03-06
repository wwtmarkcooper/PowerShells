 #connects to your vCenter - use your creds
 connect-viserver svtvc01.wwtpoc.local -user administrator@vsphere.local -Password WWTwwt1!


#Change  cluster name, switch name, vlan name and vlan #
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN101” -VLanId “101”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN102” -VLanId “102”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN103” -VLanId “103”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN104” -VLanId “104”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN105” -VLanId “105”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN106” -VLanId “106”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN107” -VLanId “107”
  get-cluster -name SimCity | Get-VMHost | Get-VirtualSwitch -name “vSwitch0” | New-VirtualPortGroup -Name “VLAN108” -VLanId “108”
