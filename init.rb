Redmine::Plugin.register :mtasks do
  name 'Mtasks plugin'
  author 'Mihail Ivanov'
  description 'This is a TODO plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/mihail-ivanov/mtasks'
  author_url 'http://muplextech.com'

  project_module :mtasks do
    permission :view_mtasks, mtasks: :index
    permission :create_mtasks, mtasks: :create
    permission :edit_mtasks, mtasks: :edit
    permission :destroy_mtasks, mtasks: :destroy
    permission :finish_mtasks, mtasks: :finish
    permission :restore_mtasks, mtasks: :restore
  end
  menu :project_menu, :mtasks, { :controller => 'mtasks', :action => 'index' }, :caption => 'Mtasks', :after => :activity, :param => :project_id
end
