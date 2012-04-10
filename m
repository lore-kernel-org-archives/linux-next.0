From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next:  commit "Remove rtd->codec usage from CODEC drivers"
 breakage.
Date: Tue, 10 Apr 2012 23:05:49 +0100
Message-ID: <20120410220548.GX7499@opensource.wolfsonmicro.com>
References: <4F84A883.3040308@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yKmnPmKxJBqIz68t"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51853 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759478Ab2DJWFw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Apr 2012 18:05:52 -0400
Content-Disposition: inline
In-Reply-To: <4F84A883.3040308@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org


--yKmnPmKxJBqIz68t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 05:39:15PM -0400, Paul Gortmaker wrote:
> Hi Mark,
>=20
> Can you have a look at this build failure?
>=20
> sound/soc/codecs/wm9712.c:482:32: error: 'runtime' undeclared (first use =
in this function)
> sound/soc/codecs/wm9712.c:499:33: error: 'runtime' undeclared (first use =
in this function)

Already resolved.

--yKmnPmKxJBqIz68t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIbBAEBAgAGBQJPhK61AAoJEBus8iNuMP3dij8P+Pfu65A2WPuIgegTbv+Cuq8d
T1M/e7PCC7E06w5HObXuXI9wjBa2+PKBbrfE26jjBmk++/zPLL9suMMNkBQKhkza
vkNG6Ns3SwiUhcL93ddr5Fca3Xlf9dt5OCC+XJCXIOooCj9xisXvt9yfyjYP2yiY
WFnEl1b27M5J/nRBEshw9d9b/eLCucxPZrgf40HHBqegLW0Wfv+q621ujE4RQOxG
1HOog4s5ZBo2YX0aAwQYYGen5dfngLv4hPSTy6NN821ows0A0E2aAJfvMg3J23+I
cARw+TjMSzCEg9pQbURJEsogIvLEb2PwzLqqAjjsA7d/Bhg1/jXFnBIKqmqMsCam
K7uwnJ72qSHxzqFjVMBDHd2YYrAO1izw9abArubN02wIfhZyE8pKF7O3KeD0MVWJ
Q9Z6cBnnY8GRznUGVrB61+h4N5APYXrCi2sarbGQkucrZUxHiKu0dN17XOMT5XfM
Eot16Ld9Iv6oowtz3lzYNASOAlDB/qPsHEFGjx6kKDOZ2PGFooWtFkKAPQBL7bCp
hnzpi7DlrETal/GPm53sfka7gQr7mwWT6bsuF+zBjpiBj/ZXhsw/DUG6UP68dxfM
mwDjVUP7uepUVON+d8MJIQvtrrqbcVNckdN2Zh524T+LMEXvAaqGNtax9tjclA/r
NU8ZQDglje3SJXayNkk=
=3l+x
-----END PGP SIGNATURE-----

--yKmnPmKxJBqIz68t--
