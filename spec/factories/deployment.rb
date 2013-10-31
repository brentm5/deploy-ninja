require 'factory_girl'

FactoryGirl.define do
  factory :deployment do
    tag "tag-01"
    branch "bm-sample-branch"
    commit_sha "6dbd0384fe6818af1eda8ae16ad2d4f302c9b046"
  end
end
