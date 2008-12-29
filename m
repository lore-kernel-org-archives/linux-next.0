From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build warnings
Date: Mon, 29 Dec 2008 19:26:49 +1100
Message-ID: <20081229192649.7099188b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_19_26_49_+1100_mJpiZtBkghNUXtFj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44165 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752423AbYL2I06 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 03:26:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_19_26_49_+1100_mJpiZtBkghNUXtFj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/xfs/xfs_inode.c: In function 'xfs_iflush_int':
fs/xfs/xfs_inode.c:3055: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_inode.c:3062: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_inode.c:3072: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_inode.c:3083: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_inode.c:3095: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_inode.c:3102: warning: format '%Lu' expects type 'long long unsi=
gned int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c: In function 'xlog_recover_do_inode_trans':
fs/xfs/xfs_log_recover.c:2300: warning: format '%Ld' expects type 'long lon=
g int', but argument 6 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c:2311: warning: format '%Ld' expects type 'long lon=
g int', but argument 5 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c:2344: warning: format '%Ld' expects type 'long lon=
g int', but argument 7 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c:2357: warning: format '%Ld' expects type 'long lon=
g int', but argument 7 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c:2370: warning: format '%Ld' expects type 'long lon=
g int', but argument 7 has type 'xfs_ino_t'
fs/xfs/xfs_log_recover.c:2380: warning: format '%Ld' expects type 'long lon=
g int', but argument 7 has type 'xfs_ino_t'

I am just flagging these to be consistent.  Ingo will probably say
something about u64 and unsigned long long vs. unsigned long ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_19_26_49_+1100_mJpiZtBkghNUXtFj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYickACgkQjjKRsyhoI8wM5wCgsL3jkOlE2d++f8u28YhRjXym
2ZUAnAwP/JGOFDK4KmaZEvSsU4Zt/qvo
=Sxfz
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_19_26_49_+1100_mJpiZtBkghNUXtFj--
