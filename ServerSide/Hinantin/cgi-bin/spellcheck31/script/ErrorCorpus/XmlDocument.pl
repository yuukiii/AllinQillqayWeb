#!/usr/bin/perl
#package CXmlDocument;

use BaseXClient;
use XML::Writer;
use IO::File;
use CErrorCorpus;
use lib '/usr/lib/cgi-bin/spellcheck31/script';
use SpellCheckBase;
#use SpellChecker;
use CXmlDocument;

eval {
  # Input variables
  my $text = "wasi, wasiiy, qan, ñawi, manamm, munaychá";
  my $squoiapath = "/usr/share/squoia";
  my $engine = "cuz_simple_foma";
  my $version = "v1.0-beta.1";
#  my $object = SpellCheckFiniteStateCmd->new(
#    FstFile => "$squoiapath/spellcheck.fst",
#    EngineName => $engine,
#    EngineVersion => $version,
#    Type => "cmd",
#  );

#  my $object = SpellCheckFiniteStateCTcp->new(
#    FstFile => "",
#    EngineName => "$slang",
#    EngineVersion => "v1.0-beta.1",
#    Type => "port",
#    PeerHost => '127.0.0.1',
#    PeerPort => '8888',
#    Proto => 'tcp',
#    );

    $object = SpellCheckFiniteStateNSpell->new(
    FstFile => "",
    EngineName => "$slang",
    EngineVersion => "v1.0-beta.1",
    Type => "cmd",
    Lang => "qu_EC",
    );
   #$object->AddDocumentToErrorCorpus($text);
   my $r = $object->DoesUserDictionaryContainEntry("Añay");
   if (not $r) {
     print "Does Not Exist... Adding it.\n";
     $object->AddEntryUserDictionary("Añay");
   }
   else {
     print "Exists\n";
   }
   #$object->DeleteEntryUserDictionary("Añay");

#  my $xmldoc = new CXmlDocument($object);
#  my ($filename, $xmlcontent) = $xmldoc->CreateXmlFile($text);
#  print "$xmlcontent";
#  $xmldoc->Add($filename, $xmlcontent);

};

# print exception
print $@ if $@;
