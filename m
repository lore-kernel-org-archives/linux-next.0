From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the qcom tree
Date: Fri, 16 Nov 2018 10:10:59 +1100
Message-ID: <20181116101059.18ad3fc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bsffGIR900KQxJ3cNoyrhDu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/bsffGIR900KQxJ3cNoyrhDu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/adreno/a6xx_gmu.c: In function 'a6xx_gmu_rpmh_arc_votes=
_init.constprop':
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:943:12: warning: 'pri_count' is used =
uninitialized in this function [-Wuninitialized]
  pri_count >>=3D 1;
            ^~~
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:948:12: warning: 'sec_count' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
  sec_count >>=3D 1;
            ^~~

Introduced by commit

  ed3cafa79ea7 ("soc: qcom: cmd-db: Stop memcpy()ing in cmd_db_read_aux_dat=
a()")

# CONFIG_QCOM_COMMAND_DB is not set

--=20
Cheers,
Stephen Rothwell

--Sig_/bsffGIR900KQxJ3cNoyrhDu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvt/QMACgkQAVBC80lX
0GxxhggAnPhUNs7OcqjzTZydgZBYXnFl0Z3A0tXvL9OLBSVXO6fqOd2By92mQsUS
OZSnivl81SfuHV8Ko4Rv8MOqW6dixtt2Z63Qmr4nDipppZLgILo66Svt+E/+LPkX
m5CycaQdSpJUgtY8W22YWLUF02G7alOns7skhEIGzwYvv+iEiHHrQw80kuDm0/6T
/E4UaPGPkcCL9bSsnYmSjVKQB2P3tsYhlRGYuA58QyUdB6L8+F1f64oRmaQMiVwH
2GfJpnRF0nW+El634YX5MsFekNfjxvyP107vQz5LcLxoezvYlP7g9OBrysWGW6Yl
IQL2cKJO0lg0fd4916MVwwdXV1POnA==
=sBkX
-----END PGP SIGNATURE-----

--Sig_/bsffGIR900KQxJ3cNoyrhDu--
