require 'linkeddata'

module PublicationHelpers

=begin
   bf:providerStatement "New York : Alfred A. Knopf, 2012, c2001.";
     bf:publication [
     a bf:Provider;
     bf:providerDate "2012, c2001";
     bf:providerName [
       a bf:Organization;
       bf:label "Alfred A. Knopf"
     ];
     bf:providerPlace [
       a bf:Place;
       bf:label "New York "
     ]
   ];

   bf:providerStatement "Athēnai Athens, Greece : S.n.";
   bf:publication [
     a bf:Provider;
     bf:providerName [
       a bf:Organization;
       bf:label "S.n"
     ];
     bf:providerPlace [
       a bf:Place;
       bf:label "Athēnai Athens, Greece "
     ]
   ];

   bf:providerStatement "Washington, D.C. : SOA Watch, 2006-";
   bf:publication [
     a bf:Provider;
     bf:providerDate "[2006]-";
     bf:providerName [
       a bf:Organization;
       bf:label "SOA Watch"
     ];
     bf:providerPlace [
       a bf:Place;
       bf:label "Washington, D.C. "
     ]
   ];
=end

  self::PUBLICATION_SPARQL_QUERY = SPARQL.parse(" PREFIX bf: <#{RDF::Vocab::Bibframe.to_s}>
                                                  SELECT DISTINCT ?publication
                                                  WHERE {
                                                     ?instance a bf:Instance .
                                                     ?instance bf:publication ?publication .
                                                  }")

  self::PUBLISHER_NAME_SPARQL_QUERY = SPARQL.parse("PREFIX bf: <#{RDF::Vocab::Bibframe.to_s}>
                                                    SELECT DISTINCT ?publisher_name
                                                    WHERE {
                                                       ?instance a bf:Instance .
                                                       ?instance bf:publication ?publication .
                                                       ?publication a bf:Provider .
                                                       ?publication bf:providerName ?publisher .
                                                       ?publisher a bf:Organization .
                                                       ?publisher bf:label ?publisher_name .
                                                    }")

  self::PUBLISH_PLACE_SPARQL_QUERY = SPARQL.parse(" PREFIX bf: <#{RDF::Vocab::Bibframe.to_s}>
                                                    SELECT DISTINCT ?publish_place
                                                    WHERE {
                                                       ?instance a bf:Instance .
                                                       ?instance bf:publication ?publication .
                                                       ?publication a bf:Provider .
                                                       ?publication bf:providerPlace ?place .
                                                       ?place a bf:Place .
                                                       ?place bf:label ?publish_place .
                                                    }")

  self::PUBLISH_DATE_SPARQL_QUERY = SPARQL.parse("PREFIX bf: <#{RDF::Vocab::Bibframe.to_s}>
                                                  SELECT DISTINCT ?publish_date
                                                  WHERE {
                                                     ?instance a bf:Instance .
                                                     ?instance bf:publication ?publication .
                                                     ?publication a bf:Provider .
                                                     ?publication bf:providerDate ?publish_date .
                                                  }")

  self::COPYRIGHT_DATE_SPARQL_QUERY = SPARQL.parse("PREFIX bf: <#{RDF::Vocab::Bibframe.to_s}>
                                                    SELECT DISTINCT ?copyright_date
                                                    WHERE {
                                                       ?instance a bf:Instance .
                                                       ?instance bf:publication ?publication .
                                                       ?publication a bf:Provider .
                                                       ?publication bf:copyrightDate ?copyright_date .
                                                    }")
end