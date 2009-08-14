From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ground rules
Date: Fri, 14 Aug 2009 18:02:46 +1000
Message-ID: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Aug_2009_18_02_46_+1000_7=tvxKSrDTZRC0m7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752586AbZHNIEJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2009 04:04:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

--Signature=_Fri__14_Aug_2009_18_02_46_+1000_7=tvxKSrDTZRC0m7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[This email has been bcc'd to all the current contributors to
linux-next.  No response is required unless you have some issue with the
following.]

Thanks for being a participant of linux-next.  I have been asked by my=20
employer to send you this e-mail summarizing these "ground rules" for the=20
project:

The linux-next integration testing is not a judgment of your code.  The=20
purpose of linux-next is for integration testing and to lower the impact=20
of conflicts between subsystems in the next merge window.=20

You need to ensure that the patches/commits in your tree/series have been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are=20
public and will be included in the linux-next trees.  You may be sent=20
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Fri__14_Aug_2009_18_02_46_+1000_7=tvxKSrDTZRC0m7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqFGiYACgkQjjKRsyhoI8yFAgCfR+24nAVAUToZGkzFTtdT9vEq
TfIAnRVVeKA5xal4qqXFw3KE0lh77Y3M
=G5dR
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Aug_2009_18_02_46_+1000_7=tvxKSrDTZRC0m7--
