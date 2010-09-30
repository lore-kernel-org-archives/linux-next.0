From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (nfs tree
 related)
Date: Thu, 30 Sep 2010 13:58:34 +1000
Message-ID: <20100930135834.dc73dfac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Sep_2010_13_58_34_+1000_BUUwJU_KsCkoL.nA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34049 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753894Ab0I3D6o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 23:58:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Schumaker <bjschuma@netapp.com>

--Signature=_Thu__30_Sep_2010_13_58_34_+1000_BUUwJU_KsCkoL.nA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

fs/nfs/idmap.c: In function 'nfs_idmap_init':
fs/nfs/idmap.c:79: error: implicit declaration of function 'IS_ERR'
fs/nfs/idmap.c:80: error: implicit declaration of function 'PTR_ERR'
fs/nfs/idmap.c: In function 'nfs_idmap_request_key':
fs/nfs/idmap.c:170: error: implicit declaration of function 'IS_ERR_OR_NULL'

Caused by commit 892c16b2faae80ce1a3b3bd280a93533cd4f04a6 ("NFS: new
idmapper").  I guess an include of linux/err.h is missing.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Sep_2010_13_58_34_+1000_BUUwJU_KsCkoL.nA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMpArqAAoJEDMEi1NhKgbsqK0H/2tsrvVT4J7x0w+A+f5LlUOA
E9uK6Cbh/wwoLBaA3SDuo8l3t97NMSuv1FH+LqU+J3J7Q4vaopkfXJn3qT4djNjp
z9MMl9KJt3EUlhvTAyqSwyZuUFScypMoPFinT+EQWR/CNUBg0mMxwbjRCeWamG5K
OiIl79RYJaAbYw/NtvIWBDP4CSLJpeiHUOSUlqD+ZyzzJQrOuY9ZBCjiS/Jbnk1r
PAvQ5f22zkxYXz042nKcksoSR7ifIPkXrZMxXJEpprkwUcCagtAoz3N7KXOqeIZB
Q/KCpSX3YG7PVL5SSKHGvIqgfKKXS1O/1waNrWoJSIE0O6+xRXLzEWzXLqbIUHg=
=Mtua
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Sep_2010_13_58_34_+1000_BUUwJU_KsCkoL.nA--
