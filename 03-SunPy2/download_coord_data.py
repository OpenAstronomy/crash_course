import astropy.units as u
from sunpy.net import Fido
from sunpy.net import attrs as a

stereo = (a.vso.Source('STEREO_B') &
          a.Instrument('EUVI') &
          a.Time('2011-01-01', '2011-01-01T00:10:00'))

aia = (a.Instrument('AIA') &
       a.Sample(24 * u.hour) &
       a.Time('2011-01-01', '2011-01-02'))

wave = a.Wavelength(30 * u.nm, 31 * u.nm)

results = Fido.search(aia | stereo, wave)

res = Fido.fetch(results, path='./data/{file}')

