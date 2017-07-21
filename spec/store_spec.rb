require 'spec_helper'

describe Store do
  it "has many brands" do
    test_store = Store.create({name: "Xappos"})
    test_brand = Brand.create({name: "Yike"})
    test_store.brands.push(test_brand)
    expect(test_store.brands).to eq([test_brand])
  end

  it "validates presence of name" do
    test_store = Store.create({name: ""})
    expect(test_store.save).to eq(false)
  end

  it "converts the name to title case" do
    test_store = Store.create({name: "xappos"})
    expect(test_store.name).to eq("Xappos")
  end
end