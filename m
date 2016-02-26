From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Fri, 26 Feb 2016 12:09:49 +0900
Message-ID: <20160226030949.GL18327@sirena.org.uk>
References: <E1aYsmb-0006qb-76@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iG2Rx2SlPBajXMwl"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1aYsmb-0006qb-76@optimist>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org


--iG2Rx2SlPBajXMwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2016 at 10:04:29AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/watchdog/orion_wdt.c:109:2: error: implicit declaration of function 'atomic_io_modify' [-Werror=implicit-function-declaration]

also caused by b4f596b19624 (arm64: add mvebu architecture entry) which
enables MVBEU on arm64, the commit was present for a little while and
the error cropped up but didn't get reported due to other things masking
it.  atomic_io_modify() is only available on ARM, I'm unsure if this
needs a driver change or if the driver is just specific to older
hardware anyway.  The code is only used in the init path accessing what
look to be device specific registers so I'm not 100% clear why it
specifically needs to be an atomic modify.

--iG2Rx2SlPBajXMwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWz8H7AAoJECTWi3JdVIfQuEYH/jbNLg6bhEtMonTk+yo5v1fr
KyXsOk76FJvSl3qQU8SbGLfiDGl1p4Ezvqjll1psfAi/WU41UgEbR1JPhsRb12fa
q5awXKEzWEfDzYXdp5LxE4x7AlYNb0WlMnLIqGzubyAEUPTwqiqhuOaYyj1HTFdg
hv7TiI0YfHPMX3GR84SKljFW6bm2z7wK9GfJrY8FukWKoc2Vv8I5f22EvL0OqUPv
XjtUHhj26cu/WlmWSBfntz8mHVfNn4rwyeRylXrUvP2JjtQwnpP23yY1dzh9VlW3
+efA8YX3DVL6mMJmyD5MVnLldwgzLEz1cdSXg2FTszsnG2D7jNHh2AOT+Of3IE8=
=Q5y2
-----END PGP SIGNATURE-----

--iG2Rx2SlPBajXMwl--
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
