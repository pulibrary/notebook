# frozen_string_literal: true

json.partial! "subjects/subject", subject: @subject
# json.array! @subjects, partial: "subjects/subject", as: :subject