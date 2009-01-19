From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch device-mapper quilt series
Date: Tue, 20 Jan 2009 10:03:20 +1100
Message-ID: <20090120100320.302bea89.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_Jan_2009_10_03_20_+1100_4pRwnpEEOc8Y6Rcu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37330 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751925AbZASXDl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 18:03:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__20_Jan_2009_10_03_20_+1100_4pRwnpEEOc8Y6Rcu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

This morning I got this error while fetching device-mapper quilt tree
from master.kernel.org:

rsync: link_stat "/pub/linux/kernel/people/agk/patches/2.6/editing/series" =
failed: No such file or directory (2)

And, indeed, that directory is empty.  I will use what I have previously
fetched.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_Jan_2009_10_03_20_+1100_4pRwnpEEOc8Y6Rcu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl1BrgACgkQjjKRsyhoI8yWswCfU8vsbVuH84xMJTyYVwi2m0bu
OyQAn2/CmMNaL1+O8HdKZkpKB0ldJfET
=ky0M
-----END PGP SIGNATURE-----

--Signature=_Tue__20_Jan_2009_10_03_20_+1100_4pRwnpEEOc8Y6Rcu--
