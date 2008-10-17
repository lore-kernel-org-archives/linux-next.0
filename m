From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 18:42:59 +1100
Message-ID: <20081017184259.b66089bc.sfr@canb.auug.org.au>
References: <20081017183557.f831ab54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_18_42_59_+1100_o6ZFd./ULhMa8LA_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45776 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbYJQHnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 03:43:23 -0400
In-Reply-To: <20081017183557.f831ab54.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

--Signature=_Fri__17_Oct_2008_18_42_59_+1100_o6ZFd./ULhMa8LA_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Fri, 17 Oct 2008 18:35:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the bdev tree got a conflict in
> drivers/ide/ide-floppy.c between commits from the ide tree and commit
> a55897a7d06734d1ae32124a5e19cb903c33b8e3 ("[PATCH] eliminate use of
> ->f_flags in block methods") from the bdev tree.
>=20
> Again you don't need to patch drivers/ide/ide-floppy.c any more, but
> drivers/ide/ide-gd.c instead.  Patch below.

I got a bit harder after that ... so I have again dropped the bdev for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_18_42_59_+1100_o6ZFd./ULhMa8LA_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj4QgQACgkQjjKRsyhoI8y2OACgl0r3chKfaHWH3S6njTQ/VXfj
04UAn1wdr0p/U9WzujQxlM3kuLLgWh7T
=+wXH
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_18_42_59_+1100_o6ZFd./ULhMa8LA_--
