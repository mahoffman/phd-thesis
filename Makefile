all:
	cp ../plotly_book/images/* ./images/
	# apparently webshot/phantomjs can't render some plots...
	cp ../plotly_book/screenshots/* ./screenshots
	mkdir -p docs/images && cp images/* docs/images
	mkdir -p docs/screenshots && cp screenshots/* docs/screenshots
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', envir = new.env())"
	# convert manual png screenshots to pdf and replace the blank ones
	# mogrify -format pdf -density 150 -- *.png

clean:
	rm -r _bookdown_files/
	
