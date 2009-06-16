From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build warning
Date: Tue, 16 Jun 2009 16:07:51 +1000
Message-ID: <20090616160751.4acfdf1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Jun_2009_16_07_51_+1000_5x=_1KO7FNrA4GY5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35677 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763809AbZFPGHz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 02:07:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <sfrench@us.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

--Signature=_Tue__16_Jun_2009_16_07_51_+1000_5x=_1KO7FNrA4GY5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/cifs/dns_resolve.c: In function 'is_ip':
fs/cifs/dns_resolve.c:42: warning: passing argument 1 of 'cifs_convert_addr=
ess' discards qualifiers from pointer target type
fs/cifs/cifsproto.h:77: note: expected 'char *' but argument is of type 'co=
nst char *'

Introduced by commit 1e68b2b2756fc3488ecbade5ad5f13302b3aaafc ("cifs: add
new routine for converting AF_INET and AF_INET6 addrs").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Jun_2009_16_07_51_+1000_5x=_1KO7FNrA4GY5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3NrcACgkQjjKRsyhoI8ya6ACgusfaC4+yUgAFuauJ2mtCopQ6
r80AoJWHI7nTOp0wKd6B5Av7J5rkeoCY
=rbdj
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Jun_2009_16_07_51_+1000_5x=_1KO7FNrA4GY5--
