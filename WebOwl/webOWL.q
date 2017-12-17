[QueryItem="getEbookTitles"]
PREFIX : <http://www.semanticweb.org/ebookStore.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT ?p ?title
WHERE {
  ?p a :Ebook ; :title ?title .
}

[QueryItem="getEbookDetails"]
PREFIX : <http://www.semanticweb.org/ebookStore.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT ?p ?title ?author ?publisher
WHERE {
  ?p a :Ebook ; :title ?title ; :Author ?author ; :Publisher ?publisher .
}

[QueryItem="getEbookRating"]
PREFIX : <http://www.semanticweb.org/ebookStore.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT ?p ?rate ?by ?ebook
WHERE {
  ?p a :Rating ; :rating_number ?rate ; :User ?by ; :Ebook ?ebook .
}

[QueryItem="getUserPurchase"]
PREFIX : <http://www.semanticweb.org/ebookStore.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT ?p ?user ?ebook
WHERE {
  ?p a :Purchase ?a ; :User ?user ; :Ebook ?ebook .
}
