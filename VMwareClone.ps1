# To use this script:
#  1. change values of top 7 variables in Section 1. Use the descriptions to the right if you are unsure what to change the values to. All values will need to be changed here.
#  2. Ensure the policy is setup in vSphere. You can join a Windows domain, set DNS, etc. Do this! 
#  3. Make sure the resources are adequate in the target cluster (storage, CPU, RAM).
#  4. Execute Section 1 of the script.  If no errors, move on...
#  5. Execute Section 2 of the script.  Before doing a large quantity of VMs, you may consider setting the $QuantityOfVMs to = 2. This will create 1 VM as a test. If you delete the VM, rexeicute Section 1, the counting will start back at VMName_01.
#  6. Connect to vCenter with: example "connect-viserver svtvc01.wwtpoc.local -user administrator@vsphere.local -Password WWTwwt1!"
  connect-viserver svtvc01.wwtpoc.local -user administrator@vsphere.local -Password WWTwwt1!
#
# ______________________________________________________________________________________________________________________________________________________________________________
#
# Section 1
#
$TargetCluster = Get-Cluster -Name "SimCity"                           # Cluster name in the target vCenter
$SourceVMTemplate = Get-Template -Name Template-Win12R2                    # Source VM must be in template format. Just right click and convert to template.
$SourceCustomSpec = Get-OSCustomizationSpec -Name "WIn-Policy"       # Policy name to customize the VM. 
$DatastoreName = "Behemoth01"                                        # Target datastore. Find one with enough space
$LocationName = "Windows2012r2"                                              # Folder name. Can be name of subfolder. It just needs to be in the cluster in the top variable. 
$QuantityOfVMs = "91"                                                   # Type in the # of VMs plus 1. So 51 if you want to create 50 VMs.
$vmName = "Win12r2SL"                                               # Type in the name of the VM. "CentOS8-0" will result in CentOS8-SL-01, CentOS8-SL-02, etc up until the # of VMs to be created.
#
$CNT = 1                                                               # Do not change this value. If you want to start at something higher than 1, play with this I guess.
# end of Section 1                                                    #
# _______________________________________________________________________________________________________________________________________________________________________________
#
# Section 2
#
Do 
{
  $VM = $vmName + $CNT.ToString()  
  
  # EXAMPLE: New-VM -Name $VM -Template $SourceVMTemplate -ResourcePool $TargetCluster -OSCustomizationSpec $SourceCustomSpec -Datastore SimCityDatastore01 -location Windows2012
  New-VM -Name $VM -Template $SourceVMTemplate -ResourcePool $TargetCluster  -Datastore $DatastoreName -Location $LocationName #-OSCustomizationSpec $SourceCustomSpec
  Start-VM -VM $VM
  Get-VM -Name $VM | Get-NetworkAdapter -Name "Network adapter 1" | Set-NetworkAdapter -Connected:$true -Confirm:$false 
     
  $CNT = $CNT + 1
  
} While ($CNT -lt $QuantityOfVMs)
#
# end of the Section 2
# ________________________________________________________________________________________________________________________________________________________________________________
# Section 3
#  Troubleshooting
#    I have run into issues that don't make any sense. Try the script with a low value of VMs to create and it works, change the value to a larger number and it craps out. Here's some helpful tips:
#      Everything is dependant upon the values of the variables. Check these first. 
#                 Make sure you are using a Windows Policy with Windows Servers.
#                 Verify you have adequate storage space and the name correct
#                 Verfiy the folder name is existing
#                 Try removing spaces.
#                 Make sure you are connected to the right vCenter server
#    Sometimes it helps to close out powershell ISE and reopen. This erases the values of the variables and allows you to connect fresh.
#    If all that fails, try spinning in your chair 12 times and walking a straight line. 
