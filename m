From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 23 May 2019 19:34:02 +1000
Message-ID: <20190523193402.60dc0812@canb.auug.org.au>
References: <20190521105151.51ffa942@canb.auug.org.au>
        <20190523081022.cbirvf2vucbyc34r@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M4TugNSXYXC94YDxNnBwkzN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523081022.cbirvf2vucbyc34r@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/M4TugNSXYXC94YDxNnBwkzN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 23 May 2019 10:10:22 +0200 Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
>
> Hi Stephen,
>=20
> On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/vendor-prefixes.txt
> >
> > between commit:
> >
> >   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> >
> > from Linus' tree and commits:
> >
> >   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
> >   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9=
700RTWV43TR-01B")
> >   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electron=
ics")
> >
> > from the drm-misc tree.
> >
> > I fixed it up (I deleted the file and added the patch below) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 21 May 2019 10:48:36 +1000
> > Subject: [PATCH] dt-bindings: fix up for vendor prefixes file conversion
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 83ca4816a78b..749e3c3843d0 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -287,6 +287,8 @@ patternProperties:
> >      description: Everest Semiconductor Co. Ltd.
> >    "^everspin,.*":
> >      description: Everspin Technologies, Inc.
> > +  "^evervision,.*":
> > +    description: Evervision Electronics Co. Ltd.
> >    "^exar,.*":
> >      description: Exar Corporation
> >    "^excito,.*":
> > @@ -851,6 +853,8 @@ patternProperties:
> >      description: Shenzhen Techstar Electronics Co., Ltd.
> >    "^terasic,.*":
> >      description: Terasic Inc.
> > +  "^tfc,.*":
> > +    description: Three Five Corp
> >    "^thine,.*":
> >      description: THine Electronics, Inc.
> >    "^ti,.*":
> > @@ -925,6 +929,8 @@ patternProperties:
> >      description: Voipac Technologies s.r.o.
> >    "^vot,.*":
> >      description: Vision Optical Technology Co., Ltd.
> > +  "^vxt,.*"
> > +    description: VXT Ltd =20
>=20
> I'm not sure whether or not you can change it, but this breaks the
> users of that file.
>=20
> What you want is:
>=20
> - "^vxt,.*"
> + "^vxt,.*:"

I have fixed my version (but I put the ':' after the '"' like the
others).

Thanks for letting me know.
--=20
Cheers,
Stephen Rothwell

--Sig_/M4TugNSXYXC94YDxNnBwkzN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzmaQoACgkQAVBC80lX
0GxmJQf/SjSWc6s/V4yp7MSJOXV7fj4rbcZvA9A6yD2j8kZMDC2DF2xv1yZ/9fKL
RDOBP4djWQOeFqd7HGliFFrlL899cNsOHHuhfaAa2cBSnHu1RfQAchRMtMsIv2yW
YtZ3P3TYohfBbOYS2kjKIkE+ITQEA7C8ZNhZCh6XoJ6iLmz7z83IyqACDHdTbxqW
nU0YcUtSnVf1b2WE3W/WVG+Z0ZKdGqmZ6lXXvtYX7A69YTFrjmU/3AYaQjLEq48y
AjSxJGWWkkysxsz+zSz0221MsakKDIYBcbuBA9Wh31XAqeedRVoTxN+kxQg4IIJ0
kzVUroPXneQc88gr0PFJ9YqltgTxUA==
=HfDy
-----END PGP SIGNATURE-----

--Sig_/M4TugNSXYXC94YDxNnBwkzN--
