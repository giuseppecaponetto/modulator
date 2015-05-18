class Flexo
  #passa un attr_hash al costruttore (il valore di default è nil), se l'attr_hash restituisce true (ovvero è diverso da false e nil)
  #converte per ogni coppia di k, v la chiave in simbolo e popola una tabella(attr_hash).
  
  def initialize(attr_hash = nil, method_hash = nil)
    @attribute_table = {}
    @method_table = {}
    if attr_hash
      map_to_attribute_table(attr_hash) 
    end  
    if method_hash
      map_to_method_table(method_hash)  
    end
  end
  
  #restituisce il valore della tabella degli attributi avente per chiave il simbolo "name"
  #equivale a farsi restituire il valore con la sintassi flexo_obj.name
  
  def [](name)
    @attribute_table[name.to_sym]
  end
  
  #imposta il valore della tabella degli attributi con chiave "name" e valore "value"
  def []=(name, value)
    @attribute_table[name] = value
  end
  
  #restituisce il valore della tabella dei metodi avente per chiave il simbolo "name"
  #equivale a farsi restituire il valore con la sintassi flexo_obj.name
  
  def execute(name)
    @method_table[name.to_sym].call
  end
  
  def get_method(name)
    @method_table[name.to_sym]
  end
  
  #imposta il valore della tabella dei metodi con chiave "name" e valore "value"
  def set_method(name, value)
    @method_table[name] = value
  end
  
  #definisce nella metaclasse i metodi per leggere e scrivere gli attributi nella tabella
  #TODO le stringhe devono essere formattate per poter essere accessibili mediante
  #la notazione :xxx , possibile risolverlo con name.downcase.gsub(/\s+/, "_").to_sym che produce "stringa esempio" #=> stringa_esempio
  #si ricorda che l'attr_hash viene valutato partendo dall'ultimo simbolo fino a risalire al primo.
  private

  def make_new_member(name)
    name = name.to_sym
    if !respond_to?(name)
      define_singleton_method(name) { @attribute_table[name] }
      define_singleton_method("#{name}=") { |x| @attribute_table[name] = x }
    else
    #TODO implementare un'eccezione nel caso in cui si inseriscano più simboli con lo stesso nome.
    end
    name
  end
  
  #definisce nella metaclasse i metodi per leggere e scrivere i metodi nella tabella
  #TODO le stringhe devono essere formattate per poter essere accessibili mediante
  #la notazione :xxx , possibile risolverlo con name.downcase.gsub(/\s+/, "_").to_sym che produce "stringa esempio" #=> stringa_esempio
  #si ricorda che l'attr_hash viene valutato partendo dall'ultimo simbolo fino a risalire al primo.
  
  def make_new_method(name)
    name = name.to_sym
    if !respond_to?(name)
      define_singleton_method(name) { @method_table.get_method(name) }
      define_singleton_method("#{name}=") { |x| @method_table.set_method(name,value)}
    else
    #TODO implementare un'eccezione nel caso in cui si inseriscano più simboli con lo stesso nome.
    end
    name
  end
  
  #usato internamente per mappare i parametri del costruttore a delle tabelle interne.
  def map_to_attribute_table(hash)
      hash.each_pair do |k, v|
        k = k.to_sym
        @attribute_table[k] = v
        make_new_member(k)
      end
  end
  def map_to_method_table(hash)
      hash.each_pair do |k, v|
        k = k.to_sym
        @method_table[k] = v
        make_new_method(k)
      end
  end
  
end