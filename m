From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the libata tree
Date: Tue, 20 Mar 2018 15:57:01 +1100
Message-ID: <20180320155701.1122cef9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hEBSGTqQBMZj.u0qN6IRpgy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hEBSGTqQBMZj.u0qN6IRpgy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/ata/ahci_imx.c: In function 'imx_sata_disable':
drivers/ata/ahci_imx.c:478:2: warning: enumeration value 'AHCI_IMX53' not h=
andled in switch [-Wswitch]
  switch (imxpriv->type) {
  ^~~~~~

Introduced by commit

  e5878732a521 ("ahci: imx: add the imx6qp ahci sata support")

--=20
Cheers,
Stephen Rothwell

--Sig_/hEBSGTqQBMZj.u0qN6IRpgy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqwlJ0ACgkQAVBC80lX
0GyL9gf/fEkXmVF2wVy4SJvlFRoq6fwmszMQKKxiXm2OqE8fwO5lMqpT3Mb9zqTy
5g4tn56VzlMw3il4w3/22wKlK8BIzuW/hxPVv9hF+SYqbui/7+symB2L7AgTtOfg
x6dSLgdACeuZEBdjp0fKp+4gY1E+uje/Xn4GV4kntaxpaYQFg9Y2+BsIioZj/n4D
UE0EU+q/CX3YjF/gSgI+qZBLQv5EYkNIhkM5NCCuXfF4zE2a/765keA+6W5tN6x/
BPaiaAiFhTggQv2uVnCQHIMZOMqnBw0hwfnybFmYieVqYgX8FgiBisdb+bxglNkJ
Ii2Uy38i8kXGDTtyB3UUfKGNFobJdQ==
=rV3n
-----END PGP SIGNATURE-----

--Sig_/hEBSGTqQBMZj.u0qN6IRpgy--
