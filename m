From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty.current tree
Date: Tue, 27 Apr 2010 09:23:46 +1000
Message-ID: <20100427092346.12c4ecaa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_Apr_2010_09_23_46_+1000_hIq1GjxQRooQpg7e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38505 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751622Ab0DZXXv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Apr 2010 19:23:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

--Signature=_Tue__27_Apr_2010_09_23_46_+1000_hIq1GjxQRooQpg7e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty.current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/isicom.c: In function 'isicom_open':
drivers/char/isicom.c:875: warning: unused variable 'card'

Introduced by commit 746b212efb4664117612c7f43f880d230588d617 ("tty: Fix
regressions in the char driver conversion").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_Apr_2010_09_23_46_+1000_hIq1GjxQRooQpg7e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvWIIIACgkQjjKRsyhoI8xpMQCePrNm4sNPQbjOy4aeapbSwne/
aSgAnjUKPjRrXgTRg8/ekXhpwWh16u3y
=V3OR
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Apr_2010_09_23_46_+1000_hIq1GjxQRooQpg7e--
