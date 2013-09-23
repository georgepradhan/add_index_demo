class SetSumKarmaInUsers < ActiveRecord::Migration
  def self.up
    User.connection.execute(
      "UPDATE users 
      SET sum_karma = sum 
        FROM 
          (SELECT user_id, SUM(value) AS sum 
           FROM karma_points 
           GROUP BY user_id) karma_sums 
      WHERE users.id = karma_sums.user_id"
      )
  end
end
