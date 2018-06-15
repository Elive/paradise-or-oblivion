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

        if [[ -e "$videosdir/Documentaries/Paradise or Oblivion.avi" ]] || [[ -e "$videosdir/Documentaries/The Choice is Ours.avi" ]] ; then
            videosdir="${videosdir}/Documentaries"
        else
            exit
        fi
    fi

    # Paradise or Oblivion

    if [[ -e "$videosdir/Paradise or Oblivion.avi" ]] ; then
        # first use english for fallback
        cp -f "/usr/share/paradise-or-oblivion/subtitles/Paradise or Oblivion.en.srt" "${videosdir}/Paradise or Oblivion.srt" 2>/dev/null

        if [[ -d "/usr/share/paradise-or-oblivion/subtitles" ]] ; then
            # short mode
            language_local="${language_local%_*}"
            for file in /usr/share/paradise-or-oblivion/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"

                language="${language%_*}"

                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/Paradise or Oblivion.srt"
                    #exit 0
                    break
                fi
            done

            # complete language
            for file in /usr/share/paradise-or-oblivion/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"
                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/Paradise or Oblivion.srt"
                    #exit 0
                    break
                fi
            done
        fi
    fi

    # The Choice is ours

    if [[ -e "$videosdir/The Choice is Ours.avi" ]] ; then
        # first use english for fallback
        cp -f "/usr/share/the-choice-is-ours/subtitles/The Choice is Ours.en.srt" "${videosdir}/The Choice is Ours.srt" 2>/dev/null

        if [[ -d "/usr/share/the-choice-is-ours/subtitles" ]] ; then
            # short mode
            language_local="${language_local%_*}"
            for file in /usr/share/the-choice-is-ours/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"

                language="${language%_*}"

                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/The Choice is Ours.srt"
                    #exit 0
                    break
                fi
            done

            # complete language
            for file in /usr/share/the-choice-is-ours/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"
                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/The Choice is Ours.srt"
                    #exit 0
                    break
                fi
            done
        fi
    fi


    # Introduction to RBE

    if [[ -e "$videosdir/Introduction to a Resource Based Economy.mp4" ]] ; then
        # first use english for fallback
        cp -f "/usr/share/introduction-rbe/subtitles/Introduction to a Resource Based Economy.en.srt" "${videosdir}/Introduction to a Resource Based Economy.srt" 2>/dev/null

        if [[ -d "/usr/share/introduction-rbe/subtitles" ]] ; then
            # short mode
            language_local="${language_local%_*}"
            for file in /usr/share/introduction-rbe/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"

                language="${language%_*}"

                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/Introduction to a Resource Based Economy.srt"
                    #exit 0
                    break
                fi
            done

            # complete language
            for file in /usr/share/introduction-rbe/subtitles/*
            do
                language="${file}"
                language="${language%.srt}"
                language="${language##*.}"
                if [[ "${language}" = "${language_local}" ]] ; then
                    cp -f "$file" "${videosdir}/Introduction to a Resource Based Economy.srt"
                    #exit 0
                    break
                fi
            done
        fi
    fi

}

#
#  MAIN
#
main "$@"

# vim: set foldmethod=marker :
