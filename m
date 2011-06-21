From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the s390 tree
Date: Tue, 21 Jun 2011 13:37:40 +1000
Message-ID: <20110621133740.b23b87d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Jun_2011_13_37_40_+1000_tGnOs94Zzb6RWnwh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56819 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755271Ab1FUDhv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jun 2011 23:37:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaliy Ivanov <vitalivanov@gmail.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Tue__21_Jun_2011_13_37_40_+1000_tGnOs94Zzb6RWnwh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
arch/s390/kvm/sie64a.S between commit 57e98c34511e ("[S390] move sie code
to entry.S") from the s390 tree and commit e44ba033c565 ("treewide:
remove duplicate includes") from the trivial tree.

The former merged this file into another file, so I just removed this file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Jun_2011_13_37_40_+1000_tGnOs94Zzb6RWnwh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOABIEAAoJEDMEi1NhKgbsIJYH/3w/mH8opPkev4MQ7vPjXpQL
AQ6X1YV8nuQMz9WYcqscEmDeYNcJvIo77zIlrQSf9kX3yxXW4/dEhWI+pO2kOjmB
AnHbZLnUEuofei9vKHLF150+qeWLJHzEnB3NW1SrTvwNWtL1lZfXaGk0pk8HtN0n
43SVTZfno3Z9ZbrlcdG8q9wsPrRANZVKDEhpzdeYDaDNSwmlGc9BhJsZzBd55muH
OMJ9C9oMmIHJupgMf/2ost2Oxse2rtmghaQbwcB2kapEXOfF7eRXDL+d6Xu9H2LW
MgPHJ+GS2cV6hPV7AehVA64bjct53Wy9xJcN8yoHkMvirKqMDaBsxA8ZX96myTg=
=pa9g
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Jun_2011_13_37_40_+1000_tGnOs94Zzb6RWnwh--
