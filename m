From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: linux-next: manual merge of the usb-gadget tree
Date: Thu, 10 Oct 2013 16:26:59 -0500
Message-ID: <20131010212659.GA22835@radagast>
References: <20131010212030.GV21581@sirena.org.uk>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131010212030.GV21581-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 10, 2013 at 10:20:30PM +0100, Mark Brown wrote:
> Today's linux-next merge of the usb-gadget tree got conflicts in
> drivers/usb/musb/davinci.c caused by an add in ea78201e2 (usb: musb:
> davinci: fix resources passed to MUSB driver for DM6467) adjacent to
> the modification of the device registration in 4c9ad1059 (DMA-API: usb:
> musb: use platform_device_register_full() to avoid directly messing with
> dma masks) from the ARM tree.
>=20
> I've fixed trivially and can carry as required.

Thank you.

--=20
balbi

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSVxujAAoJEIaOsuA1yqREX7cQALABxxACszITjehrJziE1gOP
4r0rxzeWOAXtxAlag4SJXOWjD7XBItWTrZBXTB+uhxhJnh93bzYqjG/FQn2iMVL+
FuxmfGuA1xUPEC+RAS4hSxyFILtuSptLFXllGNeVn7P3fAGqQie9EcGv0Owafd/t
1oFLe9Dj8h1gIo0BxjS524MFxIxZVGRB/8+EPrBo+1baUDxd7/hXoaRlrP2JQ/nz
6FafI/nxFYofvnyukH0kdaYtWca3MfdD4OJ2OrDY2C3eYF+QkN3FF6QBYTYvsqfX
d1+qYVInAZmPnzkh9+/DWQVHpHWKl6+U7SJ2qevTNRNnW9k2PefKsGkS+EGHV3MJ
HnKGhDlH70vqW8B9/vVa8WPlBK0QmZVksU9guuFs8CFyw93YjyjmKMgiI1kEKyt/
fr40qk4cEqS8jcY+js6uWW1y4jlXfDjRn5Fox5iHz/QQgX99CckmZlfMInRRRGDM
Tp70j5pKNJcVLGCdWhy0ks/oEhz4AYqa2cpVKmvajoeFkVAT4KVYJuuiRz7icMLD
DMec7uIPwqjhKLPtWNu66lKlWUEdDBQpXSlEdOjtSiGioFQ2pFBkxEOQZ22NJTp5
woZ30c5Z74URfWp33YHmjCOnjHeKpZYQgtGHnt9ykuRTgRViBB6WVhvfkMPHmttb
YJ0mD8iMP+Iz6MuOOXi5
=yk9v
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
