From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the thermal tree
Date: Fri, 7 Dec 2018 12:24:56 +1100
Message-ID: <20181207122456.754129f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZtC3eBj3jrbJ8fnzS1zf3GZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ZtC3eBj3jrbJ8fnzS1zf3GZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/thermal/qcom/qcom-spmi-temp-alarm.c:26:10: fatal error: thermal_cor=
e.h: No such file or directory
 #include "thermal_core.h"
          ^~~~~~~~~~~~~~~~

Caused by commit

  150a4fe8c335 ("drivers: thermal: Move QCOM_SPMI_TEMP_ALARM into the qcom =
subdir")

I have used the thermal tree from next-20181206 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZtC3eBj3jrbJ8fnzS1zf3GZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJy+kACgkQAVBC80lX
0GztcQf9EiqRHgGUILOxNzg2TOm00zRwcrmUh61igBlzOUbuk7Znf/Pljh1PCE3f
M8/XHNDEJG11heNv+rMhS71hrWsOCys5kvE8bJh9xDLb4omn3S8YWZSpGlcHtiph
o2HLPV+Jd1VxeCQH4p5mmZzCR6+PGk80o2I5eesBRvB2X7+2d3d1ysIsXYLo+ChG
YE2p2uLoqoe+dpdjyRPy1l7nrNjuZ6RoLS1x91VaZh5H3sO1Ugfdd3NLSxZSUb1c
mQEFUsmJ2gS47LJka56BG0RcaGyYJAbYdVlpG+UOq98ovh+dDGksG+rectcuBdMn
Y5UahXD1fVO24PRBaw2cRfZPzUVrRg==
=h+Wu
-----END PGP SIGNATURE-----

--Sig_/ZtC3eBj3jrbJ8fnzS1zf3GZ--
