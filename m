From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: quota tree build warning
Date: Thu, 5 Feb 2009 17:28:23 +1100
Message-ID: <20090205172823.e6b203bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_17_28_23_+1100_85njE_seaCGJVsyz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45494 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752240AbZBEG2d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 01:28:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>

--Signature=_Thu__5_Feb_2009_17_28_23_+1100_85njE_seaCGJVsyz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/ext4/super.c:949: warning: initialization from incompatible pointer type

The line is this:

        .get_reserved_space =3D ext4_get_reserved_space,

Where ext4_get_reserved_space() returns unsigned long long, but the
get_reserved_space prototype returns a qsize_t (which is long long).

Introduced by commit dafa34c7ba30012a7cacffb98e978e5edb74457f ("ext4: quota
reservation for delayed allocation").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_17_28_23_+1100_85njE_seaCGJVsyz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKhwcACgkQjjKRsyhoI8z2LQCggGEo2HcdaCa1cF8xNUzyKrJO
U08AnjfM+SnunYl4ejNew2QT9iBc2gy5
=ncEO
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_17_28_23_+1100_85njE_seaCGJVsyz--
