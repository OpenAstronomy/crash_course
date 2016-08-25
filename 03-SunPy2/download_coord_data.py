from sunpy.net.vso import VSOClient, attrs as a

import astropy.units as u

vc = VSOClient()

stereo = (a.Source('STEREO_B') &
          a.Instrument('EUVI') &
          a.Time('2011-01-01', '2011-01-01T00:10:00'))

aia = (a.Instrument('AIA') &
       a.Sample(24 * u.hour) &
       a.Time('2011-01-01', '2011-01-02'))

wave = a.Wave(30 * u.nm, 31 * u.nm)

results = vc.query(stereo | aia, wave)

vc.get(results, path='./03-SunPy2/data/{file}').wait(progress=True)