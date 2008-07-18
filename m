From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 15:36:29 +1000
Message-ID: <20080718153629.93410869.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_15_36_29_+1000_qIV0IVZi5JaN3Z+6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60402 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751308AbYGRFgl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 01:36:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

--Signature=_Fri__18_Jul_2008_15_36_29_+1000_qIV0IVZi5JaN3Z+6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got conflicts in
arch/mips/kernel/irixelf.c and include/asm-mips/namei.h between commit
2957c9e61ee9c37e7ebf2c8acab03e073fe942fd ("[MIPS] IRIX: Goodbye and
thanks for all the fish") from the mips tree and commit
2d810d154f1ffc5c637acdb067693773efb09540 ("[PATCH] kill altroot") from
the vfs tree.

I removed both files.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_15_36_29_+1000_qIV0IVZi5JaN3Z+6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAK90ACgkQjjKRsyhoI8zIVwCbB9AnACWg5TsWlhmh7wx4+bRO
XxsAn33qdcYGjdJUTT3u7Cd1veWHz5xi
=E5c6
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_15_36_29_+1000_qIV0IVZi5JaN3Z+6--
