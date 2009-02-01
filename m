From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  kernel-doc quilte serie import failure
Date: Mon, 2 Feb 2009 09:48:01 +1100
Message-ID: <20090202094801.c0a61634.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_09_48_01_+1100_v479xppmwMfDrLFw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54298 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753206AbZBAWsI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 17:48:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__2_Feb_2009_09_48_01_+1100_v479xppmwMfDrLFw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Today's linux-next import of the kernel-doc quilt series failed like this:

Importing kernel-doc based on 2.6.29-rc2-next-20090126
fatal: Needed a single revision
Unknown BASE

Trees imported into linux-next cannot be based on linux-next itself (or
we would end up merging in old versions of other trees).  I have dropped
the kernel-doc tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_09_48_01_+1100_v479xppmwMfDrLFw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGJqEACgkQjjKRsyhoI8yD3wCgtXz2k1iULHK0B+rxN90C2moR
Gf0An2f3yPB5OIlnAiEf/T9zdUl8eUTm
=dWMB
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_09_48_01_+1100_v479xppmwMfDrLFw--
