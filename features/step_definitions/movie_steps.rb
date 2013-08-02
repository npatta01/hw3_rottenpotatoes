# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    @movie = Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
 page.body.should match ( /#{e1}.*#{e2}/m )
end


Then /I should see all of the movies/ do
  movies = Movie.select(:title).map(&:title)
  page_movies= page.all('table#movies tbody tr td:nth-child(1)')

  visible_movies =[]

  page_movies.each do |elem|
    visible_movies.push(elem.native.text)
  end

  visible_movies.size.should == 10
  movies.should match_array(visible_movies)


end

# Given set of ratings, verifies all the movies in the database are visible/not visible in site
#
Then /I should (not )?see movies rated: (.*)/ do |not_contains, rating_list|
  rating_list = rating_list.gsub(/\s+/, "").split(",")

  if not_contains #if negation, get other ratings
    rating_list= Movie.all_ratings() - rating_list
  end

  db_movies = Movie.select(:title).where(:rating => rating_list).map(&:title)

  page_movies= page.all('table#movies tbody tr td:nth-child(1)')

  visible_movies =[]

  page_movies.each do |elem|
    visible_movies.push(elem.native.text)
  end

  db_movies.should_not be_empty
  db_movies.should match_array(visible_movies)

end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"



Given(/^I (un)?check the following ratings: (.*)/) do |unchecked, ratinglist|
  r_list = ratinglist.gsub(/\s+/, '').split(',')

  r_list.each { |rate|
    rating = "ratings[#{rate}]";
    if unchecked
        uncheck rating
    else
      check rating
    end
  }
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end



Given(/^I check the following ratings:G,PG,PG\-(\d+),NC\-(\d+),R$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end



Given(/^I (un)?check all the ratings$/) do |condition|
  rating=Movie.all_ratings().join(',')
  if condition
    step "I uncheck the following ratings: #{rating}"
  else
    step "I check the following ratings: #{rating}"
  end
end