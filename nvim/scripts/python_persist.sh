#!/bin/bash
read -d '' script
sess_id=$1
TAB='    '
# this demarshals objects stored in the session file into the running environment.
script_prefix="with open('/tmp/pypersist/$sess_id', 'r') as __PERSIST_FILE__:\n${TAB}for k, v in __import__('ast').literal_eval(__PERSIST_FILE__.read()).items():\n${TAB}${TAB}globals()[k] = __import__('marshal').loads(v) if type(__import__('marshal').loads(v)) is not __import__('types').CodeType else __import__('types').FunctionType(__import__('marshal').loads(v), globals())\n"
# this marshals and dumps objects from the running environment into the session file.
script_suffix="\nwith open('/tmp/pypersist/$sess_id', 'w') as __PERSIST_FILE__:\n${TAB}__PERSIST_FILE__.write(str({k: __import__('marshal').dumps(v) if type(v) is not __import__('types').FunctionType else __import__('marshal').dumps(v.__code__) for k, v in globals().items() if not k.startswith('__')}))"
if [ ! -d /tmp/pypersist ]; then
    mkdir /tmp/pypersist
fi
if [ -f /tmp/pypersist/$sess_id ]; then
    echo -e "$script_prefix$script$script_suffix"
else
    echo -e "$script$script_suffix"
fi
