module PartyRulesHelper

##Step 1:  Get list of all Party Rules
##Step 2:  Evaluate each rule to determine if song is okay

  def getPartyRules(party_id)
    @rules = Rule.where(party_id: party_id)
      rules_hash = {}
      conditions = @rules.map {|rule| rule.condition}
      conditions.uniq!
      conditions.each { |rules| rules_hash[rules.to_sym]= [] }
      @rules.each {|rule| rules_hash[rule.condition.to_sym].push(rule.banned_value) }
  end 

  def evaluatePartyRules(song, party_id)

    getPartyRules(party_id)



  end 