<?xml version="1.0"?>

<queryset>
  
  <rdbms>
    <type>postgresql</type>
    <version>7.2</version>
  </rdbms>
  
  <fullquery name="acs_mail_post_request">
      <querytext>
	select acs_mail_nt__post_request(:party_from, :party_to, :subject, :message)
      </querytext>
  </fullquery>

  <fullquery name="spam_full_sql">
      <querytext>

    select
        p2.*,
        parties.email as user_email,
        persons.first_names as user_first_names,
        persons.last_name as user_last_name,
        persons.first_names || ' ' || persons.last_name as user_name
    from
        parties
        left join persons on parties.party_id = person_id
        join ($sql_query) p2 on p2.party_id = parties.party_id

      </querytext>
  </fullquery>


</queryset>





