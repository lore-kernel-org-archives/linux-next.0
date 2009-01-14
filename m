From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: quota tree build failure
Date: Wed, 14 Jan 2009 12:15:51 +1100
Message-ID: <20090114121551.2dc725f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Jan_2009_12_15_51_+1100_OtQgS8Hmp66EHuwG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38144 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752480AbZANBQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Jan 2009 20:16:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__14_Jan_2009_12_15_51_+1100_OtQgS8Hmp66EHuwG
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

Caused by commit 39a225f20e9b881f1c9431d073a62fbf38219614 ("quota:
Improve locking") which removes these functions.

I have dropped the quota tree for today.=20
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Jan_2009_12_15_51_+1100_OtQgS8Hmp66EHuwG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkltPMcACgkQjjKRsyhoI8xxPQCeL1f8ZBBlxy30Z5NOoyjcJI1R
9lQAmQHQGkTUEd5A2ES8kcl61Dn+441k
=+joK
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Jan_2009_12_15_51_+1100_OtQgS8Hmp66EHuwG--
