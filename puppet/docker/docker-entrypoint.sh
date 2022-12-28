echo "Configuring puppet to access puppet.ehook.stag.nossamae.com ..."

echo $(dig @resolver4.opendns.com puppet-load-balancer-2e46d911de8f1cff.elb.us-east-1.amazonaws.com +short) puppet.ehook.stag.nossamae.com >> /etc/hosts

puppet config set server puppet --section main
puppet config set server puppet --section agent
# puppet config set certname sp-sls-f290-v1-1044 --section agent
puppet config set certname sp-gw-f290-v1-0369 --section agent

echo "Puppet configured with success!"
while :; do
    #puppet agent --certname $HOSTNAME -tv
    puppet agent -tv --environment=$PUPPET_AGENT_ENVIRONMENT
    # --certname  
    # puppet agent --certname sp-sls-f290-v1-1044 -tv --server=puppet.ehook.stag.nossamae.com
    sleep 10
done