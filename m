From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pm tree
Date: Mon, 30 Jul 2018 12:00:53 +1000
Message-ID: <20180730120053.62732d27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4GX83W.4ulaCHnjPxIlqjoD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4GX83W.4ulaCHnjPxIlqjoD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/media/i2c/mt9v111.c: In function 'mt9v111_set_format':
drivers/media/i2c/mt9v111.c:887:15: warning: 'idx' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
  unsigned int idx;
               ^~~

Introduced by commit

  aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")

Looks like a false positive, but not something that gcc can easily see.

--=20
Cheers,
Stephen Rothwell

--Sig_/4GX83W.4ulaCHnjPxIlqjoD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltecVUACgkQAVBC80lX
0GyGmAf/YnA1cpHCSACdOVYt/o32oVQBzSJIqlfdKBZ8+JUQ7OIpj/WbVZI/Mw4h
/Ek+RhkDH3aftLdL6xf3ou1xa+1VNR0G0x0gQc0B40hINfk0JxqeWB1zFRjqMXFv
z4k7W4GvaIFqV/83lemiihdO2UYcqFeoAffHUuT6Zt8njQ/Fn1OgSyu7XPiMPeSc
zYsiWLqb0YPUomV1A1ke7DVSkmBYBQ2oqs+72iVeqeAnlAd/pHM5th9Zp7qxQwgv
MbdnJg7M2rQ1p+AU/c8AY1tJ/WvCmX6LcT+fJZ6wwSLAhxbPxJIEZr22pYLcnDl4
ywyFTrHO+pSd19fBv6kQT8jZvxB9ZQ==
=/yfL
-----END PGP SIGNATURE-----

--Sig_/4GX83W.4ulaCHnjPxIlqjoD--
