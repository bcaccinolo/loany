defmodule Loany.LoanRequestTest do
  use ExUnit.Case
  import Ecto.Changeset

  describe "form_changeset" do
    test "email params are NOT valid" do
      loan_request = %Loany.LoanRequest{}
      params = %{email: "not_valid_email"}

      changeset = Loany.LoanRequest.form_changeset(loan_request, params)
      assert changeset.valid? == false
    end

    test "phone params are NOT valid" do
      loan_request = %Loany.LoanRequest{}
      params = %{phone: "42565758a"}

      changeset = Loany.LoanRequest.form_changeset(loan_request, params)
      assert changeset.valid? == false
    end

    test "amount params are NOT valid" do
      loan_request = %Loany.LoanRequest{}
      params = %{amount: "0"}

      changeset = Loany.LoanRequest.form_changeset(loan_request, params)
      assert changeset.valid? == false
    end
  end

  describe "changeset_from_params_and_scoring" do
    params = %{name: "linus", email: "valid@email.se", phone: "42424242", amount: "2"}

    changeset = Loany.LoanRequest.changeset_from_params_and_scoring(params)
    assert changeset.valid?
    assert {:ok, 9.99} = fetch_change(changeset, :rate)
  end
end
