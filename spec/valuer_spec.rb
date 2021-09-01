# frozen_string_literal: true

RSpec.describe Valuer, "happy" do
  it do
    expect(
      Valuer.value(Integer, 20)
    ).to eq 20
  end

  it do
    expect(
      Valuer.value(Integer, "20", min: 20)
    ).to eq 20
  end

  it do
    expect(
      Valuer.value(Integer, "20", max: 20)
    ).to eq 20
  end
end

RSpec.describe Valuer, "raises" do
  it do
    expect do
      Valuer.value Integer, "20x"
    end.to raise_error(Valuer::Error)
  end

  it do
    expect do
      Valuer.value(Integer, "20", max: 19)
    end.to raise_error(Valuer::MaximumError)
  end

  it do
    expect do
      Valuer.value(Integer, "20", min: 21)
    end.to raise_error(Valuer::MinimumError)
  end
end

RSpec.describe Valuer, "saves" do
  it do
    expect(
      Valuer.value(Integer, "20x", default: -1)
    ).to eq(-1)
  end

  it do
    expect(
      Valuer.value(Integer, nil, default: -1)
    ).to eq(-1)
  end

  it do
    expect(
      Valuer.value(Integer, "20x", default: -2)
    ).to eq(-2)
  end
end

RSpec.describe Valuer, Float do
  it do
    expect(
      Valuer.value(Float, "0")
    ).to eq(0.0)
  end
end

RSpec.describe Valuer, TrueClass do
  it do
    expect(
      Valuer.value(TrueClass, "yes")
    ).to eq(true)
  end

  it do
    expect(
      Valuer.value(TrueClass, "no")
    ).to eq(false)
  end

  it do
    expect(
      Valuer.value(TrueClass, nil)
    ).to eq(false)
  end
end

RSpec.describe Valuer, FalseClass do
  it do
    expect(
      Valuer.value(FalseClass, "no")
    ).to eq(true)
  end

  it do
    expect(
      Valuer.value(FalseClass, "yes")
    ).to eq(false)
  end

  it do
    expect(
      Valuer.value(FalseClass, nil)
    ).to eq(false)
  end
end
