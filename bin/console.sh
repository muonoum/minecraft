#!/bin/sh
# https://github.com/muonoum/mcon
mcon --stdin /run/minecraft.stdin -- journalctl --lines all --follow --unit minecraft.service
