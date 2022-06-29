#cloud-boothook
#!/bin/bash

ec2_hostname=`curl http://169.254.169.254/latest/meta-data/hostname`
ec2_local_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
ec2_instance_id=`curl http://169.254.169.254/latest/meta-data/instance-id`
ec2_availability_zone=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`

# rds_db_endpoint=$1      # DB Endpoint Argument 

echo "
<!DOCTYPE html>
<html>
<style>
table, th, td {
  border:1px solid black;
}
</style>
<body>

<h2> Availablity Zone : ${ec2_availability_zone} </h2>
<table style="width:100%">
  <tr>
        <th> Instance Property </th>
        <th> Value </th>
  </tr>
  <tr>
        <td> Hostname </td>
        <td> ${ec2_hostname} </td>
  </tr>
  <tr>
        <td> Local IP </td>
        <td> ${ec2_local_ip} </td>
  </tr>
  <tr>
        <td> Instance ID </td>
        <td> ${ec2_instance_id} </td>
  </tr>
</table>

</body>
</html>
" > test-index.html
sudo cp -f test-index.html /var/www/html/index.html


# sed -i "s/$cfg['Servers'][$i]['host'] =.*/$cfg['Servers'][$i]['host'] = ${rds_db_endpoint}/g" /var/www/html/phpMyAdmin/config.inc.php 

sudo systemctl start httpd

