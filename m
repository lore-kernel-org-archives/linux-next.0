From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 5 Jan 2009 10:30:36 +1100
Message-ID: <20090105103036.dacccbed.sfr@canb.auug.org.au>
References: <20081222173213.b7340f63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__5_Jan_2009_10_30_36_+1100_BKZI3IuondpllFsH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41369 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751496AbZADXaz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 18:30:55 -0500
In-Reply-To: <20081222173213.b7340f63.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Rusty Russell <rusty@rustcorp.com.au>, Mark McLoughlin <markmc@redhat.com>

--Signature=_Mon__5_Jan_2009_10_30_36_+1100_BKZI3IuondpllFsH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 22 Dec 2008 17:32:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rr tree got a conflict in
> drivers/virtio/virtio_pci.c between commit
> b5146336e3bc3786712919e94106063036dae86b ("virtio: do not statically
> allocate root device") from the driver-core tree and commits
> f53dba3a1ea82dfb37f094a942ae74032413809f ("virtio: struct device -
> replace bus_id with dev_name(), dev_set_name()") and
> ab4e479d47ceac2fa5bebd5b99d27f01fe0e0c8b ("virtio: add PCI device release
> () function") from the rr tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary.  Mark, does
> this driver-core patch obsolete the second rr tree patch above?
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>=20
> diff --cc drivers/virtio/virtio_pci.c
> index f772cc4,265fdf2..0000000
> --- a/drivers/virtio/virtio_pci.c
> +++ b/drivers/virtio/virtio_pci.c
> @@@ -324,7 -343,8 +340,8 @@@ static int __devinit virtio_pci_probe(s
>   	if (vp_dev =3D=3D NULL)
>   		return -ENOMEM;
>  =20
>  -	vp_dev->vdev.dev.parent =3D &virtio_pci_root;
>  +	vp_dev->vdev.dev.parent =3D virtio_pci_root;
> + 	vp_dev->vdev.dev.release =3D virtio_pci_release_dev;
>   	vp_dev->vdev.config =3D &virtio_pci_config_ops;
>   	vp_dev->pci_dev =3D pci_dev;
>   	INIT_LIST_HEAD(&vp_dev->virtqueues);

This conflict is now between Linus' tree and the driver-core tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__5_Jan_2009_10_30_36_+1100_BKZI3IuondpllFsH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklhRpwACgkQjjKRsyhoI8zLEACcC3apzyu6axXcIaED/dkjq9R/
ltcAoJTMAwZYJXlhZlobr7JhHJcxJo6W
=xMkC
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Jan_2009_10_30_36_+1100_BKZI3IuondpllFsH--
