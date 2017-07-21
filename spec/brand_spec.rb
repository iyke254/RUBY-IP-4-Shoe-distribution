require 'spec_helper'

describe Brand do
  it "has many stores" do
    test_brand = Brand.create({name: "Yike"})
    test_store = Store.create({name: "Xappos"})
    test_brand.stores.push(test_store)
    expect(test_brand.stores).to eq([test_store])
  end

  it "validates presence of name" do
    test_brand = Brand.create({name: ""})
    expect(test_brand.save).to eq(false)
  end

  it "converts the name to title case" do
    test_brand = Brand.create({name: "yike"})
    expect(test_brand.name).to eq("Yike")
  end
end