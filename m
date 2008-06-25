From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Wed, 25 Jun 2008 12:57:00 +1000
Message-ID: <20080625125700.a71a7243.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_12_57_00_+1000_thuQeVpB=gFmIT_f"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50863 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751942AbYFYC5N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 22:57:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_12_57_00_+1000_thuQeVpB=gFmIT_f
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a trivial conflict in
arch/x86/kernel/setup_64.c between commit
8d76d30130dacf140f82d0441f2df74c27e8f10b ("x86: check command line when
CONFIG_X86_MPPARSE is not set, v2") from the x86 tree and commit
e3f2baebf4209b5927e23fa65d5977d31db936b3 ("PCI/x86: early dump pci conf
space v2") from the pci tree.

Just two overlapping additions.  I took both. I put the pci change
second, if that matters.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_12_57_00_+1000_thuQeVpB=gFmIT_f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhs/wACgkQTgG2atn1QN/ZZwCff97YxnMq6W4DftveBh7uEMsE
yN0AniqgkAxQlP54uZ1wXruwRhd7zFQo
=S1ox
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_12_57_00_+1000_thuQeVpB=gFmIT_f--
