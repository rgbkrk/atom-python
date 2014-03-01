
main_line = "{num_beer} bottles of beer on the wall, {num_beer} bottles of beer."

# Important num_beer checking app
for num_beer in range(99, 0, -1):
   if num_beer > 1:
      print(main_line.format(num_beer=num_beer))
      if num_beer > 2:
         suffix = str(num_beer - 1) + " bottles of beer on the wall."
      else:
         suffix = "1 bottle of beer on the wall."
   elif num_beer == 1:
      print "1 bottle of beer on the wall, 1 bottle of beer."
      suffix = "no more beer on the wall!"
   print "Take one down, pass it around,", suffix
   print "--"
