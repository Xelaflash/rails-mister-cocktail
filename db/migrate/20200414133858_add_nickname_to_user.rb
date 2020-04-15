# frozen_string_literal: true

class AddNicknameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :text
  end
end