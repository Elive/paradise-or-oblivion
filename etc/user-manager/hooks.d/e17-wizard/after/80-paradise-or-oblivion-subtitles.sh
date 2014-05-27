#!/bin/bash
source /usr/lib/elive-tools/functions

# must be run from user
main(){
    # pre {{{
    local file language language_local videosdir

    language_local="${LANG%.*}"

    # }}}
    if [[ -z "${XDG_CONFIG_HOME}" ]] || [[ ! -d "$XDG_CONFIG_HOME" ]] ; then
        XDG_CONFIG_HOME="${HOME}/.config"
    fi
    # source after to have created it
    source "${XDG_CONFIG_HOME}/user-dirs.dirs"
    videosdir="$( xdg-user-dir VIDEOS )"

    # we don't have it, so don't do anything
    if [[ ! -e "$videosdir/Paradise or Oblivion.avi" ]] ; then
        exit
    fi


    if [[ -d "/usr/share/paradise-or-oblivion/subtitles" ]] ; then
        # first try, complete language
        for file in /usr/share/paradise-or-oblivion/subtitles/*
        do
            language="${file}"
            language="${language%.srt}"
            language="${language##*.}"
            if [[ "${language}" = "${language_local}" ]] ; then
                cp "$file" "${videosdir}/Paradise or Oblivion.srt"
                exit 0
            fi
        done

        # second try, short mode
        language_local="${language_local%_*}"
        for file in /usr/share/paradise-or-oblivion/subtitles/*
        do
            language="${file}"
            language="${language%.srt}"
            language="${language##*.}"

            language="${language%_*}"

            if [[ "${language}" = "${language_local}" ]] ; then
                cp "$file" "${videosdir}/Paradise or Oblivion.srt"
                exit 0
            fi
        done

        # nothing ? ok, use english then...
        cp -f "/usr/share/paradise-or-oblivion/subtitles/Paradise or Oblivion.en.srt" "${videosdir}/Paradise or Oblivion.srt"

    fi

}

#
#  MAIN
#
main "$@"

# vim: set foldmethod=marker :
