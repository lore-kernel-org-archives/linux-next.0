From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tests tree
Date: Wed, 25 Jun 2008 15:03:15 +1000
Message-ID: <20080625150315.ab536f8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_15_03_15_+1000_oNMLkO+7oBdMWzSJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37143 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752501AbYFYFDb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 01:03:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_15_03_15_+1000_oNMLkO+7oBdMWzSJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ananth,

Today's linux-next merge of the tests tree got a conflict in
lib/Kconfig.debug between commit 31a72bce0bd6f3e0114009288bccbc96376eeeca
("rcu: make rcutorture more vicious: reinstate boot-time testing") from
the sched tree and commit db00d6090740863199393461c8332812986ce4ad ("Move
rcutorture to tests/") from the tests tree.

Paul has added another CONFIG option related to the RCU tests. I fixed it
up, hopefully correctly.  Probably worth a look when I publish the tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_15_03_15_+1000_oNMLkO+7oBdMWzSJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh0ZMACgkQTgG2atn1QN/yNgCePUv4eNij2KGSA1AtE1igPH1S
+bwAnRgxmQMV8SVJ+MsA4KkIR3uU5rca
=d7Po
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_15_03_15_+1000_oNMLkO+7oBdMWzSJ--
