require "rails_helper"

feature "Flexible square" do
  it "works with input 5", points: 1 do
    visit "/flexible/square/5"

    expect(page).to have_content("25")
  end

  it "works with any input", points: 5 do
    random_input = rand(100)

    visit "/flexible/square/#{random_input}"

    expected_output = random_input ** 2

    expect(page).to have_content(expected_output)
  end
end

feature "Flexible square root" do
  it "works with input 8", points: 1 do
    visit "/flexible/square_root/8"

    expect(page).to have_content("2.83")
  end

  it "works with any input", points: 5 do
    random_input = rand(100)

    visit "/flexible/square_root/#{random_input}"

    expected_output = (random_input ** 0.5).round(2)

    expect(page).to have_content(expected_output)
  end
end

feature "Flexible payment" do
  it "works", points: 5 do
    visit "/flexible/payment/324/5/14503"

    expect(page).to have_content("262.15")
  end

  it "formats large payments", points: 2, hint: I18n.t("hints.number_to_currency") do
    visit "/flexible/payment/410/30/250000"

    expect(page).to have_content("$1,208.00")
  end
end

feature "Square form" do
  it "has a form element", points: 2 do
    visit "/square/new"

    expect(page).to have_css("form")
  end

  it "has a label", points: 2 do
    visit "/square/new"

    expect(page).to have_css("label", text: "Enter a number")
  end

  it "has an input", points: 2 do
    visit "/square/new"

    expect(page).to have_css("input")
  end

  it "has a button", points: 2, hint: I18n.t("hints.button_type") do
    visit "/square/new"

    expect(page).to have_css("button", text: "Calculate square")
  end

  it "when submitted leads to the correct URL", points: 4, hint: I18n.t("hints.button_type") do
    visit "/square/new"

    expect(page).to have_css("form[action=\"/square/results\"]")
  end

  it "captures the user's input in the query string with a name", points: 4 do
    visit "/square/new"

    expect(page).to have_css("input[name]")
  end
end
