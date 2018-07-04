From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the slave-dma tree
Date: Wed, 4 Jul 2018 13:30:06 +1000
Message-ID: <20180704133006.4d42d1a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jc//Iydba38lvZakE8=FEEU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>
List-Id: linux-next.vger.kernel.org

--Sig_/jc//Iydba38lvZakE8=FEEU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-edma-common.o

Introduced by commit

  6ad069123f03 ("dmaengine: fsl-edma: extract common fsl-edma code (no chan=
ges in behavior intended)")

--=20
Cheers,
Stephen Rothwell

--Sig_/jc//Iydba38lvZakE8=FEEU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls8Pz4ACgkQAVBC80lX
0Gz+cwf/SwM8RV8PxM5zt3emGZuLYS1LHo9SgJk/N2Qjh2S+aoL4P+gHwCp3jL2/
cu6KpGoT4k5qFgDy2nAZ14t5J4XKZOFg2DOFq6dQM28FMr8UHb+XFFZjiJf3yN0n
D4Mof4y7GTsuiNdTRkMgrMyLT2HlSgHPRBz9n3efFJ+OC2H3IVhWLgl1B5BnikMY
GA1aSQsYn86jYvtuYFwB0scrIQr1eQHM/gIGdLea16Z7vDdwTW9CfxU9ta+xp+tD
gpT06GzWs3YJjYXVKViQAFbbG7Rv+nlduu3kbN4I3JXdAsEu133ivFEP8fX4aD+v
jD/FI2Cl4FNptvtoa1htB8We6GnIlA==
=tlVi
-----END PGP SIGNATURE-----

--Sig_/jc//Iydba38lvZakE8=FEEU--
