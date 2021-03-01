:put "[LV-ALERT] Carregando Script"
:put ""
:delay 2s

:put "[LV-ALERT] Configurar Pool"
:put "Digite o Pool:"
:global readIPPool do={:return}
:local ipPool [$readIPPool]
:put ""
:delay 1s

:put "Nome do Pool:"
:global readNomePool do={:return}
:local nomePool [$readNomePool]
:put ""
:delay 1s
/ip pool add ranges=$ipPool name=$nomePool

:put "[LV-ALERT] Configurar Profile"
:put "Digite a Loopback do Equipamento:"
:global readLoopback do={:return}
:local loopback [$readLoopback]
:put ""
:delay 1s
/ppp profile add name=PPPoE local-address=$loopback remote-address=$nomePool dns-server=8.8.8.8,1.1.1.1

:put "[LV-ALERT] Configurar VLAN"
:put "Digite a Primeira VLAN:"
:global readFristVlan do={:return}
:local fristVlan [$readFristVlan]
:put ""
:delay 1s

:put "Digite a Ultima VLAN:"
:global readSecondVlan do={:return}
:local secondVlan [$readSecondVlan]
:put ""
:delay 1s

:put "Digite o Nome da VLAN:"
:global readVlanName do={:return}
:local vlanName [$readVlanName]
:put ""
:delay 1s

:put "Digite o Nome da Ether Fisica:"
:global readInterfaceName do={:return}
:local interfaceName [$readInterfaceName]
:put ""
:delay 1s

:for i from $fristVlan to $secondVlan do={
    /int vlan add name=("VLAN" . $i . "-$vlanName") vlan-id=$i interface=$interfaceName
    /interface pppoe-server server add service-name=("PPPoE-VLAN" . $i . "-$vlanName") interface=("VLAN" . $i . "-$vlanName") max-mru=1480 max-mtu=1480 mrru=1500 default-profile=PPPoE disabled=no
}