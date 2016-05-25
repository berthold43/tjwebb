<?

###########################################################################
#
# PHP Counter script.
#
# Copyright 2006 Host45.com, Inc.
# Web and Email Hosting
# http://www.host45.com
#
###########################################################################

    if(!file_exists("counter.txt")) {
        die("Unable to open the counter.txt file! Please create it and set correct permissions.<br>");
    } else {
                $file = fopen("counter.txt", "r");
                $num = fgets($file,4096);
                $num += 1;
                fclose($file);
  
                $file2 = fopen("counter.txt", "w");
                fputs($file2, $num);
                fclose($file2);
    }
    
    echo "This page has been viewed " . $num . "times.";
?>