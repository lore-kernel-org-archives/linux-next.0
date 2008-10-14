From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree
Date: Tue, 14 Oct 2008 12:02:29 +1100
Message-ID: <20081014120229.2c20515a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_12_02_29_+1100_b9Ao5KxsqI_rBYI6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755468AbYJNC1D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 22:27:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Victor Gallardo <vgallardo@amcc.com>, "David S. Miller" <davem@davemloft.net>, Josh Boyer <jwboyer@linux.vnet.ibm.com>

--Signature=_Tue__14_Oct_2008_12_02_29_+1100_b9Ao5KxsqI_rBYI6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul, Ben,

Today's linux-next merge of the powerpc tree got a conflict in
drivers/net/ibm_newemac/core.h between commit
6fbc779c03591ee536fef9efb7d7e20f281d0b5c ("ibm_newemac: Fix EMAC soft
reset on 460EX/GT") from Linus' tree and commit
b68d185ab12b1fc8000432c5d5ab5404d4788b4c ("ibm_newemac: Allow the "no
flow control" EMAC feature to work") from the powerpc tree.

Just overlapping additions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_12_02_29_+1100_b9Ao5KxsqI_rBYI6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjz76UACgkQjjKRsyhoI8zOngCfXwiQQCKH46y2xpWuiDwyW/rV
n9sAn0IQnfAOnpcnbSlw761j8Bjr98Vm
=Bx/q
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_12_02_29_+1100_b9Ao5KxsqI_rBYI6--
