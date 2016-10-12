#!/usr/bin/python
# -*- coding: utf-8 -*-
from slackclient import SlackClient
import subprocess
import vars

sc = SlackClient(vars.token)

# Define external commands
carinasCommand = "./carinas.sh"
eriksCommand = "./eriks.sh"

# Execute external commands, catch output
carinasProcess = subprocess.Popen(carinasCommand.split(), stdout=subprocess.PIPE)
carinasOutput, error = carinasProcess.communicate()

eriksProcess = subprocess.Popen(eriksCommand.split(), stdout=subprocess.PIPE)
eriksOutput, error = eriksProcess.communicate()

# Post to Slack channel
print sc.api_call(
        "chat.postMessage", channel=vars.channel, text="Dagens lunch på Carinas restaurang: " + carinasOutput,
        username=vars.username, icon_emoji=vars.icon_emoji
)
print sc.api_call(
        "chat.postMessage", channel=vars.channel, text="Dagens lunch på Eriks restaurang: " + eriksOutput,
        username=vars.username, icon_emoji=vars.icon_emoji
)
