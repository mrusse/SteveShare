<?php 

class ZipController implements ContentController
{
    public const ctype = 'static';
    
    //returns all extensions registered by this type of content
    public function getRegisteredExtensions(){return array('zip');}

    public function handleHash($hash,$url)
    {
        $path = getDataDir().DS.$hash.DS.$hash;

        if(in_array('raw',$url))
        {
            header('Content-Type: text/plain; charset=utf-8');
            echo file_get_contents($path);
        }
        else if(in_array('download',$url))
        {
            if (file_exists($path)) {
                header('Content-Description: File Transfer');
                header('Content-Type: application/octet-stream');
                header('Content-Disposition: attachment; filename="'.basename($path).'"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($path));
                readfile($path);
                exit;
            }
        }
        else
            renderTemplate('zip',array('hash'=>$hash,'content'=>htmlentities(file_get_contents($path))));
    }

    public function handleUpload($tmpfile,$hash=false)
    {
        if($hash===false)
        {
            $hash = getNewHash('zip',6);
            echo "<script>console.log('Debug Objects: " . $hash . "' );</script>";
        }
        else
        {
            if(isExistingHash($hash))
                return array('status'=>'err','hash'=>$hash,'reason'=>'Custom hash already exists');
        }


        storeFile($tmpfile,$hash,true);
        
        return array('status'=>'ok','hash'=>$hash,'url'=>getURL().$hash);
    }

    function getTypeOfText($hash)
    {
        return file_get_contents(getDataDir().DS.$hash.DS.'type');
    }
}