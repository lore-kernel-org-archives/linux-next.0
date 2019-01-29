From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Tue, 29 Jan 2019 13:02:37 +1100
Message-ID: <20190129130237.677e5ac8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/apUL4Ig7jufd.FnWq5Z.JP3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Boris Brezillon <bbrezillon@kernel.org>, Ashish Kumar <Ashish.Kumar@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/apUL4Ig7jufd.FnWq5Z.JP3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o
see include/linux/module.h for more information

Introduced by commit

  a5356aef6a90 ("spi: spi-mem: Add driver for NXP FlexSPI controller")

--=20
Cheers,
Stephen Rothwell

--Sig_/apUL4Ig7jufd.FnWq5Z.JP3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxPtD0ACgkQAVBC80lX
0GwcUQf+OOSsK0id705XZPIlNDC18ASqQkgmbzhh/YYsgbziD/M51zRM8Hv3yz1u
3aL0ny4yYc2uGwXE0ezcZPHqoteKGzl2z6exl2gebhhHKfD8D25nruM2tJUL20Pq
+xNuCGjDQmFxuCfv4PK7mQV1TysVss71QtdOeCdpCurAtTy/B95uaHzwQ/gs9Yud
Er2wa9v98v42jPbYGb+0lInmLYGnOzJzKtp0OR/sHi2z/mNfZ4+6cxPvfEOq6N6J
OcBHwyh+uT+GqN0tqahGp1m7mpcQQlPrzOqdUjOEde21yCRsm+w3G4T+PL2BY6EU
zAPlxMu9EEc/ovZOkTCkP7G8RmaDGA==
=2Ua7
-----END PGP SIGNATURE-----

--Sig_/apUL4Ig7jufd.FnWq5Z.JP3--
