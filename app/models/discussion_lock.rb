#  @note When we destroy the related user, it's using dependent:
#        :delete for the relationship.  That means no before/after
#        destroy callbacks will be called on this object.
class DiscussionLock < ApplicationRecord
  belongs_to :article
  belongs_to :locking_user, class_name: "User"

  include StringAttributeCleaner.for(:notes, :reason)

  validates :article_id, presence: true, uniqueness: true
  validates :locking_user_id, presence: true
end
