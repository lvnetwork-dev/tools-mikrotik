:put "[LV-ALERT] Carregando Script"
:put ""
:delay 2s

:put "Digite a Primeira VLAN:"
:global readFristVlan do={:return}
:local fristVlan [$readFristVlan]
:put ""
:delay 1s

:put "Digite a Segunda VLAN:"
:global readSecondVlan do={:return}
:local secondVlan [$readSecondVlan]
:put ""
:delay 1s

:put "Digite o Nome da Interface:"
:global readVlanName do={:return}
:local vlanName [$readVlanName]
:put ""
:delay 1s

:put "Digite o Nome da Interface:"
:global readInterfaceName do={:return}
:local interfaceName [$readInterfaceName]
:put ""
:delay 1s

:for i from $fristVlan to $secondVlan do={
    /int vlan add name=("VLAN" . $i . "-$vlanName") vlan-id=$i interface=$interfaceName
}