Rails31mongo::Application.routes.draw do
  get "test/time"
  get "test/write"
  get "test/read"
  get "test/pull"
  get "test/delete_all"

  match ':action(/:id)', :controller => 'test'
end
