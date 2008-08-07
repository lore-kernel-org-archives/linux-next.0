From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mtd tree build failure
Date: Fri, 8 Aug 2008 00:19:39 +1000
Message-ID: <20080808001939.574e7fad.sfr@canb.auug.org.au>
References: <20080807133005.d37ea7b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Aug_2008_00_19_39_+1000_qIRU3CX4aUfwGQmM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37111 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751147AbYHGOTt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 10:19:49 -0400
In-Reply-To: <20080807133005.d37ea7b8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Alexey Korolev <akorolev@infradead.org>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__8_Aug_2008_00_19_39_+1000_qIRU3CX4aUfwGQmM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 7 Aug 2008 13:30:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> ERROR: "qry_present" [drivers/mtd/chips/cfi_probe.ko] undefined!
> ERROR: "qry_mode_off" [drivers/mtd/chips/cfi_probe.ko] undefined!
> ERROR: "qry_mode_on" [drivers/mtd/chips/cfi_probe.ko] undefined!
>=20
> Caused by commit 2e489e077a6ad118c4f247faedf330117b107cce ("[MTD] [NOR]
> Add qry_mode_on()/qry_omde_off() to deal with odd chips").

Also from an arm cam60_defconfig build:

drivers/built-in.o: In function `cfi_probe_chip':
i2c-dev.c:(.text+0x497a4): undefined reference to `qry_mode_on'
i2c-dev.c:(.text+0x49810): undefined reference to `qry_present'
i2c-dev.c:(.text+0x49850): undefined reference to `qry_mode_off'
i2c-dev.c:(.text+0x498a0): undefined reference to `qry_mode_off'
i2c-dev.c:(.text+0x498b0): undefined reference to `qry_present'
i2c-dev.c:(.text+0x498c8): undefined reference to `qry_mode_off'
i2c-dev.c:(.text+0x498d8): undefined reference to `qry_present'
i2c-dev.c:(.text+0x49ca4): undefined reference to `qry_mode_off'

This is today's linux-next with these symbols exported (which obviously
makes no difference here).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Aug_2008_00_19_39_+1000_qIRU3CX4aUfwGQmM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkibBHsACgkQjjKRsyhoI8xxRQCbB0OmrkkX5v7XQGPesik5NWli
7YwAn1+g48X0SzIuV5L+qMf+TMl+cDSU
=rHsJ
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Aug_2008_00_19_39_+1000_qIRU3CX4aUfwGQmM--
