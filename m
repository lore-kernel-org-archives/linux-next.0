From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ocfs2 tree build failure
Date: Thu, 8 Jan 2009 13:01:58 +1100
Message-ID: <20090108130158.d222ceea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Jan_2009_13_01_58_+1100_REV9OL/e2lmhS_ff"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46355 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757330AbZAHCCS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Jan 2009 21:02:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: linux-next@vger.kernel.org, Sunil Mushran <sunil.mushran@oracle.com>

--Signature=_Thu__8_Jan_2009_13_01_58_+1100_REV9OL/e2lmhS_ff
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/ocfs2/super.c: In function 'ocfs2_osb_dump':
fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
fs/ocfs2/super.c:259: error: dereferencing pointer to incomplete type
fs/ocfs2/super.c:261: error: dereferencing pointer to incomplete type

Caused by commit 796868c27387ba9bbad6b9c6b770ed34e2809a73 ("ocfs2: Expose
the file system state via debugfs") since (despite being declared in
fs/ocfs2/ocfs2.h) the struct ocfs2_recovery_map definition is not exposed
beyond fs/ocfs2/journal.c.

I have dropped the ocfs2 tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Jan_2009_13_01_58_+1100_REV9OL/e2lmhS_ff
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkllXpYACgkQjjKRsyhoI8xvCACcCyEeEa6T3+xU8L1JE7g2RHU0
FvAAnjniqGqgeM3fizdqqYm42ICptw9o
=Tvxv
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Jan_2009_13_01_58_+1100_REV9OL/e2lmhS_ff--
