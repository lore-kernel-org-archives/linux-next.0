From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 21:21:28 +1100
Message-ID: <20090123212128.16cd5698.sfr@canb.auug.org.au>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
	<20090122.235612.256786187.davem@davemloft.net>
	<20090123190103.1420c62f.sfr@canb.auug.org.au>
	<20090123.001337.179440063.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_21_21_28_+1100_k6vyq=8gCOzmonBt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49817 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752951AbZAWKVf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 05:21:35 -0500
In-Reply-To: <20090123.001337.179440063.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Fri__23_Jan_2009_21_21_28_+1100_k6vyq=8gCOzmonBt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 23 Jan 2009 00:13:37 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Ok, if one was in the BSS then very likely my patch will fix
> things.
>=20
> Look forward to your test results :)
>=20

I did some builds just using Debian Sid's native x86 gcc and binutils:

$ gcc --version
gcc (Debian 4.3.2-4) 4.3.3 20090119 (prerelease)
Copyright (C) 2008 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ as --version
GNU assembler (GNU Binutils for Debian) 2.18.0.20080103
Copyright 2007 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or later.
This program has absolutely no warranty.
This assembler was configured for a target of `i486-linux-gnu'.

Without your patch:

$ objdump -t com20020*.o | grep _ops
0000000000000000 g     O .bss	00000000000000a8 com20020_netdev_ops
0000000000000000 g     O .rodata	00000000000000a8 com20020_netdev_ops

So it is not powerpc specific.  (The powerpc toolchain (gcc 4.3.2m
binutils 2.19) was built by me from gnu sources, so it is not Debian
specific either.)

With your patch:

$ objdump -t com20020*.o | grep _ops
0000000000000000         *UND*	0000000000000000 com20020_netdev_ops
0000000000000000 g     O .rodata	00000000000000a8 com20020_netdev_ops

So, this could be a compiler bug?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_21_21_28_+1100_k6vyq=8gCOzmonBt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl5migACgkQjjKRsyhoI8zQnACgow2ZpyNibPl1HrFcOLRsvpFN
ZkkAmwQnkv34yWl3YBY3U6BvXR36gQpn
=RMV8
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_21_21_28_+1100_k6vyq=8gCOzmonBt--
