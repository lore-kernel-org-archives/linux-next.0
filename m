From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: gfs2 tree build failure
Date: Fri, 27 Jun 2008 15:12:25 +1000
Message-ID: <20080627151225.1fe44918.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Jun_2008_15_12_25_+1000_6wgWLMJCvBXTE42N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57735 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751097AbYF0FNK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 01:13:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__27_Jun_2008_15_12_25_+1000_6wgWLMJCvBXTE42N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steven,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "gdlm_release_all_locks" [fs/gfs2/locking/dlm/lock_dlm.ko] undefined!

Commit 98ea8e79ff4dfa804690831248881fa6b2145978 ("[GFS2] Remove all_list
from lock_dlm") missed one call site of the gdlm_release_all_locks
function which it removed.  It also neglected to remove the declaration
of that function from fs/gfs2/locking/dlm/lock_dlm.h. I have reverted
that commit.

Sorry, Steven, but I don't see how that could have been build tested ...
please take a little more care.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Jun_2008_15_12_25_+1000_6wgWLMJCvBXTE42N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhkdroACgkQTgG2atn1QN9f7QCeIRRYpF78F62D+yzXvKloZF1i
gPEAn1GQv8Et9Z7JHGVcxies7ruaGt5g
=tG/m
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jun_2008_15_12_25_+1000_6wgWLMJCvBXTE42N--
