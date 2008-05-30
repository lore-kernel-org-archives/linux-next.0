From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr/driver-core merge conflict
Date: Fri, 30 May 2008 13:20:09 +1000
Message-ID: <20080530132009.398754a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_May_2008_13_20_09_+1000_tgOgf9KY_DuYV3LR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43029 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751869AbYE3DUZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 23:20:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Cornelia Huck <cornelia.huck@de.ibm.com>

--Signature=_Fri__30_May_2008_13_20_09_+1000_tgOgf9KY_DuYV3LR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Rusty,

Today's linux-next merge of the rr tree got a trivial context conflict in
drivers/s390/kvm/kvm_virtio.c between "s390: Use s390_root_dev_* in
kvm_virtio" from the driver-core tree and "virtio:common-index-counters"
from the rr tree.  I did the obvious fixup and will carry it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_May_2008_13_20_09_+1000_tgOgf9KY_DuYV3LR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIP3JuTgG2atn1QN8RAkbIAJ93C1AT70e5If+QbguVYgDnKHoGtgCeIJZ7
Sr24qBnOZ+XhMuch/wCkJhw=
=3DMz
-----END PGP SIGNATURE-----

--Signature=_Fri__30_May_2008_13_20_09_+1000_tgOgf9KY_DuYV3LR--
