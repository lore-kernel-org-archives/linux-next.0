From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] bus: fix omap compile error if CONFIG_OF is true
Date: Wed, 5 Sep 2012 07:37:10 +1000
Message-ID: <20120905073710.566eabb8561b1a701a58e438@canb.auug.org.au>
References: <20120904144123.25261.79625.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__5_Sep_2012_07_37_10_+1000_XFyW8kQxDc+iZM1q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:45633 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932569Ab2IDVh2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 17:37:28 -0400
In-Reply-To: <20120904144123.25261.79625.stgit@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kishon@ti.com, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Wed__5_Sep_2012_07_37_10_+1000_XFyW8kQxDc+iZM1q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 04 Sep 2012 15:41:35 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
>
> From: Alan Cox <alan@linux.intel.com>
>=20
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> ---
>=20
>  drivers/bus/omap-ocp2scp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
> index 9075ef8..ff63560 100644
> --- a/drivers/bus/omap-ocp2scp.c
> +++ b/drivers/bus/omap-ocp2scp.c
> @@ -67,7 +67,7 @@ static const struct of_device_id omap_ocp2scp_id_table[=
] =3D {
>  	{ .compatible =3D "ti,omap-ocp2scp" },
>  	{}
>  };
> -MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
> +MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
>  #endif
> =20
>  static struct platform_driver omap_ocp2scp_driver =3D {

This was caused by commit 26a84b3eaef0 ("drivers: bus: add a new driver
for omap-ocp2scp") which has been in the arm-soc tree for a few days ...

Thanks, Alan.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__5_Sep_2012_07_37_10_+1000_XFyW8kQxDc+iZM1q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQRnSGAAoJEECxmPOUX5FESMYP/RvuucZOe7Xu6Uf/Jxa2tq1u
fpnMNLer0+ytgMB/QOy3wcuYqqZOEO955vs3MdHPbLoCZHWw0Kk3ZKG3XtwxtLxK
bHeAuWrBTkcHMf7guAXIttQdr6NH+yGc6z6VPkvxKpJcL6owt4M5PKAbBe4rQif9
BfLeqRKgAIWeTP/sYXPFa6GDNLucv2vGm0veO8Mq446EbLfTSZb8whmk90w/Sgbj
FjxuOXvTV/t9FemQVWx/QzjqFHc59XqxqGX1gpxRhMPAGiyFArRsofNlzPrEUaHv
DQvvafq9unQCAux5CG5fDZH3Td/TBiw1BxOtDKKQ0xmzvzvKNeY9H3ilveVxMKcs
aC6dCv5cvL/kvTjDE2hQf2ZO5MDsI+PEgWrw60E8DcmyBC6aQz2geZgSP0TMU8bW
6y6F8IkSAnzPgUrs1+fwlXoPrCYhi0FobqSQwD05R9TiU6TcGxOp/tRUCe98q/0c
bjHq8zK6uND18rmRVSTkhxC1XJ4Rby5QGStRex+dEFEOxE4INMyZaZOpVz4RXHhU
SETGHhJinQm6J0BVoTp+z6j9ir4u3zenTOdnPtS4kkIDG3L3Gnw2Pgk5hV2uxf8D
5wJFDCfV3P0ofoPkN062LQQWhJudInYFJsvXvhCZQqd++jozS1E3/ACtowWh3+Ot
ahX8rJIa2EXfZAss8qoY
=ju/P
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Sep_2012_07_37_10_+1000_XFyW8kQxDc+iZM1q--
