From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Mon, 10 Sep 2012 13:24:16 +1000
Message-ID: <20120910132416.cf70afde92399a420b74bd32@canb.auug.org.au>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
	<20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
	<00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__10_Sep_2012_13_24_16_+1000_gc9J5vM8Lnh6ef5f"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59361 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755909Ab2IJDYT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Sep 2012 23:24:19 -0400
In-Reply-To: <00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>

--Signature=_Mon__10_Sep_2012_13_24_16_+1000_gc9J5vM8Lnh6ef5f
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sat, 8 Sep 2012 18:27:10 +0000 Christoph Lameter <cl@linux.com> wrote:
>
> Thanks Tony for the additional information regarding the pointer. That got
> me thinking about something different.
>=20
> Try the following fix:
>=20
> Subject: slub: Zero initial memory segment for kmem_cache and kmem_cache_=
node
>=20
> Earlier patches in the common set moved the zeroing of the kmem_cache str=
ucture
> into common code. See "Move allocation of kmem_cache into common code".
>=20
> The allocation for the two special structures is still done
> from slub specific code but no zeroing is done since the cache creation f=
unctions
> used to zero. This now needs to be updated so that the structures
> are zeroed during allocation in kmem_cache_init().
> Otherwise random pointer values may be followed.
>=20
> Signed-off-by: Christoph Lameter <cl@linux.com>
>=20
> Index: linux/mm/slub.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/mm/slub.c	2012-09-08 13:21:33.523056357 -0500
> +++ linux/mm/slub.c	2012-09-08 13:22:12.483056947 -0500
> @@ -3705,7 +3705,7 @@
>  	/* Allocate two kmem_caches from the page allocator */
>  	kmalloc_size =3D ALIGN(kmem_size, cache_line_size());
>  	order =3D get_order(2 * kmalloc_size);
> -	kmem_cache =3D (void *)__get_free_pages(GFP_NOWAIT, order);
> +	kmem_cache =3D (void *)__get_free_pages(GFP_NOWAIT|__GFP_ZERO, order);
>=20
>  	/*
>  	 * Must first have the slab cache available for the allocations of the
>=20

I have added this as a merge fix patch to linux-next today in the
anticipation that it will be added to the slab tree ASAP.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__10_Sep_2012_13_24_16_+1000_gc9J5vM8Lnh6ef5f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQTV1gAAoJEECxmPOUX5FExV0P/0VcUQRkNARRVDjqx/FEqQGC
zyO7Oe8H3Q9mfkD6FqGcM/nLlHyaj8eraPdD6HlNDU2fEKm3Obra6D1MmZvMRbwc
+gOb0qDVBxsp20OBZEeLm5wnuA+Km0XvxdghzxlJxTar4JVyddiHvHLQ2/dGH3FS
iOygHsZe6bLZsmn69ZGZcF28JnzHNkXNOsYoSdfoy0tgspiKQ4P6HZMCADfatqOC
nCxVtMWuuOK9YeKhXE3LsCo5uW8dPyzsrZr9L1uLVQ5U3SUyXzkuozghrawFSXzb
fbd3CGIKasG0ro2jmHZ0SdRh+1rlDffQRwqda46wqzG0r9blSBVlKuNJDC9k6ZHV
HqbviX6jC6ggiQCOjOAmasvwcW9ULfghbYePnEeoTZR0zn8jYFZfiGcPNSGoM5Yx
Z3z1yEtyIRq7Yj4zcQfFLus3vTFI6gHr7H/d7vy7ORLEoBW0RukimkDQ9jr+Ewgm
9AraunKXAfbbSH1NX0GjtYbl0onQOp2MPlFmteEEZXoBtwK8jZMda97k77xjFspX
3FVDPIICEKEUO1iHQpPTUrMpwWKo8qchV17EnsxkXYf4coGkktNi8LhiHHa1VZey
+aqv1ZYmMkL/X+nktCqakMrCre8umTr8wcc7TyS3VIIM35csxwBO8pEf+ozLBasB
j0X5WHGpEf2M3DMVsL+t
=DknJ
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Sep_2012_13_24_16_+1000_gc9J5vM8Lnh6ef5f--
