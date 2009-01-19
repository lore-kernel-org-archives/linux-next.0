From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: quota tree build failure
Date: Mon, 19 Jan 2009 13:01:47 +1100
Message-ID: <20090119130147.b2d85e49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_Jan_2009_13_01_47_+1100_2PIKu1gDqAy.3L2J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41617 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756915AbZASCB4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Jan 2009 21:01:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_Jan_2009_13_01_47_+1100_2PIKu1gDqAy.3L2J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_initialize':
fs/ocfs2/quota_global.c:858: error: implicit declaration of function 'dquot=
_is_cached'
fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_drop':
fs/ocfs2/quota_global.c:962: error: implicit declaration of function 'dquot=
_drop_locked'

Immediate cause is commit cc33412fb1f11613e20f9dfc2919a77ecd63fbc4
("quota: Improve locking").  If you are going to remove an API, you need
to fix up the callers.

I have dropped the quota tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_13_01_47_+1100_2PIKu1gDqAy.3L2J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklz3wsACgkQjjKRsyhoI8wMEACgvh2YF2sVyYK8cD3+UJb/u8B+
YTgAmwdNk/cBoMozCc3ociycBVUGJSee
=3qH5
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_13_01_47_+1100_2PIKu1gDqAy.3L2J--
