From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: quota tree build failure
Date: Fri, 6 Feb 2009 14:18:06 +1100
Message-ID: <20090206141806.fdbd5cc3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Feb_2009_14_18_06_+1100_PjweGkHWZnqR777l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47559 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752519AbZBFDSN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 22:18:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Feb_2009_14_18_06_+1100_PjweGkHWZnqR777l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/nfsd/vfs.c: In function 'nfsd_setattr':
fs/nfsd/vfs.c:359: error: implicit declaration of function 'DQUOT_INIT'

Caused by commit 74d9386bc58d5f8b5bcee051e04e7123cd9cac88 ("quota: Remove
uppercase aliases for quota functions").  Seems you missed at least one
of the users.

I have dropped the quota tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Feb_2009_14_18_06_+1100_PjweGkHWZnqR777l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmLq+4ACgkQjjKRsyhoI8zYeQCeIS1hUt08S17GxK3pSbvF70/H
uY0AoKN7grICp1618ZVfV6oTW2wBfbD0
=n631
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Feb_2009_14_18_06_+1100_PjweGkHWZnqR777l--
