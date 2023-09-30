# frozen_string_literal: true

class ReadersController < ApplicationController
  def all
    readers = Reader.all
    render(json: readers.as_json)
  end

  def find
    reader = Reader.find_by(id: params[:id])
    render(json: reader.as_json)
  end

  def create
    reader = Reader.create(allowed_params)
    render(json: reader.as_json)
  end

  def update
    reader = Reader.find_by(id: params[:id])
    reader.update(allowed_params)
    render(json: reader.as_json)
  end

  def delete
    reader = Reader.find_by(id: params[:id])
    render(json: reader.destroy.as_json)
  end

  private

  def allowed_params
    params.permit(:name, :email)
  end
end
