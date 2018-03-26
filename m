From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Tue, 27 Mar 2018 09:10:26 +1100
Message-ID: <20180327091026.3facbb9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EjaiM/xotWtyMHu8jYh=NjR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/EjaiM/xotWtyMHu8jYh=NjR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm/configs/mxs_defconfig

between commit:

  e3e583e7a293 ("ARM: mxs_defconfig: Re-sync defconfig")

from the arm-soc tree and commit:

  8bc2c29b550c ("ARM: mxs_defconfig: Re-sync defconfig")

from the imx-mxs tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/EjaiM/xotWtyMHu8jYh=NjR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq5b9IACgkQAVBC80lX
0GyRCAf/fWlN1Tug/qbP4tMXBJJ9N7XBLAt4W7+q5vGWM4Fg+hyqSIH9v/VMfI00
rg4UjEiR4d5GKiq/Dz/vxFfj3rR3oj/1nneMyWpkZWPm0FfpudiTUh84X2egfEqz
A3y5X8HVF544BPc1Pm7cz/1rg8L2nYmeDgQKvOvUjDmQPwyLOccaqr3VWe/ilnJQ
cjGLbVOv77F64CY3Z2Q0kvYOi7oxzw4PDuNotsXpWRDqvgE6XMc36VtnUm4js8L9
2ohKeV3/5njj6WBMX5R94+hXtJSGwBnSSToIloXEA/zYtS3K8F7ieNAPDmJuH9sh
mguzlyBEOu69FvJaAklFWc7u1fNQFg==
=6CJA
-----END PGP SIGNATURE-----

--Sig_/EjaiM/xotWtyMHu8jYh=NjR--
