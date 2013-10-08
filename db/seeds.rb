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
                     {id: 1, name: 'Programming Tutorials: Learn to Code'},
                     {id: 2, name: 'Q & A: "I need help!"'},
                     {id: 3, name: "Code Communities: Other People's Code"},
                     {id: 4, name: "Design and Typography"},
                     {id: 5, name: 'Tech News'},
                     {id: 6, name: 'Tech Events: Hackathons and Meetups'},
                     {id: 7, name: 'Projects and Exercises'}
])

Link.destroy_all

Link.create! ([
    {category_id: 1,
     title: 'Code School',
     description: "CodeSchool does a great job of teaching you web development in a clear, fun, and engaging way from Beginner to Advanced. Follow along their instructors as they teach you through video lectures, slides, and coding challenges. Learn web development, design, typography, mobile development, programming, methodology, best practices, and more. Full access cost $20/month, but some classes are FREE.",
     url: 'http://www.codeschool.com',
     image: 'https://s3.amazonaws.com/uploads.uservoice.com/logo/design_setting/19701/original/code_school.png?1315327949'
    },
    {category_id: 2,
     title: 'Stack Overflow',
     description: "Stack Overflow is currently the web's premier source for programming help, questions, and answers. If you need help, run into an error, or want to offer help, visit Stack Overflow.",
     url: 'http://stackoverflow.com',
     image: 'http://blog.moovweb.com/content/uploads/2013/09/stackoverflow-logo.png'
    },
    {category_id: 3,
     title: 'GitHub',
     description: "Based off Git version control (https://www.codeschool.com/courses/try-git),  GitHub is the web's #1 source for hosting and sharing code with others.  A great way to learn to code is to see other people's code -- on GitHub.",
     url: 'http://github.com',
     image: 'http://www.wakanda.org/sites/default/files/blog/blog-github.png'
    },
    {category_id: 3,
     title: 'Codepen',
     description: "View, edit, favorite, and collect open-source code on Codepen! Codepen showcases some awesome work from great developers who allow you to probe, share, and edit their codes as you wish!",
     url: 'http://codepen.io',
     image: 'http://blog.codepen.io/wp-content/uploads/2012/07/Demo.jpg'
    },
    {category_id: 1,
     title: 'Code Academy',
     description: "\"Codecademy is the easiest way to learn how to code. It's interactive, fun, and you can do it with your friends.\" Learn everything from Web Fundamentals to Ruby, jQuery, Javascript, PHP, APIs, etc. through Codeacademy exercises and projects. See all their non-tracked courses, too (http://www.codecademy.com/courses/lang/all)",
     url: 'http://www.codeacademy.com',
     image: 'http://tech.co/wp-content/uploads/2012/07/Codecademy.png'
    },
    {category_id: 5,
     title: 'Hacker News',
     description: "Hacker News is the NY Times of technology. It is \"a social news website that caters to programmers and entrepreneurs, delivering content related to computer science and entrepreneurship.\" Articles collected through Hacker News represent the bleeding edge news source for technologists.",
     url: 'https://news.ycombinator.com/',
     image: 'http://www.brownsteinegusa.com/wp-content/uploads/2012/05/hackernews.gif'
    },
    {category_id: 6,
     title: 'Tech Crunch',
     description: "Tech Crunch publishes news, analysis, and profiles on startup companies, products and websites. Learn about the newest and coolest startups and gadgets here.",
     url: 'https://techcrunch.com/',
     image: 'http://www.directtrafficmedia.co.uk/uploads/blog/TechCrunch%20Logo.jpg'
    },
    {category_id: 6,
     title: 'Meetup.com',
     description: "\"Meetup is the world's largest network of local groups\" and the #1 website tech event organizers and groups use to organizer events, gatherings, hackathons, and more.",
     url: "http://www.meetup.com/" ,
     image: 'http://chan.catiewayne.com/c/src/135735520541.jpg'
    },
    {category_id: 7,
     title: 'Learn Code the Hard Way',
     description: "Learn Code the Hard Way is a source of quality free e-books and coding exercises that teach you to learn to code by doing.",
     url: 'http://learncodethehardway.org/',
     image: ''
    },
    {title: "Simple Icons", url: "http://simpleicons.org/", image: "",
     description: "Simple Icons is a free collection of icons to use in your website.",
     category_id: 4
    },
    {title: "Icon Finder", url: "http://iconfinder.com/", image: "",
     description: "Icon Finder is one of the largest sources of free and premium icons.",
     category_id: 4
    }

])

User.destroy_all
User.reset_pk_sequence
