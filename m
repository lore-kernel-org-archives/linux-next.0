From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: infiniband tree build warning
Date: Tue, 17 Feb 2009 18:44:03 +1100
Message-ID: <20090217184403.7e1f18c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Feb_2009_18_44_03_+1100_51MgBSCKylmZ8TVP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48113 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbZBQHoS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 02:44:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: linux-next@vger.kernel.org, Steve Wise <swise@opengridcomputing.com>

--Signature=_Tue__17_Feb_2009_18_44_03_+1100_51MgBSCKylmZ8TVP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/infiniband/hw/cxgb3/iwch_qp.c: In function 'build_rdma_recv':
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift
drivers/infiniband/hw/cxgb3/iwch_qp.c:266: warning: suggest parentheses aro=
und + or - inside shift

Caused by commit 1557b4f052cb739a4ae1dd9641249b3e69fb6a0d ("RDMA/cxgb3:
Remove modulo math from build_rdma_recv()").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Feb_2009_18_44_03_+1100_51MgBSCKylmZ8TVP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmaasMACgkQjjKRsyhoI8zmnACfVKN0UnT/tmJ5V5APeddBl2sW
CsgAoIrs7n0F+8qLO8TeihQF89pr98b9
=5xSj
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Feb_2009_18_44_03_+1100_51MgBSCKylmZ8TVP--
