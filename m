From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 28 Jul 2008 13:13:39 +1000
Message-ID: <20080728131339.b12bcaec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_13_13_39_+1000_+xKa68zDLM/JMYNI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47230 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751668AbYG1DNp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Jul 2008 23:13:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

--Signature=_Mon__28_Jul_2008_13_13_39_+1000_+xKa68zDLM/JMYNI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
fs/reiserfs/journal.c between commit
afe70259076fff0446001eaa1a287f615241a357 ("reiserfs: convert j_flush_sem
to mutex") from Linus' tree and commit
fd0eea245ccc61779d3155066d21a06fe3320524
("misc:down_nowait-fs_reiserfs_journal") from the rr tree.

The former commit changed the semaphore to a mutex, so I expect the
latter patch is no longer needed.  I used the version in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_13_13_39_+1000_+xKa68zDLM/JMYNI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNOWMACgkQjjKRsyhoI8xYYwCgqcsDXgoy+Asoh11F2ZFKoFfa
axQAoK0s7H+SrmQSOngn4we17R3ormYv
=AK1Q
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_13_13_39_+1000_+xKa68zDLM/JMYNI--
