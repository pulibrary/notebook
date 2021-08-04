# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_subjects
  before_action :authenticate_user!

  private

    def set_subjects
      @subjects = current_user.subjects.all if current_user
    end
end
