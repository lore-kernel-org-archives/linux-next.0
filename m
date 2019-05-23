From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 23 May 2019 23:04:09 +1000
Message-ID: <20190523230409.31da92b9@canb.auug.org.au>
References: <20190521105151.51ffa942@canb.auug.org.au>
        <20190523115355.joyeqlmbjkufueyn@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_M21XHDo4D4.=IXfMFpYmIR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523115355.joyeqlmbjkufueyn@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/_M21XHDo4D4.=IXfMFpYmIR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 23 May 2019 13:53:55 +0200 Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
>
> On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
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
>=20
> I just took your patch and pushed a temp branch there:
> https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/commit/=
?h=3Ddrm-misc-next&id=3D3832f2cad5307ebcedeead13fbd8d3cf06ba5e90
>=20
> Rob, Stephen, are you ok with the change? If so, I'll push it.

All that needs to be done is for my patch (slightly corrected) needs to
be applied to the drm-misc tree.  That tree already has the back merge
of Linus' tree and the txt file has been removed (my patch should have
been applied as part of the merge resolution but doing it later is fine).

--=20
Cheers,
Stephen Rothwell

--Sig_/_M21XHDo4D4.=IXfMFpYmIR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzmmkkACgkQAVBC80lX
0GwClQf+KtJ3Zpo/s3kaUrdzpTkte/89nvyxmaiI63SFv545RTxjA9IyszIyDugJ
amyGja9rdP0UOiFkAy+Y3mcI1Nyp36x4Pcp3qvsdHWcJd+6QZ8H2J7IP6ItA1F4M
EXpv5KBcR1BSPxmY+aJQp4vLuE8AfafHAGtMf4uPFMr7XRIfhSm6w4K4UF9Y/Xp1
b3xC3Tp2BjZg1pc2ZNEj3c4H2pElewVaRex7F4Pozihu8sVlnLMrNEQvlEumgSBr
i+ZH0L7Dc9ggHXqPU/4R+6NcbDxMzccWtOZqy3oBoir7g98D2O+1vlfv0Hcz8MP7
XBhTHOlQZwlM55ReOqZ2ja3WiNdafw==
=7Nua
-----END PGP SIGNATURE-----

--Sig_/_M21XHDo4D4.=IXfMFpYmIR--
