From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: vhost tree for linux-next
Date: Fri, 25 Nov 2011 10:42:14 +1100
Message-ID: <20111125104214.c815493e4949af69b1869d17@canb.auug.org.au>
References: <20111124203843.GC4873@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__25_Nov_2011_10_42_14_+1100_ZzmdANIcc1tH.pTE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:58154 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754891Ab1KXXmV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Nov 2011 18:42:21 -0500
In-Reply-To: <20111124203843.GC4873@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__25_Nov_2011_10_42_14_+1100_ZzmdANIcc1tH.pTE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 24 Nov 2011 22:38:44 +0200 "Michael S. Tsirkin" <mst@redhat.com> wr=
ote:
>
> I normally merge things through Dave, Rusty, Jesse or Jens,
> not directly to Linus. However, sometimes there's a large change
> (for example, my recent RFC for pci_iomap changes)
> where estimating how it interacts with other platforms and planned
> changes in the next kernel would be beneficial.
>=20
> For this purpose, it would be helpful if my tree were added to linux-next.
> The tree is:
> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
>=20
> Could you do this please?

1) I asked you to cc this request much wider than this (I do not know
what is going on in all areas of the kernel, so I rely on feedback from
others to determine if stuff should go into linux-next).

2) as fas as I can tell the current contents of that tree was posted for
review/feedback for the first time today.   Give it a few days for any
responses ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Nov_2011_10_42_14_+1100_ZzmdANIcc1tH.pTE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOztZWAAoJEECxmPOUX5FER3kP/3qqFoQp0C+a8+o3Af7fSu2h
LchzJEqEjWsn3DywmN/4niHZCKnZyAtgkPH85iTGrTp40YwjML54W27ZFo01314h
GZeQYj8eA87UwW3S0I1LoHlnjnvjAfIJyzyRYBaMKRuja0ZmAOGSkRx6cjt5IZXv
3STYyA8yKH7hUsDfXO6TNdTymI4Od4TC0GqAOcdOJXwG2SGRAK7JxRxklm0I61A9
JhRofFIG6mfa4dgNHk39IPtp7mM2ej2v1r3QGEE5TTua5VlG5lhE3fyPI5OU1jzJ
9Rem7fecZeNAbclNXKvY1prIeUAItfRna965VyaT3kzvYSnABG0ZTyrgJPgYgpWQ
mqrQDz+95WIJBvfIEe5W3vMYLGes+9juc7nDnIUkx/ZhHB+GQYcCj3UeYo4Lcvs7
8DbdAzC1lzKgZ8RciGMGn7Z7miuQUIz9PmmGHhuT8u3qXSCYVCHSdV1xGDtlhiu8
PVOjHUG3yMJuFTQU4CVORZhJ6mUvPZsFoO7x09VpMpDGnNCwF2Ul6nOaejIqgBmt
VaRaWkjhsMrDBDajlQVUrj2yTbjOBZE6x1qJC68CeWNamRHdo4pL2vSbj8c11buz
iUtDGkoDUrEOLGmNZqFiHpPzhkS9zCAw2flQKJ89DwciBQ6D8AAMqPsoCLcQEUkP
6w7Q8anIoJVuQcrK5EF5
=8N3a
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Nov_2011_10_42_14_+1100_ZzmdANIcc1tH.pTE--
