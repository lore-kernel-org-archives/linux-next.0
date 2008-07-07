From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree
Date: Mon, 7 Jul 2008 22:18:26 +1000
Message-ID: <20080707221826.5f0f6328.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_22_18_26_+1000_XYrcaPRDnHPgbyEL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46723 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753133AbYGGMSg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 08:18:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Cornelia Huck <cornelia.huck@de.ibm.com>, Greg KH <greg@kroah.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Swen Schillig <swen@vnet.ibm.com>

--Signature=_Mon__7_Jul_2008_22_18_26_+1000_XYrcaPRDnHPgbyEL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the scsi tree got a conflict in
drivers/s390/scsi/zfcp_aux.c and drivers/s390/scsi/zfcp_def.h between
commits 714cd445eab1ba6ec24afaa51665b9c355077bd9 ("s390:
bus_id -> dev_set_name() changes") and
42706c68125c56182cef0ea67e4096bd965e3d42 ("s390: more bus_id -> dev_name
conversions") from the driver-core tree and various commits from the scsi
tree.

I have fixed it up and can carry the fixups, though the dev_set_name and
dev_name conversions could now be applied to the s390 drivers (as I am
sure Greg has supplied patches to do).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_22_18_26_+1000_XYrcaPRDnHPgbyEL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyCZIACgkQjjKRsyhoI8xGmgCfdiQYoRMpjR2i6ZIqLFW3B93/
wcQAnAwO06uSGREOWPb6HbTbA4+Xarhj
=2Smv
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_22_18_26_+1000_XYrcaPRDnHPgbyEL--
