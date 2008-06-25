From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Wed, 25 Jun 2008 15:47:32 +1000
Message-ID: <20080625154732.23abbb9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_15_47_32_+1000_JXn1fFllg3khcBYR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56530 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753226AbYFYFrp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 01:47:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_15_47_32_+1000_JXn1fFllg3khcBYR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a trivial contextual
conflict in kernel/sysctl.c between commit
31a72bce0bd6f3e0114009288bccbc96376eeeca ("rcu: make rcutorture more
vicious: reinstate boot-time testing") from the sched tree and commit
5f12804f188a8f2fe6d7fdb5c1b9a4340cfa0458 ("[PATCH] avoid multiplication
overflows and signedness issues for max_fds") from the vfs tree (which is
also in Linus' tree).

I just fixed it up and will carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_15_47_32_+1000_JXn1fFllg3khcBYR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh2/QACgkQTgG2atn1QN+g9gCfTNgtHySCmAY3uTeJXrCX9AQj
WmkAniYJAeJWYA3d7uQzcqcxISSGMFDc
=9jRt
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_15_47_32_+1000_JXn1fFllg3khcBYR--
