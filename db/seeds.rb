# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({ name: 'Chicago '}, { name: 'Copenhagen '})
#   Mayor.create(name: 'Emanuel, city: cities.first)

module ActiveRecord
  class Base
    def self.reset_pk_sequence
      case ActiveRecord::Base.connection.adapter_name
        when 'SQLite'
          new_max = maximum(primary_key) || 0
          update_seq_sql = "update sqlite_sequence set seq = #{new_max} where name = '#{table_name}';"
          ActiveRecord::Base.connection.execute(update_seq_sql)
        when 'PostgreSQL'
          ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
        else
          raise "Task not implemented for this DB adapter"
      end
    end
  end
end


Category.destroy_all
Category.reset_pk_sequence
Category.create!([
                     {id: 1, name: 'Music', color: '#971e7b'},
                     {id: 2, name: 'Art', color: '#cc2274'},
                     {id: 3, name: 'Culinary', color: '#db1a19'},
                     {id: 4, name: 'Sports', color: '#f26425'},
                     {id: 5, name: 'Festivals', color: '#f0b93e'},
                     {id: 6, name: 'Green Events', color: '#8ed645'},
                     {id: 7, name: 'Contests', color: '#028f48'},
                     {id: 8, name: 'Seminars', color: '#02aab3'},
                     {id: 9, name: 'Theater', color: '#00e0df'},
                     {id: 10, name: 'Cinema', color: '#02b0dd'},
                     {id: 11, name: 'Fashion', color: '#1972db'},
                     {id: 12, name: 'Technology', color: '#123eb4'},
                     {id: 13, name: 'Expos & Trade Fairs', color: '#19177a'},
                     {id: 14, name: 'Theme Parks', color: '#462096'},
                     {id: 15, name: 'Product Launches', color: '#6800a9'},
                     {id: 16, name: 'Other', color: '#686868'}]
)

Event.delete_all
100.times do
  event = Event.create!(
      name: 'Sed ut perspiciatis unde omnis iste',
      summary: 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti.',
      price_string: '$' + Random.rand(100).to_s,
      start_date: Time.at(rand * Time.now.to_i).strftime('%Y/%-m/%-d'),
      end_date: Time.at(rand * Time.now.to_i).strftime('%Y/%-m/%-d'),
      start_time: Time.at(rand * Time.now.to_i).strftime('%H:%M%P'),
      end_time: Time.at(rand * Time.now.to_i).strftime('%H:%M%P')
  )
  rand_id = Category.first.id + Random.rand(15)
  event.category = Category.where(id: rand_id).first
  event.name = event.name + ' ' + event.category.name
  event.save!
end
