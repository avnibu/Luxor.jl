using Luxor, Colors

include("julia-logo.jl") # the julia logo coordinates

tic()

function draw_logo_clip(x, y)
    foregroundcolors = diverging_palette(rand(0:360), rand(0:360), 200, s = 0.99, b=0.8)
    gsave()
    translate(x-100, y)
    julialogomask() # use julia logo as clipping mask
    clip()
    for i in 1:500
        sethue(foregroundcolors[rand(1:end)])
        circle(rand(-50:350), rand(0:300), 15, :fill)
    end
    clipreset()
    grestore()
end

function main()
    Drawing(500, 500, "/tmp/clipping-tests.png")
    origin()
    background("white")
    setopacity(.4)
    foregroundcolors = diverging_palette(rand(0:360), rand(0:360), 200, s = 0.99, b=0.8)
    draw_logo_clip(0, 0)
    finish()
    preview()
end

main()
toc()
