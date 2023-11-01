import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/card.dart';

const _supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlpbHdvaXZuamJ5cGV0a2ZzeXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0NTI0NTUsImV4cCI6MjAxMjAyODQ1NX0.3zWKrWYXRDAQ6s1QB3c7wcymA642SQSJluxGXFC4C_8";
const _supabaseUrl = "https://yilwoivnjbypetkfsyyo.supabase.co";

final supabase = SupabaseClient(_supabaseUrl, _supabaseKey);

// - Card Set Requiriments - //
// Legend
// Double Faced Battle
// Single Faced U R M
// Double Faced U R M
// Uncommons
// Commons
// Land

List<Card> generateCardsList(List<Map<String, dynamic>> response) {
  List<Card> cards = [];
  if (response.isNotEmpty) {
    for (var card in response) {
      cards.add(Card.fromJson(card));
    }
  } else {
    print("Response from database is empty.");
  }
  return cards;
}

Future<List<Card>> getLegendCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mul")
        .neq("rarity", "common");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}

Future<List<Card>> getDoubleFacedBattleCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mom")
        .neq("rarity", "common")
        .eq("double_faced", "true")
        .eq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}

Future<List<Card>> getSingleFacedCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mom")
        .neq("rarity", "common")
        .neq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}

Future<List<Card>> getDoubleFacedCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mom")
        .neq("rarity", "common")
        .eq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}

Future<List<Card>> getUncommonCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mom")
        .eq("rarity", "uncommon")
        .neq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}

Future<List<Card>> getCommonCards() async {
  List<Card> cards = [];
  try {
    List<Map<String, dynamic>> response = await supabase
        .from("cards")
        .select<PostgrestList>("*, face_front(*), face_reverse(*)")
        .eq("card_set", "mom")
        .eq("rarity", "common")
        .neq("double_faced", "true")
        .neq("double_faced_battle", "true");

    cards = generateCardsList(response);
  } on Exception catch (exception) {
    print("Error: ${exception.toString()}");
  }
  return cards;
}
