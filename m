From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 23 May 2019 10:27:36 +1000
Message-ID: <20190523102736.4845a80b@canb.auug.org.au>
References: <20190521105151.51ffa942@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0WxK/Zy6Cs5iCL1+uPRs7QG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521105151.51ffa942@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>, Thierry Reding <treding@nvidia.com>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/0WxK/Zy6Cs5iCL1+uPRs7QG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Tue, 21 May 2019 10:51:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>=20
> between commit:
>=20
>   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
>=20
> from Linus' tree and commits:
>=20
>   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
>   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S970=
0RTWV43TR-01B")
>   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronic=
s")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I deleted the file and added the patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 May 2019 10:48:36 +1000
> Subject: [PATCH] dt-bindings: fix up for vendor prefixes file conversion
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 83ca4816a78b..749e3c3843d0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -287,6 +287,8 @@ patternProperties:
>      description: Everest Semiconductor Co. Ltd.
>    "^everspin,.*":
>      description: Everspin Technologies, Inc.
> +  "^evervision,.*":
> +    description: Evervision Electronics Co. Ltd.
>    "^exar,.*":
>      description: Exar Corporation
>    "^excito,.*":
> @@ -851,6 +853,8 @@ patternProperties:
>      description: Shenzhen Techstar Electronics Co., Ltd.
>    "^terasic,.*":
>      description: Terasic Inc.
> +  "^tfc,.*":
> +    description: Three Five Corp
>    "^thine,.*":
>      description: THine Electronics, Inc.
>    "^ti,.*":
> @@ -925,6 +929,8 @@ patternProperties:
>      description: Voipac Technologies s.r.o.
>    "^vot,.*":
>      description: Vision Optical Technology Co., Ltd.
> +  "^vxt,.*"
> +    description: VXT Ltd
>    "^wd,.*":
>      description: Western Digital Corp.
>    "^wetek,.*":
> --=20
> 2.20.1

In doing a back merge of Linus' tree into the drm-misc tree, you seem
to have missed the above merge fixup and so lost some of the changes
from the above commits.

--=20
Cheers,
Stephen Rothwell

--Sig_/0WxK/Zy6Cs5iCL1+uPRs7QG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzl6PgACgkQAVBC80lX
0Gzo8ggAnX6lqBzN0XJKHIrMGP1dj1RyPS+AJu3T9HxPBag2M6JYPaW57qYtd9g2
laMr4Bwp7PDFVC3UmEJkmVZ05NDEHGvOrzecYrib596tF8FpjK6WciJjYKyMO1+7
cHwbU7kCcLGeVtIkvIzKtyn1wnZafScYwCNZxKiXlyZFOLYI0fqcL2rXyVIXGUeS
7T1x559NFyNJT3vDqlajTmavzQPTYQiHTjhol8EI0GCY8qZYE+9xR7CxTDS0ZbDI
MU11OdnFzxQASyCoqjOve46O3yDO6vh5d8L141MtRkr4bMQhh4Z1YilcEbM1WMC1
QWTuS2pny6GTDcJgvj0+ABKQUkH33w==
=tAtR
-----END PGP SIGNATURE-----

--Sig_/0WxK/Zy6Cs5iCL1+uPRs7QG--
