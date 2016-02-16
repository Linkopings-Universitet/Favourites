# Favourites

## Containment controllers, modala vykontroller och UITableView

Ett av de absolut vanligaste sätten att presentera data på en iPhone eller iPad är genom en lista. Komponenten man använder för att göra detta heter tabellvy (eller "table view" på engelska). Allting från appar i App Store, kontakter i adressboken eller inställningar i inställningsappen visas med hjälp av en tabellvy och detta visar tecken på dess extrema flexibilitet. Har du någon gång använt en iPhone eller iPad så har du utan tvekan stött på en tabellvy någonstans.

Att få en tabellvy att visa simpel data är tämligen enkelt men det tar tid att bemästra denna vy fullt ut. I den här labben kommer du lära dig att visa data med hjälp av standardceller och hantera editing mode för att manipulera data i tabellen. Mer avancerade saker, såsom att flytta på data (drag-and-drop) eller söka i data kommer inte behandlas här. Detta får studeras på egen hand.

Av praktiska skäl placerar man ofta en tabellvy inuti en så kallad "navigation controller". En "navigation controller" kan ses som en stack av vy-kontroller. Vy-kontroller kan push:as och pop:as från vy-kontrollerstacken. En bakåtknapp läggs automatiskt till när en vy-kontroller push:as på vy-kontrollerstacken, så att användaren kan gå tillbaka till föregående vy-kontroller. Ett typexempel på hur detta fungerar är inställningsappen på iPhone. När ett nytt val väljs i tabellvyn så skapas en ny vy-kontroller för detta valet och push:as på vy-kontrollerstacken. När inställningar gjorts så kan användaren direkt gå tillbaka till föregående vyn med hjälp av knappen i övre vänstra hörnet. Så i grund och botten består inställningsappen en navigation kontroller med en tabellvy inuti. Detta är ett väldigt vanligt scenario, som du kommer pröva på i labbuppgiften.

För att ta tillvara på skärmutrymmet på iPad använder man ofta en "split view controller" istället för att pusha och poppa en navigation controller som ofta används på iPhone. En split view controller delar helt enkelt upp en liggande skärm i två delar och används väldigt ofta för att visa någon form av navigering i vänsterspalten och detaljer om objektet man valt i högerspalten. Exempel på det är mail-appen och inställningsappen på iPad. I kodskelettet för labben används en split view controller och ni ska i labben bekanta er med hur den fungerar.

Den sista av de vanligaste navigeringsmönstrena i iOS är modala vykontroller. Dessa används när man vill tvinga användaren att gå in i ett "läge" och utföra en specifik uppgift för att sedan tas tillbaka till det övriga gränsnittet. När man använder en modal vykontroller blockeras alla övriga vyer vilket ger användaren endast en sak att fokusera på. Exempel på detta hittar ni i mail-appen när man väljer att skriva ett nytt mail. I denna labb ska ni få skapa egna modala vykontroller och bekanta er med hur man hanterar dem.

I denna uppgift kommer du även att träna på hur MVC appliceras i en app och lära dig hur man på ett smidigt sätt hanterar en universal app med både gränsnitt för iPhone och iPad genom att återanvända sina vy-kontroller.

# Förberedelse

#### Länkar

* Guider 
	* [View Controller Programming Guide for iOS][view-controller-programming]
	* [View Controller Catalog - Navigation Controllers][view-controller-catalog-navigation]
	* [View Controller Catalog - Split View Controllers][view-controller-catalog-split]
* Dokumentation
	* [UITableView][uitableview]
	* [UITableViewController][uitableviewcontroller]
	* [UITableViewCell][uitableviewcell]
	* [UITableViewDelegate][uitableviewdelegate]
	* [UITableViewDataSource][uitableviewdatasource]
* Screencasts
	* [Delegering][delegering-video]
	* [NavigationController][navigation-controller-video]
	* [UITableView][uitableview-video]
	* [UITableView redigering][uitableview-redigering-video]

[view-controller-catalog-navigation]:https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html

[view-controller-catalog-split]:https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/SplitViewControllers.html#//apple_ref/doc/uid/TP40011313-CH7-SW1

[view-controller-programming]:https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/index.html#//apple_ref/doc/uid/TP40007457-CH2-SW1

[uitableviewdatasource]:https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/

[uitableviewdelegate]:https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDelegate_Protocol/

[uitableviewcell]:https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UITableViewCell_Class/index.html

[uitableviewcontroller]:https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewController_Class/

[uitableview]:https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/

[navigation-controller-video]:http://www.ida.liu.se/~725G72/material/screencasts/navigationcontroller.mp4

[delegering-video]:http://www.ida.liu.se/~725G72/material/screencasts/delegering.mp4

