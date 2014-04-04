require 'sequel'

class TasksRepository
  def initialize(db)
    @tasks_table = db[:tasks]
  end

  def create(attributes)
    @tasks_table.insert(attributes)
  end

  def all
    @tasks_table.to_a
  end

  def filter_by_id(id)
    @tasks_table.where(:id => id)
  end

  def find(id)
    filter_by_id(id).to_a[0]
  end

  def update(id, attribute)
    filter_by_id(id).update(attribute)
  end

  def delete(id)
    filter_by_id(id).delete
  end
end