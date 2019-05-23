From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 23 May 2019 13:53:55 +0200
Message-ID: <20190523115355.joyeqlmbjkufueyn@flea>
References: <20190521105151.51ffa942@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0018240827=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190521105151.51ffa942@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org


--===============0018240827==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="22oxjvmo2hvuqeqd"
Content-Disposition: inline


--22oxjvmo2hvuqeqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>
> between commit:
>
>   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
>
> from Linus' tree and commits:
>
>   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
>   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9700RTWV43TR-01B")
>   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronics")
>
> from the drm-misc tree.
>
> I fixed it up (I deleted the file and added the patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I just took your patch and pushed a temp branch there:
https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/commit/?h=drm-misc-next&id=3832f2cad5307ebcedeead13fbd8d3cf06ba5e90

Rob, Stephen, are you ok with the change? If so, I'll push it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--22oxjvmo2hvuqeqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOaJzQAKCRDj7w1vZxhR
xcfwAP9V0omTw8jbR0a5wFDMizYxiSE6KvGa0yDpAyucXGBcqAEAgP78Gkggt6vS
4E1Xd5LVpNQXXiwmH7FNbcL6r2C8ggk=
=birf
-----END PGP SIGNATURE-----

--22oxjvmo2hvuqeqd--

--===============0018240827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0018240827==--
