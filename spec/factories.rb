Factory.define :user do |u|
  u.password "password"
  u.password_confirmation "password"
  u.email "elephant@gravastar.cz"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :other_user, :class => User do |u|
  u.password "password"
  u.password_confirmation "password"
  u.email "other@gravastar.cz"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :expense do |e|
  e.name "Nákup"
  e.price 500.0
  e.date "2011-01-01"
  e.association :user
  e.from_savings false
end

Factory.define :expense_other_month, :class => Expense do |e|
  e.name "Nákup2"
  e.price 500.0
  e.date "2011-02-01"
  e.user_id 1
  e.from_savings false
end

Factory.define :expense_other_week, :class => Expense do |e|
  e.name "Nákup2"
  e.price 500.0
  e.date "2011-01-10"
  e.user_id 1
  e.from_savings false
end

Factory.define :expense_from_savings, :class => Expense do |e|
  e.name "Z uspor"
  e.price 2000.0
  e.date "2011-01-01"
  e.user_id 1
  e.from_savings true
end

Factory.define :fixed_expense do |f|
  f.name "Mzda"
  f.amount 10000.0
  f.user_id 1
end
