From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please hold off 2.6.28 stuff
Date: Mon, 21 Jul 2008 13:51:08 +1000
Message-ID: <20080721135108.d4ca4be5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__21_Jul_2008_13_51_08_+1000_WY8xHI_DZj7tqGWk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34005 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759046AbYGUDvU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Jul 2008 23:51:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Mon__21_Jul_2008_13_51_08_+1000_WY8xHI_DZj7tqGWk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Andrew mentioned this and I just thought I would reinforce the message:

Please do not put 2.6.28 code into linux-next until at least after -rc1.
This will help Andrew's sanity :-)

So the day that -RC1 is released, I would like for linux-next to be
just about empty wrt Linus' tree.  (Apart from bug fixes and late merges,
of course).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__21_Jul_2008_13_51_08_+1000_WY8xHI_DZj7tqGWk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiEB6wACgkQjjKRsyhoI8yB5ACeNw1F7Tsl8Cq5FBQmm95au37D
PpgAnjJUTlCXa0od1SyUtIvQ3F783bql
=O1Sn
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jul_2008_13_51_08_+1000_WY8xHI_DZj7tqGWk--
