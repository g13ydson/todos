module Users::Contract
  class Create < Reform::Form
    include Dry

    property :email
    property :name

    validation :default do
      configure do
        config.messages = :i18n
        config.namespace = :user
      end

      required(:name).filled(:str?)
      required(:email).filled(:str?)
    end

    validation :email_uniqueness, if: :default do
      configure do
        config.messages = :i18n
        config.namespace = :user

        def email_unique?(value)
          User.where(email: value).empty?
        end
      end

      required(:email).filled(:email_unique?)
    end
  end
end
