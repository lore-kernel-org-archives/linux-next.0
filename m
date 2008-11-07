From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Fri, 7 Nov 2008 15:33:21 +1100
Message-ID: <20081107153321.9168715f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_15_33_21_+1100_SXvyS8yPV/s=g4L4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51397 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751083AbYKGEdc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 23:33:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Patrick McHardy <kaber@trash.net>

--Signature=_Fri__7_Nov_2008_15_33_21_+1100_SXvyS8yPV/s=g4L4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/8021q/vlan_core.c between commit
9b22ea560957de1484e6b3e8538f7eef202e3596 ("net: fix packet socket
delivery in rx irq handler") from the net-current tree and commit
d2ad3ca88da02baeccd5216780f1fe983c6953ba ("net/: Kill now superfluous
->last_rx stores") from the net tree.

The former moved the code around that the latter was removing.  It seems
that the net-current change supercedes the net one (I may be wrong).  I
assume that this will be fixed in your tree soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Fri__7_Nov_2008_15_33_21_+1100_SXvyS8yPV/s=g4L4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTxREACgkQjjKRsyhoI8x8UQCeKlVNV2MxL8p3j8JatwMjC/qS
WYYAn2RKYm4Yng6968vNN3G1YKr+Mift
=Wc7f
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_15_33_21_+1100_SXvyS8yPV/s=g4L4--
