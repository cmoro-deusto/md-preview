function md --description 'Render a Markdown file as dark HTML in /tmp and open it in the default browser'
    if test (count $argv) -ne 1
        echo "usage: md FILE.md" >&2
        return 1
    end

    set -l src $argv[1]
    if not test -f $src
        echo "md: '$src' is not a file" >&2
        return 1
    end

    if not command -q pandoc
        echo "md: pandoc is not installed" >&2
        return 1
    end

    # assets ship next to this file (fisher copies functions/__md_preview/ along with it)
    set -l assets (path dirname (functions --details md))/__md_preview
    if not test -d $assets
        echo "md: assets not found in $assets" >&2
        return 1
    end

    set -l name (path basename $src)
    set -l out /tmp/(path change-extension html $name)

    pandoc $src \
        --from=gfm \
        --to=html5 \
        --standalone \
        --toc \
        --toc-depth=3 \
        --embed-resources \
        --template=$assets/template.html \
        --css=$assets/github-markdown-dark.css \
        --syntax-highlighting=$assets/syntax.theme \
        --resource-path=(path dirname $src) \
        --metadata pagetitle=$name \
        --output=$out
    or return

    # fish's `open` hands the file to the default application for text/html (via xdg-open on Linux)
    open $out
end
