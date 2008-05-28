From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci merge conflict
Date: Wed, 28 May 2008 12:27:58 +1000
Message-ID: <20080528122758.70c4bec9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_May_2008_12_27_58_+1000_hXLKjXsItOZGCT18"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51559 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752678AbYE1C2I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 22:28:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

--Signature=_Wed__28_May_2008_12_27_58_+1000_hXLKjXsItOZGCT18
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next mege of the pci tree got conflicts in
drivers/pci/hotplug/pciehp_hpc.c between commits
5808639bfa98d69f77a481d759570d85f164fea0 ("pciehp: fix slow probing") and 6=
592e02ae4bd7b277230aa0c5821588a13b9d8e3 ("pciehp: poll cmd completion if
hotplug interrupt is disabled") from the pci-current tree and commit
2b26196717939221ccc06073780b73d0f4ee3203 ("pciehp: fix waiting
command").  I fixed it up as best I can, but please have a look.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_May_2008_12_27_58_+1000_hXLKjXsItOZGCT18
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPMM1TgG2atn1QN8RAlGzAJ9ZCk/erJKfvkKd0W6FcC4Peiu2DwCcCLB8
xjp44/yI6S2tT0GPV1Rqetc=
=klr3
-----END PGP SIGNATURE-----

--Signature=_Wed__28_May_2008_12_27_58_+1000_hXLKjXsItOZGCT18--
