From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-mxs tree
Date: Tue, 21 May 2019 08:37:56 +1000
Message-ID: <20190521083756.4c8aee8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bQg1/fUf/cfnr+0L7IqKhpx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bQg1/fUf/cfnr+0L7IqKhpx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

After merging the imx-mxs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/clk/imx/clk.c: In function 'imx_mmdc_mask_handshake':
drivers/clk/imx/clk.c:20:8: error: implicit declaration of function 'readl_=
relaxed'; did you mean 'xchg_relaxed'? [-Werror=3Dimplicit-function-declara=
tion]
  reg =3D readl_relaxed(ccm_base + CCM_CCDR);
        ^~~~~~~~~~~~~
        xchg_relaxed
drivers/clk/imx/clk.c:22:2: error: implicit declaration of function 'writel=
_relaxed'; did you mean 'xchg_relaxed'? [-Werror=3Dimplicit-function-declar=
ation]
  writel_relaxed(reg, ccm_base + CCM_CCDR);
  ^~~~~~~~~~~~~~
  xchg_relaxed

Caused by commit

  0dc6b492b6e0 ("clk: imx: Add common API for masking MMDC handshake")

I have used the imx-mxs tree from next-20190520 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bQg1/fUf/cfnr+0L7IqKhpx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjLEQACgkQAVBC80lX
0GxtwAf/RqY1cshi846/r9/RWEOqXu5OgNeBnNXcrCxwNyIMaVG6rwHZPpBzK+2q
4NE9MlE+ZJJeou7FP3zVvQlheEGJ1/oMKIARO0us4wMroF6kiUP481uC6GcXplG6
2OqccIQi+WDH7yghtPjd12XGrXAcM++aI0ANkub9W1xUBfFV08eoViYQJtH0fP9N
rGbz5dhlS5bBPNj3lGUjzznTFEl8QQeoUKCpODh/SWluj12h7NVh7vklcpjUgT51
vr44g85ZULK6PyVre3pnveWAz04qZbUyGjRFZFINSvb4BTi4NUleZTntGXts89/1
hf641I8XVZTIhIqanvAFywSlYrUfag==
=N24Q
-----END PGP SIGNATURE-----

--Sig_/bQg1/fUf/cfnr+0L7IqKhpx--
