if (!exists("title")) {
    main_title = "heat2D"
} else {
    main_title = "" . title
}

if (!exists("data_dir")) {
    data_dir = "."
}

if (!exists("out_gif")) {
    out_gif = "anim.gif"
}

if (!exists("max_step")) {
    max_step = 9900
}

# Krok animacji na sztywno: 100
step_interval = 100

set terminal gif animate delay 7 size 800,600
set output out_gif

set autoscale fix
unset key

do for [i=0:int(max_step):step_interval] {
    set title sprintf("%s - Krok: %d", main_title, int(i))
    data_path = sprintf('%s/out_%d.data', data_dir, int(i))
    plot data_path with image
}

set output