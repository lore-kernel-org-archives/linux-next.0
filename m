From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  ide quilt series import failure
Date: Mon, 2 Feb 2009 09:48:15 +1100
Message-ID: <20090202094815.ffb1f4de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_09_48_15_+1100_7oJUJfD7T/25RND9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54308 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753393AbZBAWsU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 17:48:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__2_Feb_2009_09_48_15_+1100_7oJUJfD7T/25RND9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next import of the ide quilt series failed like this:

ide-remove-ide_arch_intr-v2.patch
error: include/asm-m68k/ide.h: does not exist in index

include/asm-m68k has been moved by commit
49148020bcb6910ce71417bd990a5ce7017f9bd3 ("m68k,m68knommu: merge header
files") which was merged into Linus' tree on 2009-01-27.

I will drop the ide tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_09_48_15_+1100_7oJUJfD7T/25RND9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGJq8ACgkQjjKRsyhoI8wjrgCfc2pyLyx6sPJWjsMywgRUKyRM
RJcAniyEOzNrbARD7XQRO1FPzX4C9ePq
=dpQg
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_09_48_15_+1100_7oJUJfD7T/25RND9--
