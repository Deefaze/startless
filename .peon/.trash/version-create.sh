if [ -f $ver ]; then
  eRor "Version file ($ver) already exists."
fi

setVersion 0 0 0

if [ ! -f $ver ]; then
  eRor "Version file ($ver) cannot be created : unknown reason."
fi

eWait "Dabu! $ver is ready for use !"

