From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Date: Fri, 5 Feb 2016 10:10:04 +0100
Message-ID: <20160205091004.GC1139@lukather>
References: <20160205101412.56e4631b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:50761 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751433AbcBEJKH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2016 04:10:07 -0500
Content-Disposition: inline
In-Reply-To: <20160205101412.56e4631b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Feb 05, 2016 at 10:14:12AM +1100, Stephen Rothwell wrote:
> Hi Maxime,
>=20
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/clk/sunxi/clk-sunxi.c: In function 'sunxi_mux_clk_setup':
> drivers/clk/sunxi/clk-sunxi.c:712:2: warning: 'return' with no value, in =
function returning non-void [-Wreturn-type]
>   return;
>   ^
> drivers/clk/sunxi/clk-sunxi.c:718:20: error: invalid storage class for fu=
nction 'sun4i_cpu_clk_setup'
>  static void __init sun4i_cpu_clk_setup(struct device_node *node)
>                     ^
> drivers/clk/sunxi/clk-sunxi.c:718:1: warning: ISO C90 forbids mixed decla=
rations and code [-Wdeclaration-after-statement]
>  static void __init sun4i_cpu_clk_setup(struct device_node *node)
>  ^
> In file included from include/linux/clk-provider.h:15:0,
>                  from drivers/clk/sunxi/clk-sunxi.c:18:
> include/linux/of.h:937:16: error: initializer element is not constant
>         .data =3D (fn =3D=3D (fn_type)NULL) ? fn : fn  }
>                 ^
> include/linux/of.h:950:3: note: in expansion of macro '_OF_DECLARE'
>    _OF_DECLARE(table, name, compat, fn, of_init_fn_1)
>    ^
>=20
> and on and on ...
>=20
> Caused by commit
>=20
>   1190461d5ad8 ("clk: sunxi: Remove clk_register_clkdev calls")
>=20
> I have used the sunxi tree from next-20160204 for today.

It was a flacky merge on my side, sorry for that.

It's fixed and pushed, hopefully it won't break in the next version.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWtGbsAAoJEBx+YmzsjxAgBM8QAJ/nWp+tImKJzBqB6Zoppt1A
Q3tj6P1vw8EeM3a8WGDIIHaeySsYU+IuD2Psmj1ef0NTOdUL1nCtafPlCQXHcCVR
B1HTHOA9d+1B02KhJRo6NnLARxp2MKJadXPOZ1elH3wPkC8Q7eWz0fRCr291G8y5
Ed1K+BoVcKgqWpL0xMaIqCgXu/bDoHuJvcksBO5IMvwCmeB8MZ8TLu07kxmuHdn+
9FbUj4qhlmsrkR0OvSNurzXlWu3nmGcIpoRaFZ73eGOVXplcAlOLcQPnJBBDus/+
ltbJN84yBq94FrlLGYpETeeD8on1f0IHqIkGIt5B80ZJrgYi0RKEdwfZe4uny7n0
sMns+fLuugXPYB6q5I327EIslspUAQZs6ug3Wkcakxu9b9Vyhd5V2yuJCd+YjKqV
R5NPpcly1FnEw4yjEv5ulhV1hjqEe3oPH/p8t5saq9ptPj5CTgaXU1UdB3p9NEGd
kcvmC8Ux1NEwOJGW4tzXKERp6+Qh9z2/m+TgGqLnuL/1ZaT7Zsn63oLM94i5qHk+
GQgLkJDVXigiLaaYW8ZRRWrrYScqH83C9L2AqQthWyJTtFi5TiRp9iG3UWT4n2ni
9q1a+Q4u2QHIkkQoQkRCJ+MRD2Qz9wQZcD6zyihv7eWl/hhzju/nSRjH4ofDrvBc
sC39SXPJ+1xNDRAtIT4f
=p2ZR
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
