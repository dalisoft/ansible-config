# config.fish
if not pgrep -f ssh-agent > /dev/null
  eval (ssh-agent -c)
  set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -gx SSH_AGENT_PID $SSH_AGENT_PID
  set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
end
