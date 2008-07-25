From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the infiniband tree
Date: Fri, 25 Jul 2008 13:44:44 +1000
Message-ID: <20080725134444.9e67772c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Jul_2008_13_44_44_+1000_8t5s1Q/EqEhe2/v2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52150 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752193AbYGYDo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 23:44:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: linux-next@vger.kernel.org

--Signature=_Fri__25_Jul_2008_13_44_44_+1000_8t5s1Q/EqEhe2/v2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the infiniband tree got a conflict in
include/linux/mlx4/qp.h between commit
95d04f0735b4fc837bff9aedcc3f3efb20ddc3d1 ("IB/mlx4: Add support for
memory management extensions and local DMA L_Key") from Linus' tree and
commit 5fcbaab14db959eb6feecae57387cfff364f11b3 ("IB/mlx4: Add support
for memory management extensions and local DMA L_Key") from the
infiniband tree.

Please don't submit patches to Linus that are different to those you have
in linux-next.

I used the version in Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Jul_2008_13_44_44_+1000_8t5s1Q/EqEhe2/v2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiJTCwACgkQjjKRsyhoI8wA5gCgrQbTeQV4lRou+Ytyt8xWOxnm
h1MAn2vd3ceD2v+H4S5qi46LR4OeRyME
=uwW7
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Jul_2008_13_44_44_+1000_8t5s1Q/EqEhe2/v2--
