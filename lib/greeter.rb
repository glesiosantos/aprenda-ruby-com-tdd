class Greeter
  DEFAULT_LANGUAGE = :pt

  MESSAGES = {
    pt: "Ola",
    en: "Hello",
    es: "Hola"
  }.freeze

  def self.hello(name = "mundo", language: DEFAULT_LANGUAGE)
    greeting = MESSAGES.fetch(language) { MESSAGES.fetch(DEFAULT_LANGUAGE) }
    "#{greeting}, #{name}!"
  end
end
