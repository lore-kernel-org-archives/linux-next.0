From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Tue, 23 Apr 2019 15:13:47 +1000
Message-ID: <20190423151347.4ec9f51e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+/jYVB/VZPM.LzNzc7/cZbJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matt Sickler <Matt.Sickler@daktronics.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+/jYVB/VZPM.LzNzc7/cZbJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/staging/kpc2000/kpc_spi/spi_driver.c:97:5: note: offset of packed b=
it-field 'wl' has changed in GCC 4.4
     } bitfield;
     ^
drivers/staging/kpc2000/kpc_spi/spi_driver.c:97:5: note: offset of packed b=
it-field 'cs' has changed in GCC 4.4
drivers/staging/kpc2000/kpc_spi/spi_driver.c:97:5: note: offset of packed b=
it-field 'wcnt' has changed in GCC 4.4

Introduced by commit

  7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/+/jYVB/VZPM.LzNzc7/cZbJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+nwsACgkQAVBC80lX
0Gy20Af/X0CaM9Vv/zCUD/M7WO9/cY8wk6XGk53ydByELFmv6+tf95Wd/US3AXJ8
hYukqJEI159o6omGF3TqpfuuyY/yEHSLNOFzgqJ5AvF+LH+StkzOMDG2TGLN3RVq
5LWSRSG6IVyge6jBlL4zJlIL59Zof0tQW5mf10mXMwul5DnWGlfdMi/EyZhsehHb
ed6oHNJLBbcM//I1MRM/Aw2/UV8nF5OcnUu5D3yDqc7hiYVGMCw+MXfVXezzNaIw
fHEhsMfuk61T9Vi/rS3cCNsvjlowdaoX6KsbzwhLOLqSoonRDxuWi3aEWNny1b7z
WjcdEOS7BNpy/xPrzx3+hYWbfheQBw==
=71M1
-----END PGP SIGNATURE-----

--Sig_/+/jYVB/VZPM.LzNzc7/cZbJ--
