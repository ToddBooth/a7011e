#!/bin/bash

member_id1=$(aws identitystore create-user \
      --region 'eu-north-1' \
      --identity-store-id 'd-c3671ffba8' \
      --user-name 'test-27' \
      --name Formatted=string,FamilyName='Marteni',GivenName='Amin' \
      --display-name 'Amin Marteni' \
      --emails Value='Aws+test-27@ToddBooth.com',Type=Ltu-a7011e,Primary=true \
      --preferred-language 'en-us' \
      --locale 'SE' \
      --timezone 'Europe/Stockholm'
    )
    
# Extract the second value
tmp=$(echo $member_id1)
echo "tmp: $tmp"

member_id2=$(echo $tmp | awk '{print $2}')
echo "tmp p2: $member_id2"

member_id2=$(echo $tmp | awk '{print $3}')
echo "tmp p3: $member_id2"

exit 1

aws identitystore create-group-membership \
      --identity-store-id d-c3671ffba8 \
      --group-id 40fc59bc-e061-7011-cf35-47fab24198cf \
      --member-id "UserId=$member_id2"
