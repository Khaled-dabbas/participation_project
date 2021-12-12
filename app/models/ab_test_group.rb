class AbTestGroup < ApplicationRecord
	has_many :participants
	# Bad example, but showcasing scopes.
	scope :find_by_group_name, -> (name) { where(group_name: name) }

end
