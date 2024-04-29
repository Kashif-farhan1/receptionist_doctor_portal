class Patient < ApplicationRecord
    belongs_to :receptionist
    belongs_to :doctor
end
