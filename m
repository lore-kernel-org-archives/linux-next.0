From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc build warnings
Date: Tue, 2 Sep 2008 18:53:34 +1000
Message-ID: <20080902185334.05f5a132.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Sep_2008_18_53_34_+1000_ro0rC6JABHS_peEV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38908 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751302AbYIBIxp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 04:53:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__2_Sep_2008_18_53_34_+1000_ro0rC6JABHS_peEV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc defconfig) got these warnings:

arch/sparc/mm/sun4c.c:1111: warning: "struct sbus_bus" declared inside para=
meter list
arch/sparc/mm/sun4c.c:1111: warning: its scope is only this definition or d=
eclaration, which is probably not what you want
arch/sparc/mm/sun4c.c:1123: warning: "struct sbus_bus" declared inside para=
meter list
arch/sparc/mm/sun4c.c:1133: warning: "struct sbus_bus" declared inside para=
meter list
arch/sparc/mm/sun4c.c:1140: warning: "struct sbus_bus" declared inside para=
meter list

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Sep_2008_18_53_34_+1000_ro0rC6JABHS_peEV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki8/w4ACgkQjjKRsyhoI8xgXwCfRoZ+0EfZDsRAfVtCwNem+rfT
rPMAnj7HKIVcfTFLEry21ICSEyCvW1Rd
=49Db
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Sep_2008_18_53_34_+1000_ro0rC6JABHS_peEV--
