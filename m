From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ocfs2 tree build failure
Date: Tue, 25 Nov 2008 16:42:04 +1100
Message-ID: <20081125164204.6817a397.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_16_42_04_+1100_QA7wppPQ/Zrbbx3j"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51929 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbYKYFmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 00:42:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mark.fasheh@oracle.com>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>

--Signature=_Tue__25_Nov_2008_16_42_04_+1100_QA7wppPQ/Zrbbx3j
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next build (x86_64 allmodconfig) failed like this:

usr/include/linux/dqblk_v2.h:8: included file 'linux/dqblk_qtree.h' is not =
exported
make[4]: *** [/scratch/sfr/x86_64_allmodconfig/usr/include/linux/.check] Er=
ror 1

Caused by commit 603f68d0c2b66052093ea29bf1ff7a8a58667af6 ("quota: Split
off quota tree handling into a separate file").  dqblk_qtree.h needs to
be added to the Kbuild file.

I have added that just for today.  I expect this to be fixed tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_16_42_04_+1100_QA7wppPQ/Zrbbx3j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrkCwACgkQjjKRsyhoI8wdmwCgjJxliXBozxhC/jfqDiG9AsVM
5JsAniCMRsDgBxWqwDjPjaS8EvQJghq3
=Ig+M
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_16_42_04_+1100_QA7wppPQ/Zrbbx3j--
