From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 13 Mar 2018 17:09:22 +1100
Message-ID: <20180313170922.2fa1ea99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kST.0Rj8DVg1lcqJ1=N2WHe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kST.0Rj8DVg1lcqJ1=N2WHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/soc/codecs/da7219.o: In function `.da7219_remove':
da7219.c:(.text+0xcbc): undefined reference to `.clkdev_drop'

Caused by commit

  fc8f7ea2d6c0 ("ASoC: da7219: Add common clock usage for providing DAI clk=
s")

CONFIG_CLKDEV_LOOKUP is not set for this build.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kST.0Rj8DVg1lcqJ1=N2WHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqnaxIACgkQAVBC80lX
0GzdBwf9FsTlppMvHCLdWfUtDWVUEFZS+MQgdM4iB9p0ELf4058Gg6R6Xfvbbsum
a/LtgMmM5xTax5+TilCx8+eWBh6gE5kwnGS/4rHOTT/Eo6jDSBMBZzOjX2RtdDKw
M2b9GS48PEzdm1ChGe2L82n58r4QQAOp0wkRr+Qzm6eeBzI1KSCNB1o2i9rTtLlF
6FPioJ14YFcZm4z6yx+H5gseMFrDd38zyVAdCeodTZcZsT1YzxnOeSBxZhstp9WL
Xq2JFJGymN6x7RXNStcI7j/Q/4MbQxCr/K2eHn8TzTckq2goNS7DBNTbUBapZWeI
X5/p2BVS7iGmun8/zvvvC+BeGQ4aZw==
=yoSC
-----END PGP SIGNATURE-----

--Sig_/kST.0Rj8DVg1lcqJ1=N2WHe--
