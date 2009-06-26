From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for June 26 (cyclades)
Date: Sat, 27 Jun 2009 03:24:30 +1000
Message-ID: <20090627032430.2c63249a.sfr@canb.auug.org.au>
References: <20090626154605.ac73b738.sfr@canb.auug.org.au>
	<4A44F18D.2000608@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__27_Jun_2009_03_24_30_+1000_IUpvxZ+yFI5qJTLB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41546 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750720AbZFZRYe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2009 13:24:34 -0400
In-Reply-To: <4A44F18D.2000608@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>, Jiri Slaby <jirislaby@gmail.com>

--Signature=_Sat__27_Jun_2009_03_24_30_+1000_IUpvxZ+yFI5qJTLB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2009 09:04:29 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> drivers/char/cyclades.c:3332: error: assignment of read-only location
>=20
> (it's const)

Caused by commit 93d671fe9bcceb522c922223f836f9c54873b866
("tty-cyclades-cleanup") from the ttydev tree.

Adding cc's.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__27_Jun_2009_03_24_30_+1000_IUpvxZ+yFI5qJTLB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpFBE4ACgkQjjKRsyhoI8yEMgCeJ1LKhEkvo8tRZhscMfwtcD+G
02YAnjiIGt8LAPK8anyS+EOIsVMiqN04
=Y+/Y
-----END PGP SIGNATURE-----

--Signature=_Sat__27_Jun_2009_03_24_30_+1000_IUpvxZ+yFI5qJTLB--
