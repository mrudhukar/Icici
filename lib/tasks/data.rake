require "csv"

namespace :generate do
  task :data => :environment do
    ActiveRecord::Base.transaction do
      u = User.first || User.create!(:name => "Seshasayee Paper and Boards Ltd.", :email => "mrudhukar@chronus.com", :password => "test123",:password_confirmation => "test123")
      CSV.foreach("public/spb_template.csv") do |row|
        policy = Policy.new(
          :user => u,
          :product_type => row[0],
          :number => row[1],
          :insurer => row[2],
          :premium => row[3],
          :start => row[4],
          :end => row[5],
          :intimation_required => (row[6] == "Y") ? true : false
        )
        if policy.valid?
          policy.save!
        else
          puts policy.errors.inspect
          puts "********************************"
        end
      end

      CSV.foreach("public/open_claims.csv") do |row|
        p = Policy.find_by_number(row[0])
        claim = Claim.new(:policy => p, :user => u, :reference_number => row[1],
         :loss_date => row[2], :cause => row[3], :gross_amount => row[4], :status => row[5])
        if claim.valid?
          claim.save!
        else
          puts claim.errors.inspect
          puts "********************************"
        end
      end

      CSV.foreach("public/closed_claims.csv") do |row|
        p = Policy.find_by_number(row[0])
        claim = Claim.new(:policy => p, :user => u, :reference_number => row[1],
         :loss_date => row[2], :cause => row[3], :gross_amount => row[4], :status => row[5])
        if claim.valid?
          claim.save!
        else
          puts claim.errors.inspect
          puts "********************************"
        end
      end
    end
  end 
end