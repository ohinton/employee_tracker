require ('spec_helper')

describe(Division) do
  describe("#employees") do
    it("tells which employees belong to it") do
      test_division = Division.new({:name => 'HR'})
      test_employee = test_division.employees().new({:name => 'John Doe'})
      test_division.save()
      test_employee.division()
      expect(test_employee.division()).to(eq(test_division))
    end
  end
end
