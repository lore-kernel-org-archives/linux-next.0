From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Wed, 9 Jul 2008 12:45:17 +1000
Message-ID: <20080709124517.70ce50be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_12_45_17_+1000_9kUAYy0ozOTHzfwL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49433 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752205AbYGICp1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 22:45:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__9_Jul_2008_12_45_17_+1000_9kUAYy0ozOTHzfwL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got a conflict in
drivers/ide/arm/palm_bk3710.c between commit
ffab6cf44e9058fe75a33aa86386b22e616a8f6f ("palm_bk3710: fix IDECLK period
calculation") from Linus' tree (which is also in the ide tree) and
various commits from the ide tree.

I just used the ide tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_12_45_17_+1000_9kUAYy0ozOTHzfwL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0Jj0ACgkQjjKRsyhoI8x5vwCgps33EsjUwdnHVtfSjjqbPM3Q
N+8AniTJTkXZMRvsHQwoh6AXrljlIsEz
=Po1j
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_12_45_17_+1000_9kUAYy0ozOTHzfwL--
