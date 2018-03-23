From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Fri, 23 Mar 2018 11:43:26 +1100
Message-ID: <20180323114326.6cb18906@canb.auug.org.au>
References: <20180320120841.5b348bf4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1764371414=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180320120841.5b348bf4@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1764371414==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bBvXSGChN1XQTvf0F840=bf"; protocol="application/pgp-signature"

--Sig_/bBvXSGChN1XQTvf0F840=bf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 Mar 2018 12:08:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/sun4i/sun4i_tcon.h
>=20
> between commit:
>=20
>   e742a17cd360 ("drm/sun4i: tcon: Reduce the scope of the LVDS error a bi=
t")
>=20
> from Linus' tree and commit:
>=20
>   6664e9dc5383 ("drm/sun4i: Add support for A80 TCONs")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/sun4i/sun4i_tcon.h
> index abdc6ad6b384,d3a945b7bb60..000000000000
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@@ -176,7 -176,7 +176,8 @@@ struct sun4i_tcon_quirks=20
>   	bool	has_channel_1;	/* a33 does not have channel 1 */
>   	bool	has_lvds_alt;	/* Does the LVDS clock have a parent other than the=
 TCON clock? */
>   	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
>  +	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
> + 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
>  =20
>   	/* callback to handle tcon muxing options */
>   	int	(*set_mux)(struct sun4i_tcon *, const struct drm_encoder *);

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bBvXSGChN1XQTvf0F840=bf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq0Ta4ACgkQAVBC80lX
0GxciQgAo6y4gPfV9B5LD7NpFBuM4K/EqFfSXt4zcRSIPKHkE8kAP3oQqy1ysIyM
xsDKhJVX0geHZzeePf0rTfaz3PH+/dF4CWQ6df7La5G3NFy+jGkixSJr8zQw2wz7
xO86DOw6iVQFzf+g5Dah3NXlq7IAE9FuSWdrCRzC1n/TefR/GW20eoMtWWyfDW9I
6zIgzNlIbUnli39VTV+pow4qPWD6ZpAELBbRc+gtNk+wFiEWlV+3YoCO7HoBEYoE
a6LHBku1GyJPlIDpNpBEA7YdwFGQwzTo33s99lJMQfogI7tjijBeXL/yh5I05yqA
azfbIotI0jIfpy3MGT5t8ruplyO6SA==
=46+c
-----END PGP SIGNATURE-----

--Sig_/bBvXSGChN1XQTvf0F840=bf--

--===============1764371414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1764371414==--
