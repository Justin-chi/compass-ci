function tear_down_machines() {
    virtmachines=$(sudo virsh list --name |grep pxe)
    for virtmachine in $virtmachines; do
        echo "destroy $virtmachine"
        sudo virsh destroy $virtmachine
        if [[ "$?" != "0" ]]; then
            echo "destroy instance $virtmachine failed"
            exit 1
        fi
    done
    virtmachines=$(sudo virsh list --all --name |grep pxe)
    for virtmachine in $virtmachines; do
        echo "undefine $virtmachine"
        sudo virsh undefine $virtmachine
        if [[ "$?" != "0" ]]; then
            echo "undefine instance $virtmachine failed"
            exit 1
        fi
    done
    vol_names=$(sudo virsh vol-list default |grep .img | awk '{print $1}')
    for vol_name in $vol_names; do 
    echo "vol-list $vol_name"
        sudo virsh vol-delete  $vol_name  --pool default
        if [[ "$?" != "0" ]]; then
            echo "undefine instance $virtmachine failed"
            exit 1
        fi
    done
}
