<?php
exec("/usr/local/appup/appup.sh",$res,$rc);
if($rc=="0") {
echo "��ʽ�������";
}
else{
echo "��ʽ����ʧ�ܣ�����ϵϵͳ����Ա�鿴ԭ��";
}
?>
