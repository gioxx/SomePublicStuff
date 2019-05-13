# Firefox: Avengers Endgame New Tab Wallpaper

### Dependencies:

- `%AppData%\Mozilla\Firefox\Profiles\NOMEPROFILO\chrome\wallpaper.jpg`
- `%AppData%\Mozilla\Firefox\Profiles\NOMEPROFILO\chrome\userContent.css`

Lo sfondo (`wallpaper.jpg`) dovrà trovarsi all'interno della cartella `chrome` del profilo di Firefox come spiegato nel vecchio articolo sul blog all'indirizzo https://gioxx.org/2017/12/04/firefox-57-modifica-dellaspetto-di-base/. Lo sfondo creato ad-hoc per **Avengers: Endgame** è disponibile - *insieme al file `userContent.css` già modificato* - all'indirizzo https://go.gioxx.org/fxavengersendgamezip.

L'articolo dedicato alla modifica è invece disponibile all'indirizzo https://go.gioxx.org/fxavengersendgame.

### userContent.css:

```css
@-moz-document url(about:newtab) {
	
	/* Modifico lo sfondo della nuova tab (uso wallpaper.jpg salvato nella stessa cartella dello userContent.css) */
    .activity-stream {
        background-image: url(wallpaper.jpg) !important;
        background-size:cover !important;
        background-attachment: fixed !important;
    }
    @media (min-width: 1280px) {
      .activity-stream main {
        /*margin-left: 625px !important;*/
        margin-left: 600px !important;
      }
    }
    @media (min-width: 1920px) {
      .activity-stream main {
          width: 736px !important;
        /*margin-left: 870px !important;*/
        margin-left: 800px !important;
      }
    }
	
	/* Modifico colori dei titoli tab nella pagina */
	.top-site-outer .title span {
		color: #ffffff !important;
	}
	.collapsible-section .section-title span {
		color: #ffffff !important;
	}
	
}
```