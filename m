From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mfd tree with the drm-intel
 tree
Date: Thu, 16 Aug 2018 12:12:56 +1000
Message-ID: <20180816121256.0435930e@canb.auug.org.au>
References: <20180726151006.345e8397@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ex_lo=vQHCdeSqjX49RZ7=."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726151006.345e8397@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ex_lo=vQHCdeSqjX49RZ7=.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 26 Jul 2018 15:10:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the mfd tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/intel_display.h
>=20
> between commit:
>=20
>   6075546f57f8 ("drm/i915/icl: store the port type for TC ports")
>=20
> from the drm-intel tree and commit:
>=20
>   9c229127aee2 ("drm/i915: hdmi: add CEC notifier to intel_hdmi")
>=20
> from the mfd tree.
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
> diff --cc drivers/gpu/drm/i915/intel_display.h
> index 0a79a46d5805,1f176a71e081..000000000000
> --- a/drivers/gpu/drm/i915/intel_display.h
> +++ b/drivers/gpu/drm/i915/intel_display.h
> @@@ -126,24 -126,30 +126,48 @@@ enum port=20
>  =20
>   #define port_name(p) ((p) + 'A')
>  =20
> + /*
> +  * Ports identifier referenced from other drivers.
> +  * Expected to remain stable over time
> +  */
> + static inline const char *port_identifier(enum port port)
> + {
> + 	switch (port) {
> + 	case PORT_A:
> + 		return "Port A";
> + 	case PORT_B:
> + 		return "Port B";
> + 	case PORT_C:
> + 		return "Port C";
> + 	case PORT_D:
> + 		return "Port D";
> + 	case PORT_E:
> + 		return "Port E";
> + 	case PORT_F:
> + 		return "Port F";
> + 	default:
> + 		return "<invalid>";
> + 	}
> + }
> +=20
>  +enum tc_port {
>  +	PORT_TC_NONE =3D -1,
>  +
>  +	PORT_TC1 =3D 0,
>  +	PORT_TC2,
>  +	PORT_TC3,
>  +	PORT_TC4,
>  +
>  +	I915_MAX_TC_PORTS
>  +};
>  +
>  +enum tc_port_type {
>  +	TC_PORT_UNKNOWN =3D 0,
>  +	TC_PORT_TYPEC,
>  +	TC_PORT_TBT,
>  +	TC_PORT_LEGACY,
>  +};
>  +
>   enum dpio_channel {
>   	DPIO_CH0,
>   	DPIO_CH1

This is now a conflict between Linus' tree and the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ex_lo=vQHCdeSqjX49RZ7=.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt03agACgkQAVBC80lX
0Gx6KAf9Gkj+UMsAWDisxNjEYdpuUiNb6jRkRKhhQLbFJhLrhVCTrXZPdO8RAu/a
IeWxHtIY1NtTdJzklsFAmZs5f0WrGEbwsAeM+O26fk/JH9+c+pBoZKyB1FIxF2Qo
EeEBeY9V81YXpg7YAaRyH3Wp7ZOF8doZ2un5hFWMFcrO8/i//uIqK3HRIuZF4Dw2
mjVPH+pOt9x3ZioQBl6aQag4C4fmvYaePUQYa6Qs2zXUByX/7kb4Dkk1ONZZM3uu
roF6nw6ucFFXbiYxIFbNLILoa+2Q3SUH3GWTbugmAfgjFGimj09o3jotvXC0s4Ob
N+5ROcveDzQlIsQVXkKaoLJ8iS13yA==
=x9sD
-----END PGP SIGNATURE-----

--Sig_/ex_lo=vQHCdeSqjX49RZ7=.--
