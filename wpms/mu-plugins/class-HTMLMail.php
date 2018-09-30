<?php
/**
 *  A class helping in the construction of an HTML template
 */

namespace S60;

class HTMLMail
{
    // holds the title of the mail
    private $title = '';

    // the image url to be displayed in the header
    private $header_image_url = '';

    // the message content
    private $message = '';

    // the footer content
    private $footer = '';

    // set a property
    public function set($property, $value)
    {
        if (!isset($this->{$property})) {
            trigger_error('Trying to assign '.$value.' to a non available property '.$property);
            return false;
        }

        $this->{$property} = $value;
        
        return $this;
    }

    private function getImage()
    {
        if (empty($this->header_image_url)) {
            return false;
        }

        return '<tr>'.
          '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;box-sizing:border-box;">'.
            '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">'.
              '<tr>'.
                '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;">'.
                  '<img style="height:auto;width:100%;max-width:800px;" src="'.$this->header_image_url.'" alt="" />'.
                '</td>'.
              '</tr>'.
            '</table>'.
          '</td>'.
        '</tr>';
    }

    private function getFooter()
    {
        if (empty($this->footer)) {
            return false;
        }

        return
        '<tr>'.
            '<td class="wrapper" style="font-family:sans-serif;font-size:17px;vertical-align:top;box-sizing:border-box;padding:20px;">'.
                '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">'.
                    '<tr>'.
                        '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;text-align: center">'.
                            $this->footer.
                        '</td>'.
                    '</tr>'.
                '</table>'.
            '</td>'.
        '</tr>';
    }

    private function getBody()
    {
        if (empty($this->message)) {
            return false;
        }

        return
        '<tr>'.
            '<td class="wrapper" style="font-family:sans-serif;font-size:17px;vertical-align:top;box-sizing:border-box;padding:20px 30px 20px 30px;">'.
                '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">'.
                    '<tr>'.
                        '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;">'.
                            $this->message.
                        '</td>'.
                    '</tr>'.
                '</table>'.
            '</td>'.
        '</tr>';
    }

    private function renderSeparator()
    {
        return
        '<tr>'.
            '<td class="wrapper" style="font-family:sans-serif;font-size:17px;vertical-align:top;box-sizing:border-box;padding:20px;">'.
                '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;border-top:2px solid #eeeeee">'.
                    '<tr><td></td></tr>'.
                '</table>'.
            '</td>'.
        '</tr>';
    }

    public function getTemplate()
    {
        return
        '<table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;background-color:#f6f6f6;width:100%;">'.
            '<tr>'.
                '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;">&nbsp;</td>'.
                '<td class="container" style="font-family:sans-serif;font-size:17px;vertical-align:top;display:block;max-width:800px;padding:10px;width:100%;margin:0 auto !important;">'.
                    '<div class="content" style="box-sizing:border-box;display:block;Margin:0 auto;max-width:800px;padding:10px;">'.
                    //<!-- START CENTERED WHITE CONTAINER -->
                    '<table class="main" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;background:#fff;border-radius:3px;width:100%;">'.
                        $this->getImage().
                        $this->getBody().
                        $this->renderSeparator().
                        $this->getFooter().
                    '</table>'.
                    //<!-- END CENTERED WHITE CONTAINER -->
                    '</div>'.
                '</td>'.
                '<td style="font-family:sans-serif;font-size:17px;vertical-align:top;">&nbsp;</td>'.
            '</tr>'.
        '</table>';
    }

    public function generate()
    {
        return
        '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'.
        '<html xmlns="http://www.w3.org/1999/xhtml">'.
            '<head>'.
                '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'.
                '<meta name="viewport" content="width=device-width">'.
            '</head>'.
            '<body bgColor="#f6f6f6">'.
                $this->getTemplate().
            '</body>'.
        '</html>';
    }
}
