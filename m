From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the blackfin tree with Linus' tree
Date: Fri, 24 Apr 2015 10:16:19 +1000
Message-ID: <20150424101619.1eaa6cdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//=R9TtE06Gaj.xfiGMvDxxp"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51253 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754350AbbDXAQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2015 20:16:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Miao <realmz6@gmail.com>, Mike Frysinger <vapier.adi@gmail.com>, Bob Liu <lliubbo@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicholas Mc Guire <hofrat@osadl.org>

--Sig_//=R9TtE06Gaj.xfiGMvDxxp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the blackfin tree got a conflict in
arch/blackfin/mach-common/smp.c between commit a17b4b7487eb ("blackfin:
Use common outgoing-CPU-notification code") from Linus' tree and commit
ca2b83264d99 ("blackfin: make timeout HZ independent") from the
blackfin tree.

I fixed it up (the former supercedes the latter, I think) and can carry
the fix as necessary (no action is required).

P.S. Steven, you committed that blackfin tree patch, but did not add you
Signed-off-by ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_//=R9TtE06Gaj.xfiGMvDxxp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVOYtXAAoJEMDTa8Ir7ZwVOzsP/Aw+F/Qbhp0g61oqsJKrpPmz
N+ovpc4fWjaf3zf/+dL6k0Sk0rt6kpKW/fVUo0F4Rysf8BwBmG7MTISRX8sCTgk7
hnZ6/pjr+3jMM4v/clP96lKJoaHNHY+by0GxZUXZxzV6GmWetC4sSgKJTt9AFhDW
ELFZn4WogqqEEOP7UF4JFzsVX+c2ZiJW4UxnluZcAzLqPxfgU3HIII1HQBHnmUIJ
zrQeLKW1Hl/iYH6C8evl/xs7qQLqJRYeTL3XZKtOX7P/bnOCtP8wj0s5W1Rd7GjD
QTCqmfgpb/AAADvkQ69Hg9zUo5AfiwLzIjwMNlhupkeoNgXVIYIJQaP9TRqsBdTM
D5y/FGyAccg00yyP4ec4TczeyXRik2sw2H6I+FmGMbD/2QVBANceQO2R2Xeq7z+3
Tv90zCAduRdK4LZVmnFimSmC8S+ZFSjeYvauSromwQQLXns04+vU95/7Pmu5hfXl
oYgtIu0ScNgmJON9XTzrel3bAoghMk3zUNGmjKuUL31Ca1c2OufYPFPgPA6BTDkC
ORQRsQcnnPIJJm1NKo09UF/cxCYHUF7EQi3vTFB5XFTcPHX3jp44V5ReDCCzeNKJ
VNAbfvTHB4UBzTM2hzym1VSfGrW47COStczUW+iWTye2BfOnw/Ot+V5tWU8ujbQs
yTZobphOxIoYFgW/VpFi
=QsVx
-----END PGP SIGNATURE-----

--Sig_//=R9TtE06Gaj.xfiGMvDxxp--
