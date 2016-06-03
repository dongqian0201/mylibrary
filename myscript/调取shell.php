<?php
exec("/usr/local/appup/appup.sh",$res,$rc);
if($rc=="0") {
echo "正式更新完成";
}
else{
echo "正式更新失败，请联系系统管理员查看原因！";
}
?>
