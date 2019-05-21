From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Tue, 21 May 2019 10:51:51 +1000
Message-ID: <20190521105151.51ffa942@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G6L+=B.XzszjFbhvzmL2hFN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>, Thierry Reding <treding@nvidia.com>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/G6L+=B.XzszjFbhvzmL2hFN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")

from Linus' tree and commits:

  b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
  b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9700R=
TWV43TR-01B")
  fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronics")

from the drm-misc tree.

I fixed it up (I deleted the file and added the patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 May 2019 10:48:36 +1000
Subject: [PATCH] dt-bindings: fix up for vendor prefixes file conversion

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 83ca4816a78b..749e3c3843d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -287,6 +287,8 @@ patternProperties:
     description: Everest Semiconductor Co. Ltd.
   "^everspin,.*":
     description: Everspin Technologies, Inc.
+  "^evervision,.*":
+    description: Evervision Electronics Co. Ltd.
   "^exar,.*":
     description: Exar Corporation
   "^excito,.*":
@@ -851,6 +853,8 @@ patternProperties:
     description: Shenzhen Techstar Electronics Co., Ltd.
   "^terasic,.*":
     description: Terasic Inc.
+  "^tfc,.*":
+    description: Three Five Corp
   "^thine,.*":
     description: THine Electronics, Inc.
   "^ti,.*":
@@ -925,6 +929,8 @@ patternProperties:
     description: Voipac Technologies s.r.o.
   "^vot,.*":
     description: Vision Optical Technology Co., Ltd.
+  "^vxt,.*"
+    description: VXT Ltd
   "^wd,.*":
     description: Western Digital Corp.
   "^wetek,.*":
--=20
2.20.1

--Sig_/G6L+=B.XzszjFbhvzmL2hFN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjS6cACgkQAVBC80lX
0GxxWAf/U1Bd2c5IorrbBJ3GkYu19Jh6K5qnUcxJYTTKlhemqW0P9KsDtQe2fvsH
EUIsYjeHhlAUsohXmD7LMada75LSwqESAWY2nO9hCyOk4Mf6VU68oiEOGg+PI1s5
Ex8sCpW5SmJj4NUnOBVCFuQLde/8baqC/l7PN6NQ/aetKRSXvw51OK2JzbWrmqFQ
f9/sGKu2HUBbsbkZhbs2FZt+ZfMQlA3RtKn8Kt4R/h0joo1gkVvztAO+PsOYhZL0
HIMpwg4o972YQYhLdUjqX088+mFQ2ck4d9iazQxcycIhVRgQl6EcAuWr3AzA5UcW
Ii58xvlIbU1Uqb2AtEAocPkXyup2lQ==
=C1+W
-----END PGP SIGNATURE-----

--Sig_/G6L+=B.XzszjFbhvzmL2hFN--
