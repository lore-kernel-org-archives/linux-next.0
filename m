From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mtd tree
Date: Wed, 10 Dec 2008 13:08:06 +1100
Message-ID: <20081210130806.27fcb097.sfr@canb.auug.org.au>
References: <20081127151548.eb40da3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Dec_2008_13_08_06_+1100_F_caQIUAQ1IG5cjf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33726 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754062AbYLJCIR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 21:08:17 -0500
In-Reply-To: <20081127151548.eb40da3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Andrew Morton <akpm@linux-foundation.org>, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Wed__10_Dec_2008_13_08_06_+1100_F_caQIUAQ1IG5cjf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 27 Nov 2008 15:15:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the mtd tree got a conflict in
> drivers/mtd/maps/physmap.c between commit
> a64cbdb4da5c8482929e7bc9c542e9757ad3e0f1 ("mtd: struct device - replace
> bus_id with dev_name(), dev_set_name()") from the driver-core tree and
> commit 3136e903fa2d493ebc1b8a8fbdde2d3a17f85acd ("[MTD] physmap: fix
> memory leak on physmap_flash_remove by using devres") from the mtd tree.
>=20
> I fixed it up (see below) and can carry it for a short while.
>=20
> Dave, you should apply the patch from the driver-core tree (which was
> cc:d to you) (and cope with the rejects :-)) and let Greg KH know when
> you have.
>=20
> diff --cc drivers/mtd/maps/physmap.c
> index 8e2ee92,dfbf3f2..0000000
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@@ -114,10 -105,10 +105,10 @@@ static int physmap_flash_probe(struct p
>   		       (unsigned long long)(dev->resource[i].end - dev->resource[i].s=
tart + 1),
>   		       (unsigned long long)dev->resource[i].start);
>  =20
> - 		info->res =3D request_mem_region(dev->resource[i].start,
> - 					       dev->resource[i].end - dev->resource[i].start + 1,
> - 					       dev_name(&dev->dev));
> - 		if (info->res =3D=3D NULL) {
> + 		if (!devm_request_mem_region(&dev->dev,
> + 			dev->resource[i].start,
> + 			dev->resource[i].end - dev->resource[i].start + 1,
>  -			dev->dev.bus_id)) {
> ++			dev_name(&dev->dev))) {
>   			dev_err(&dev->dev, "Could not reserve memory region\n");
>   			err =3D -ENOMEM;
>   			goto err_out;

This conflict is now in the driver-core tree as the mtd tree has been
merged into Linus' tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Dec_2008_13_08_06_+1100_F_caQIUAQ1IG5cjf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk/JIYACgkQjjKRsyhoI8x3xACgv592Zrh/DDW93ESs3Q13EAQ7
H4QAnRHcHzeb1FW+iYOSxfbZcY0s+Zvt
=lPFc
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Dec_2008_13_08_06_+1100_F_caQIUAQ1IG5cjf--
