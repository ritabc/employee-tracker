require('spec_helper')

describe(Division) do
  describe('#employees') do
    it('tells which employees are in the division') do
      division = Division.create({:title => 'Sales'})
      employee1 = Employee.create({:name => 'Tedd', :division_id => division.id})
      employee2 = Employee.create({:name => 'Sally', :division_id => division.id})
      expect(division.employees).to(eq([employee1, employee2]))
    end
  end
end
