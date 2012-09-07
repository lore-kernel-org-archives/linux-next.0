From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?=
	<siglesias@igalia.com>
Subject: Re: [PATCH] staging: ipack: only build on platforms that provide
 ioread/iowrite.
Date: Fri, 07 Sep 2012 09:01:32 +0200
Message-ID: <1347001292.5957.43.camel@fourier.local.igalia.com>
References: <CAMuHMdWN--hXYTPYNi07vNB0DrMdDoc+MwxgUkSBihPw+VKGHg@mail.gmail.com>
	 <1346960719-9184-1-git-send-email-jens.taprogge@taprogge.org>
	 <1346960719-9184-2-git-send-email-jens.taprogge@taprogge.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-vkEIv9jKvBZ45LcOlhlg"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346960719-9184-2-git-send-email-jens.taprogge@taprogge.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Taprogge <jens.taprogge@taprogge.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, industrypack-devel@lists.sourceforge.net, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--=-vkEIv9jKvBZ45LcOlhlg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-06 at 21:45 +0200, Jens Taprogge wrote:
> Do so by depending on HAS_IOMEM.
>=20
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Signed-off-by: Jens Taprogge <jens.taprogge@taprogge.org>
> ---
>  drivers/staging/ipack/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/ipack/Kconfig b/drivers/staging/ipack/Kconfi=
g
> index af32178..4cf4706 100644
> --- a/drivers/staging/ipack/Kconfig
> +++ b/drivers/staging/ipack/Kconfig
> @@ -4,6 +4,7 @@
> =20
>  menuconfig IPACK_BUS
>  	tristate "IndustryPack bus support"
> +	depends on HAS_IOMEM
>  	---help---
>  	  If you say Y here you get support for the IndustryPack Framework
>  	  for drivers for many types of boards that support this industrial

Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com>

Thanks,

Sam

--=-vkEIv9jKvBZ45LcOlhlg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlBJm8wACgkQWrfbyfmd9eJ6GwCfZOLdUytNutk8hUmUOglq3t40
QdYAn0ATyyZGMMt19NZupjUE+ClyYcRS
=t4a0
-----END PGP SIGNATURE-----

--=-vkEIv9jKvBZ45LcOlhlg--
