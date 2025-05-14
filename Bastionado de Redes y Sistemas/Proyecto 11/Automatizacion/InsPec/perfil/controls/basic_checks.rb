control 'network-config' do
  title 'Configuración de red estática'
  desc 'Verifica que la interfaz eth0 tiene una IP estática asignada'
  
  describe file('/etc/network/interfaces.d/eth0.cfg') do
    it { should exist }
    its('content') { should match /address 192\.168\.10\.10/ }
    its('content') { should match /gateway 192\.168\.10\.1/ }
  end
end

control 'required-packages' do
  title 'Paquetes requeridos instalados'
  desc 'Verifica que net-tools e iproute2 están instalados'

  %w(net-tools iproute2).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end

control 'ip-forwarding' do
  title 'IP Forwarding habilitado'
  desc 'Verifica que net.ipv4.ip_forward está activado'

  describe kernel_parameter('net.ipv4.ip_forward') do
    its('value') { should eq 1 }
  end
end
