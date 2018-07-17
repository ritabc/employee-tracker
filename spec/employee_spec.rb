require('spec_helper')

describe (Employee) do
  describe('#division') do
    it "identifies the division for a specific employee" do
      division = Division.create({:title => 'Sales'})
      employee = Employee.create({:name => 'Jeff', :division_id => division.id})
      expect(employee.division).to(eq(division))
    end
  end
end
