def ip_checker(ipv4)
  addr = ipv4.split(".")

  if addr.length != 4
    false
  else
    addr.all? { |quart| (0..255).include?(quart.to_i) && quart == quart.to_i.to_s}
  end
end

if ARGV.length != 0
  print ip_checker(ARGV[0])
else
  print "Ви маєте передати параметр при запуску програми!"
end