class Flexo
  #passa un hash al costruttore (il valore di default è nil), se l'hash restituisce true (ovvero è diverso da false e nil)
  #converte per ogni coppia di k, v la chiave in simbolo e popola una tabella(hash).
  
  def initialize(hash = nil)
    @table = {}
    if hash
      hash.each_pair do |k, v|
        k = k.to_sym
        @table[k] = v
        make_new_member(k)
      end
    end
  end
  
  #restituisce il valore della tabella avente per chiave il simbolo "name"
  #equivale a farsi restituire il valore con la sintassi flexo_obj.name
  
  def [](name)
    @table[name.to_sym]
  end
  
  #imposta il valore della tabella con chiave "name" e valore "value"
  def []=(name, value)
    @table[name] = value
  end
  
  #definisce nella metaclasse i metodi per leggere e scrivere nella tabella
  #TODO le stringhe devono essere formattate per poter essere accessibili mediante
  #la notazione :xxx , possibile risolverlo con name.downcase.gsub(/\s+/, "_").to_sym che produce "stringa esempio" #=> stringa_esempio
  #si ricorda che l'hash viene valutato partendo dall'ultimo simbolo fino a risalire al primo.
  private
  def make_new_member(name)
    name = name.to_sym
    if !respond_to?(name)
      define_singleton_method(name) { @table[name] }
      define_singleton_method("#{name}=") { |x| @table[name] = x }
    else
    #TODO implementare un'eccezione nel caso in cui si inseriscano più simboli con lo stesso nome.
    end
    name
  end
  
end