module NipMethods
  extend ActiveSupport::Concern

  included do
    validate :verify_nip, if: :nip?

    def nip=(value)
      write_attribute(:nip, value.to_s.delete(" ").delete("-"))
    end

    def nip_to_s
      nip.insert(3, " ").insert(6, " ").insert(9, " ") unless nip.empty?
    end

    private
    def verify_nip
      errors.add(:nip) unless Nvr.new(nip).valid?
    end
  end
end