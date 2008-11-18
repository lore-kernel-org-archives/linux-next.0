From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 18 Nov 2008 11:51:46 +1100
Message-ID: <20081118115146.a3ddef68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__18_Nov_2008_11_51_46_+1100_04LpqooUOcCpiet7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33611 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620AbYKRAwD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Nov 2008 19:52:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>

--Signature=_Tue__18_Nov_2008_11_51_46_+1100_04LpqooUOcCpiet7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/isdn/i4l/isdn_net.c between commit
584c650b4e6fa16f9ab45d382f86ad6d9c625227 ("isdn: remove extra byteswap in
isdn_net_ciscohdlck_slarp_send_reply") from the net-current tree and
commit 00bcd522ea0a62f5e2a9c6ad4924cbbd8d05b026 ("isdn: use %pI4, remove
get_{u8/u16/u32} and put_{u8/u16/u32} inlines") from the net tree.

I fixed it up by using the version from the net tree.  I assume that this
will be fixed in that tree shortly.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__18_Nov_2008_11_51_46_+1100_04LpqooUOcCpiet7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkiEaIACgkQjjKRsyhoI8wzqgCfX0kVFLvAJyVwKML6iJ1d9es5
3vQAoLoZ0ltAIb0pmyt1juJkZEl70e4L
=k4Jj
-----END PGP SIGNATURE-----

--Signature=_Tue__18_Nov_2008_11_51_46_+1100_04LpqooUOcCpiet7--
