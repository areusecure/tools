 <?php

 /* Author Jonathan James (jj@areusecure.se)
*/

/* Configure your regular expressions here, they are used to match text in the DB and USER functions */
define('ALLOWED_INPUT','([a-zA-Z0-9.@:+\/_-åäöÅÄÖ\s]+)');

//Turn off magic quotes if not already done
set_magic_quotes_runtime(false);

class Filter {
        public function getInt($argv) {
                preg_match('([0-9]+)',(string)$argv, $match); //match $argv against 0-9 (could be 1+ characters)
                return @ $match[0]; //returns first match
        }
        public function getString($argv) {
                preg_match(ALLOWED_INPUT, (string)$argv, $match); //match $argv against ALLOWED_INPUT
                return @ $match[0]; //returns first match
        }
};

$filter = new Filter();

// Example of use, for example before constructing a PHPMailer-object and passing the parameters
// $email = $filter->getString($_POST["email"]);
// $name = $filter->getString($_POST["name"]);
// 
?>
