From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: AT91 defconfig
Date: Wed, 16 Nov 2011 09:54:05 +1100
Message-ID: <20111116095405.ea638079e3a2fecca9e4f21b@canb.auug.org.au>
References: <20111115060325.GA19322@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__16_Nov_2011_09_54_05_+1100_V.Eo0wAQdZEiE3et"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:55192 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756764Ab1KOWyO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2011 17:54:14 -0500
In-Reply-To: <20111115060325.GA19322@game.jcrosoft.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__16_Nov_2011_09_54_05_+1100_V.Eo0wAQdZEiE3et
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 15 Nov 2011 07:03:25 +0100 Jean-Christophe PLAGNIOL-VILLARD <plagni=
oj@jcrosoft.com> wrote:
>
> 	the at91 defconfig have changed
>=20
> 	the followong defconfig at91sam9260ek_defconfig,
> 	at91sam9g20ek_defconfig, at91sam9rlek_defconfig, at91cap9adk_defconfig
> 	are replace by at91sam9260_defconfig, at91sam9g20_defconfig
> 	at91cap9_defconfig and at91sam9rl_defconfig
>=20
> 	where all the board are enabled
>=20
> 	to cover all board now we just need to compile this list of defconfg
> 	on AT91
> 	at91cap9_defconfig  at91rm9200_defconfig  at91sam9260_defconfig
> 	at91sam9261_defconfig  at91sam9263_defconfig  at91sam9g20_defconfig
> 	at91sam9g45_defconfig  at91sam9rl_defconfig

Thanks for letting me know.  However, I do not do any at91 builds at the
moment.  Do you know if there is an upstream gcc/binutils that will build
kernels for at91?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Nov_2011_09_54_05_+1100_V.Eo0wAQdZEiE3et
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOwu2NAAoJEECxmPOUX5FEkikP/AlFghyULRjn9sHb1Vvu0qh9
4pbjw0Lydl6EnG1XarmGgiptEAqplBfKTyPcBwPTMD7PZpYw7hPOK0jJ70uZT+9t
hye5FmwOkEDKqbVGzjIUFO8VqPL9mZHAC5GJFnhsFfz+HGfh7x3CeljMS0lub5NP
aogx9Lw1hOH5wPe4KmGDVnp/VzrhHlnUGGq352PZbUWdz0tl9w/8rErDQKctclMJ
zUM/LzqIVxhNeug3T4LF5KJ/YkmDkxnnDY6ziVbKI4s6GT8W82yq3RRSNQnCvXRK
vHd1yOqCJmxhfF5/7akhuqQxHl47rmnewOcE7oDVM8Z3XPIlgMIUC6NwLzHGHzpZ
/s8+u1jdSX1EVdoEP6ULVUfHqadsNpUc8qZA4JTe1W9vtxdPZl8g7jC0C6TWDFgI
Ryf4VJMGrypXm4vqZTD9Ewx2qD3gpaV20DSXYqd6/3iRfPOHae4RfuNIdlHJth2W
dn1CI+6ETv4EeoF9h+WhR8BnJ94LUw4bzVqr0DCaKhb3/iaUpAwe5mDtmDC+IKwy
q2xqiNYFGhLrvJiKtQfXddAfdZTq2WRcwfuJd6wljJMLMmR8E376JxBnYbMP/1pd
UzC8NY6kre3mjKa1gsnmfEJLrwAUCJAjIpTCRGey/d119JXKyEFKDgRUkHVg4u5S
Dr6rXfDSUyt7Tl+IugVZ
=31RB
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Nov_2011_09_54_05_+1100_V.Eo0wAQdZEiE3et--