[uitableview-redigering-video]:http://www.ida.liu.se/~725G72/material/screencasts/uitableview-redigering.mp4

[uitableview-video]:http://www.ida.liu.se/~725G72/material/screencasts/uitableview.mp4

#### Frågor

Inga frågor är märkta för att redovisas till denna uppgift.

1. Vad är en cell i en tabellvy? Vilka olika typer av standardceller finns det? Vad innehåller en cell?

2. För en cell kan man ställa in en så kallad "accessory type". Vad innebär det? Vad för typer kan du välja på?

3. Det finns två olika stilar man kan välja för att visa celler i en tabellvy, "grouped" och "plain", förklara skillnaden mellan dessa. I sammanhanget används även begreppen "row" och "section". Vad innebär dessa?

4. Vad är en "datasource" i sammanhanget? Vad används en sådan till? Vad heter datasource-protokollet för tabellvyer? Vilka metoder måste du alltid implementera enligt detta protokoll?

5. När en cell ska visas anropas metoden tableView:cellForRowAtIndexPath: för att hämta cellen på en viss position i tabellvyn. Hur ser en enkel sådan metod ut i allmänhet? Det är av största vikt att du förklarar vad dequeueReusableCellWithIdentifier: används används till och varför.

6. Tabellvyer använder, förutom en datasource även en delegat. Vad heter delegat-protokollet? Nämn några saker man kan göra genom att överlagra metoder i delegat-protokollet.

7. Vad är en segue för något? Hur gör du för att skapa en segue och använda den?

8. Antag att du har en vy-kontroller inuti en navigation controller. Hur gör du för att push:a en vy-kontroller på dess stack och ge den nya vy-kontrollern data? För att pop:a den från stacken?

9. När du använder en UINavigationController får du automatiskt en titelrad längst upp på skärmen. Titelraden visar en titel för den aktuella vy-kontrollern, eventuellt en bakåtknapp i vänsterkanten och en valfri knapp i högerkanten. Hur gör du för att ändra titeln som visas i titelraden för en vy-kontroller (två sätt)? Hur gör du för att lägga till en egen knapp på högersidan i titelraden för en vy-kontroller? Notera att du ändrar titel och lägger till knappen i den vy-kontroller som du visar (inga ändringar i din navigation controller).

10. Modala vy-kontroller har nästan alltid egna delegatprotokoll. Vad används de till? Hur gör du för att presentera en modal vy-kontroller? Hur gör du för att stänga den och återgå till det övriga gränsnittet?

11. UISplitViewController har ett eget delegatprotokoll, vad används det till? Vad händer med en split-vy när man roterar skärmen?



## Uppgift

Den här uppgiften går ut på att utöka en primitiv länksamlingsapp med mer funktionalitet. I sitt nuvarande läge har appen ett enkelt gränsnitt med en tabellvy som visar länk-urler och en webbvy som visar länkarna. På iPhone sker detta med en navigation controller som pushar webbvyn när användaren väljer en länk. På iPad finns istället en split view controller som visar både länklistan och webbvyn samtidigt i liggande läge, medan den visar länksamlingen i en popover i stående läge. Allt detta sker med endast två subklasser av UIViewController och en modellklass.

Appen ska utökas så att användaren kan ta bort och lägga till länkar i samlingen samt att länkarna även ska kunna ha en titel. Detta ska ske genom editing mode och swipe-to-delete för borttagning och en modal vy-kontroller som innehåller ett "formulär" för att lägga till nya länkar. Ni måste använda samma vy-kontroller både för iPhone och iPad och den modala vy-kontrollern ska även bakas in i en UINavigationController med en "spara"- och en "avbryt"-knapp.

I tabellvyn som visar länkarna ska cellerna visar cellerna endast en URL för länkarna i appens nuvarande skepnad. Detta är inte så användarvänligt. Ni ska därför utöka modellklassen så att den kan hålla en titel. Tabellvycellerna ska sedan visa både titeln och URLen till länken. När användaren valt en länk ska länkens titel visas i navigation bar:en för vy-kontrollern som laddar länken.

Tyvärr kan inte appen spara någon data mellan sessioner ännu. Det är däremot inte något ni behöver åtgärda. Som bonus-uppgift kan ni om ni vill göra så att länkar lagras i en property-list-fil. Detta ligger dock utanför kursen. Längre fram i kursen kommer vi istället titta på hur man använder ramverket Core Data för att lagra objekt på enheterna.

* [Favorites](https://github.com/Linkopings-Universitet/Favourites/archive/master.zip)

## Redovisning

Packa ihop projektet och skicka per mail till din handledare. Ange '725G73 - Laboration 4 - Redovisning' som ämne. Skriv med vad du har för LiU-id (t ex abcde123) om du inte mailar från din studentadress.
