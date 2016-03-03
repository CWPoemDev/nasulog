#
# @poem, has_next = Poem.where(user_id:xx).extending(LoadMorePagenation).load_more(:created_at, params[:last_ts], params[:count])
# (注: 返り値の１つめはActiveRecord_RelationではなくList)
module LoadMorePagenation
  extend ActiveSupport::Concern

  def load_more(column = :id, last_param = 0, num = 20)
    column = :id if column.blank?
    last_param = nil if last_param.blank?
    num = (num.present? && num.to_i>=0) ? num.to_i : 20

    data_all = self
    data_all = data_all.where("#{column.to_s} < ?", last_param) if last_param.present?
    data_all = data_all.order("#{column.to_s} DESC").limit(num+1)

    if data_all.length > num
      return data_all[0...num], true
    else
      return data_all, false
    end
  end
end
