From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 1 Jun 2015 20:48:09 +1000
Message-ID: <20150601204809.5cf1ac2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gMeO4ltR6TJ3dKRGU41MXI3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34632 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751003AbbFAKsR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 06:48:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Sig_/gMeO4ltR6TJ3dKRGU41MXI3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/target/target_core_configfs.c between commit d588cf8f618d
("target: Fix se_tpg_tfo->tf_subsys regression + remove tf_subsystem")
from Linus' tree and commits c6eec4d58f5d ("target: remove tf_subsystem
pointers") and 93af633991fd ("target: don't copy fabric ops") and
f0eb815f8a53 ("target: put struct target_fabric_configfs on a diet")
from the target-updates tree.

I fixed it up (the first of the target-updates tree patches is a subset
of the patch in Linus' tree - see the result below) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/target/target_core_configfs.c
index e7b0430a0575,4ada522d7bc3..000000000000
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@@ -1034,10 -1587,10 +1587,10 @@@ static ssize_t target_core_dev_pr_store
  	u64 sa_res_key =3D 0;
  	u32 mapped_lun =3D 0, target_lun =3D 0;
  	int ret =3D -1, res_holder =3D 0, all_tg_pt =3D 0, arg, token;
- 	u16 port_rpti =3D 0, tpgt =3D 0;
- 	u8 type =3D 0, scope;
+ 	u16 tpgt =3D 0;
+ 	u8 type =3D 0;
 =20
 -	if (dev->transport->transport_type =3D=3D TRANSPORT_PLUGIN_PHBA_PDEV)
 +	if (dev->transport->transport_flags & TRANSPORT_FLAG_PASSTHROUGH)
  		return 0;
  	if (dev->dev_reservation_flags & DRF_SPC2_RESERVATIONS)
  		return 0;

--Sig_/gMeO4ltR6TJ3dKRGU41MXI3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbDhvAAoJEMDTa8Ir7ZwVNwIP/3dFyA6EpM8W9kAlmP+qa/Up
hXIznN6eDQStCkCLmqInxfpev2RrEZoAJ18D0BaJezyBbChBnWXLzcHqZZFDrDZs
YPxHpMe2BQMsTih9I1y/Xerr2rPorT75IEsQ2RpFIT09c/Hlz1F/6Tjk9oGiUW9B
lIs1+PE8h5fCVGGUK51lxj7cXI628c/qNjkQZT6x2rXzENrzd7BKcflK2dnCfVQy
DA5FE5LvdHUHmE3xn//bfJJNxIXkSv05EeZ63F92bBqq0VRssLjpV8i3P7XLv8Fl
P8QMxhn/27IGGExTE7is0HfT6/1AUy5s++NHlYBBnRXJofHmzhMAaEdRsdxjCgI5
ZqOlycV+RHUPLsXQ90lnpRfK7fs8BwCtCM2/NpVYYxnOJALIycOtMLG8DAguRvRM
D+fIVUq/MUmPQ+hhdu7xpMyXCC47ATUagYIl3RgYUA8ezkQ06GWPEL3Tti8qKrUR
PokG+VE0PkvTw74SpAZCUNApihRQYRnuZn09cO3jJI1tOa43Re0oHWZ5N0cFZt/e
onP32dB450tOd/XDkRfrvODkFYpaYVeJNrENQqs+97HJrnJT2b5CHE5IDxTwHPFP
jwVJOUqCV6vvvnwe7m0rbl9z0kzhQrdMU6EizEFGwY42XTU18bCrxB3pUkSGRRaf
u3BO9TFcZGd1/PflGJKc
=AwhZ
-----END PGP SIGNATURE-----

--Sig_/gMeO4ltR6TJ3dKRGU41MXI3--
