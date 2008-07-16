From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 16 Jul 2008 17:00:39 +1000
Message-ID: <20080716170039.3cb2eab0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_00_39_+1000_rC+5PEen9wUb/mvf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49537 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753012AbYGPHAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:00:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Patrick McHardy <kaber@trash.net>, Franck Bui-Huu <fbuihuu@gmail.com>

--Signature=_Wed__16_Jul_2008_17_00_39_+1000_rC+5PEen9wUb/mvf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/8021q/vlan.c between commit 82524746c27fa418c250a56dd7606b9d3fc79826
("rcu: split list.h and move rcu-protected lists into rculist.h") from
Linus' tree and commit 61362766d769c934a9d12d5516323c544c161908 ("vlan:
remove unnecessary include statements") from the net tree.

I just added in the new rculist.h include to the net tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_00_39_+1000_rC+5PEen9wUb/mvf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9nJcACgkQjjKRsyhoI8wDLACgu1XtDxzADB7tdScJrBWw/XnW
85QAn3pQuHyyKw9iFh3EhzXDqMEDkt/B
=JkX7
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_00_39_+1000_rC+5PEen9wUb/mvf--
