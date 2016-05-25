<?php 
/**
 * Presentation of <code>Bildgalleri</code>
 * @author Erik Rosengren
 * @version 2007-06-27
 */
echo pageHeader(0,false,'Bildgalleri - Visa', 'Visa bildgalleri');
include 'bild' . DIRECTORY_SEPARATOR . 'bildgalleri_v.php';
echo pageFooter(); 
?>