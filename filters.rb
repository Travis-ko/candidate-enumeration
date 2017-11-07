# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.select { |hash| hash[:id] == id }
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
    candidates.select { |hash|
                          experienced?(hash) &&
                          github_points(hash) &&
                          of_age(hash) &&
                          good_languages(hash)}
end

def github_points(candidate)
  candidate[:github_points] > 100
end

def of_age(candidate)
  candidate[:age] > 17
end

def good_languages(candidate)
  candidate[:languages].include?('Ruby') &&
  candidate[:languages].include?('Python')
end
