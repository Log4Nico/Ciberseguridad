control 'paquetes-1.0' do
  impact 0.7
  title 'Comprobar net-tools y iproute2'
  desc 'Verificar si están instalados los paquetes net-tools y iproute2'

  describe package('net-tools') do
    it { should be_installed }
  end

  describe package('iproute2') do
    it { should be_installed }
  end
end
