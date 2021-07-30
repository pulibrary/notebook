# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_subjects

  private

  def set_subjects
    @subjects = Subject.all
  end
end
