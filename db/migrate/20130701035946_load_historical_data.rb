class LoadHistoricalData < ActiveRecord::Migration
  def up
    # Create ddd stock entry
    ddd = Stock.new(:ticker => 'ddd')
    ddd.save(:validate => false)

# Create data points for ddd
    ddd1 = DataPoint.new
    ddd1.ticker = 'ddd'
    ddd1.stock = ddd
    ddd1.date = DateTime.new(2013, 06, 28)
    ddd1.open = 44.70
    ddd1.high = 45.10
    ddd1.low = 43.77
    ddd1.close = 43.90
    ddd1.volume = 7885400
    ddd1.save(:validate => false)

    ddd2 = DataPoint.new
    ddd2.ticker = 'ddd'
    ddd2.stock = ddd
    ddd2.date = DateTime.new(2013, 06, 27)
    ddd2.open = 44.79
    ddd2.high = 44.96
    ddd2.low = 44.26
    ddd2.close = 44.66
    ddd2.volume = 2603100
    ddd2.save(:validate => false)

    ddd3 = DataPoint.new
    ddd3.ticker = 'ddd'
    ddd3.stock = ddd
    ddd3.date = DateTime.new(2013, 06, 26)
    ddd3.open = 45.14
    ddd3.high = 45.56
    ddd3.low = 43.89
    ddd3.close = 44.05
    ddd3.volume = 3861100
    ddd3.save(:validate => false)

    ddd4 = DataPoint.new
    ddd4.ticker = 'ddd'
    ddd4.stock = ddd
    ddd4.date = DateTime.new(2013, 06, 25)
    ddd4.open = 43.33
    ddd4.high = 44.38
    ddd4.low = 43.26
    ddd4.close = 44.36
    ddd4.volume = 3559400
    ddd4.save(:validate => false)

# Create mmm stock entry
    mmm = Stock.new(:ticker => 'mmm')
    mmm.save(:validate => false)

# Create data points for mmm
    mmm1 = DataPoint.new
    mmm1.ticker = 'mmm'
    mmm1.stock = mmm
    mmm1.date = DateTime.new(2013, 06, 28)
    mmm1.open = 109.86
    mmm1.high = 110.47
    mmm1.low = 109.14
    mmm1.close = 109.35
    mmm1.volume = 3428500
    mmm1.save(:validate => false)

    mmm2 = DataPoint.new
    mmm2.ticker = 'mmm'
    mmm2.stock = mmm
    mmm2.date = DateTime.new(2013, 06, 27)
    mmm2.open = 110.54
    mmm2.high = 110.90
    mmm2.low = 109.97
    mmm2.close = 110.24
    mmm2.volume = 2229600
    mmm2.save(:validate => false)

    mmm3 = DataPoint.new
    mmm3.ticker = 'mmm'
    mmm3.stock = mmm
    mmm3.date = DateTime.new(2013, 06, 26)
    mmm3.open = 109.07
    mmm3.high = 109.98
    mmm3.low = 108.73
    mmm3.close = 109.68
    mmm3.volume = 2524400
    mmm3.save(:validate => false)

    mmm4 = DataPoint.new
    mmm4.ticker = 'mmm'
    mmm4.stock = mmm
    mmm4.date = DateTime.new(2013, 06, 25)
    mmm4.open = 108.20
    mmm4.high = 108.75
    mmm4.low = 107.54
    mmm4.close = 108.24
    mmm4.volume = 2676700
    mmm4.save(:validate => false)

# Create goog stock entry
    goog = Stock.new(:ticker => 'goog')
    goog.save(:validate => false)

# Create data points for goog
    goog1 = DataPoint.new
    goog1.ticker = 'goog'
    goog1.stock = goog
    goog1.date = DateTime.new(2013, 06, 28)
    goog1.open = 874.90
    goog1.high = 881.84
    goog1.low = 874.19
    goog1.close = 880.37
    goog1.volume = 2349300
    goog1.save(:validate => false)

    goog2 = DataPoint.new
    goog2.ticker = 'goog'
    goog2.stock = goog
    goog2.date = DateTime.new(2013, 06, 27)
    goog2.open = 878.80
    goog2.high = 884.69
    goog2.low = 876.65
    goog2.close = 877.07
    goog2.volume = 1926500
    goog2.save(:validate => false)

    goog3 = DataPoint.new
    goog3.ticker = 'goog'
    goog3.stock = goog
    goog3.date = DateTime.new(2013, 06, 26)
    goog3.open = 873.75
    goog3.high = 878.00
    goog3.low = 870.57
    goog3.close = 873.65
    goog3.volume = 1831400
    goog3.save(:validate => false)

    goog4 = DataPoint.new
    goog4.ticker = 'goog'
    goog4.stock = goog
    goog4.date = DateTime.new(2013, 06, 25)
    goog4.open = 877.26
    goog4.high = 879.68
    goog4.low = 864.51
    goog4.close = 866.20
    goog4.volume = 2553200
    goog4.save(:validate => false)

  end

  def down
    Stock.delete_all
    DataPoint.delete_all
  end
end
