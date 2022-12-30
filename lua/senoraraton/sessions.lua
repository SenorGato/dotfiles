local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  --auto_save_enabled = nil,
  --auto_restore_enabled = nil,
  --auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  --auto_session_create_enabled = true,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)

require('session-lens').setup({
    prompt_title = 'Sessions',
    path_display = {'shorten'},
})
