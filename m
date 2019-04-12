From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the imx-mxs tree
Date: Fri, 12 Apr 2019 14:49:21 +1000
Message-ID: <20190412144921.3a152478@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a9VId0sWDIARXq36H946r=_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Yang <decatf@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
List-Id: linux-next.vger.kernel.org

--Sig_/a9VId0sWDIARXq36H946r=_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  189733b0a7e4 ("dt-bindings: Add vendor prefix for Rakuten Kobo, Inc.")

from the imx-mxs tree and commit:

  2e5cee6c7622 ("dt-bindings: Add vendor prefix for Kionix, Inc.")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index 5f2b185a04e6,93753f447c20..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -211,7 -210,7 +211,8 @@@ kiebackpeter    Kieback & Peter Gmb
  kinetic Kinetic Technologies
  kingdisplay	King & Display Technology Co., Ltd.
  kingnovel	Kingnovel Technology Co., Ltd.
+ kionix	Kionix, Inc.
 +kobo	Rakuten Kobo Inc.
  koe	Kaohsiung Opto-Electronics Inc.
  kosagi	Sutajio Ko-Usagi PTE Ltd.
  kyo	Kyocera Corporation

--Sig_/a9VId0sWDIARXq36H946r=_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlywGNEACgkQAVBC80lX
0GxX0Qf/RyeVmwoWjw/cwDhEpO/ExAPZYuImXDgfxo1mjw/EuqR7CPh9oJI38SNm
SkVTxDToJPzWk7TdjsergbLqaaKohVpyB7S5ZhOjOvDxytmWaWAaZicASlztDhhY
FvYhfHSfeRb+FmQA1kG4Bo/iDgN9p1PFzeH7/oLciHvTjbovimJn0C/psHo822e7
pXEYGr+k0yYvuxR6GImtQMvYLJHpSRkzILp81TwVxzdmmjgiyzvEg+8O+fSLcOHg
CelSksLoRNCa5t9nH8MHJdwiGjo3fj6JISpQBjz/jqcpExtm5kU4FkNWs+XIO+On
0vmC1Nd4M5JmyxkzqHMDpooGLsbXPw==
=oDxS
-----END PGP SIGNATURE-----

--Sig_/a9VId0sWDIARXq36H946r=_--
