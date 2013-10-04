From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 3
Date: Fri, 4 Oct 2013 02:02:30 +0100
Message-ID: <20131004010230.GI27287@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bmlge7Pg4VPvffji"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: linux-next.vger.kernel.org


--bmlge7Pg4VPvffji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Better late than never I've uploaded today's linux-next tree to the
master branch of the repository below:

        git://gitorious.org/thierryreding/linux-next.git

A next-20131003 tag is also provided for convenience.

A few new conflicts today caused by the removal of the h8300
architecture which I didn't report for triviality.  Several new build
failures were found as a result of running allmodconfig tests between
merges all of which have been reported and I'm still carrying the i.MX
fix that Thierry has been carrying.

Due to the length of time taken to run all the allmodconfigs I skipped
the defconfig tests; I know Olof has the ARM stuff covered in his
autobuilder.  I'm going to use allyesconfig tomorrow since that should
run faster so hopefully I can cover the ARM, i386 and x86_64 configs
again.

Thanks,
Mark

--bmlge7Pg4VPvffji
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSThOjAAoJELSic+t+oim9coUP/2MWLFf5xVCF74dvN5XcX2xT
1k9pAc/8fJ9JhZxx2ifRknUlc4NxXgbkRoEry0toSXnONGTm02b2PEZl0nrAA9Xa
vPtHwx+LPkWpZ2DLxygBwzkEpkf7S78zphQmJMYBGiXLlJoCgpYYbJAOeY0jGQEz
ubUFPJxSemFZbWTf0/TZMzvxpZ151g6Q39TipwYBWl2Rc2OvBbku0kRBRMEoQyKj
MWjUmYoZeA7sPiBzxIDjGi8bAcUH9PRlcsgUxUnrREIUXOXXdY/vaPub2xPtmEU5
WxX9wdGddFXSO4qaEpCW/zN+RJHr6IpjlU8qpx8EGATwueu5XvZ2YP/j27Gj8EBN
HcaCItPd1ENgEwh9A8tEZbF6VOVGlDGIMdLI6Huf4GffRK28gmziD2Pte42NTBPu
m8cxOWWXwFsI8LJmY0E4zLKgJu4lDEGuDGssaN5QyNtfpVpiJTXlHuCt7frEjjOe
T7ONHgIEvpOC+avoCLqXW6EYpyIOXS4oSxkdZWDMyjVa2TfK7tFmYpIMqYYy+XtF
vMdbd8n9MvpQObeqqIxgJzvogvCJRyAwXSPqtUO/cjaCy4/phlECZkh6ERDEOqEq
EQIh4Wn83S2H2U/zXzEgDDVJOYGuwhQJnJ2YF7Kv+n5YCzusmNJfSH+plwzMeX9p
axToiMs23TXhCCUvdgO2
=5b5l
-----END PGP SIGNATURE-----

--bmlge7Pg4VPvffji--
