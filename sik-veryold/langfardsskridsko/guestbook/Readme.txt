Copyright (C) 2005, Script by RP-Draw WebDesign, Delfzijl, Netherlands
http://www.rp-draw.nl/scripts/index.html - info@rp-draw.nl
Version 2.1.01 - 28-03-2005


GPL LICENCE
This file is part of Flat-Guest guestbook.

Flat-Guest guestbook is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Flat-Guest guestbook is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Flat-Guest guestbook; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


INSTALLATION
1. Unzip the guestbook.zip file.
2. Edit the PASSWORD and color settings in the fggbook.php 
   and g-style.css using a standerd textediter.
3. Edit the WEBSITE address settings in the fggbook.php 
   and g-style.css using a standerd textediter.
4. Upload the Guestbook Folder in your virtual directory on your
   website.
5. Enable Write Access to data.dat by everyone, so CHMOD to 777.
6. Open fggbook.php file in your browser.
   http://www.your-domain.com/your-guestbook-directory/fggbook.php

If you want to delete a Message you need to enter your PASSWORD.
The default password is "12345". But you should use your own 
password (see line 2).
To delete a message click on the "lock"-image infront of the 
message date. 

To include the file within your website you can use either:
- Page: open it in its own "page".
- Frames: so you open the fggbook.php inside its onw frame.
- iFrame: so you can open the fggbook.php in a page with its 
own header and footer content.

For more advanced user:

- PHP include so you can open the fggbook.php in a page with 
its own header and footer content. 
(* this option is not yet checked! )
