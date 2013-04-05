From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the kvm tree
Date: Fri, 5 Apr 2013 15:09:01 +1100
Message-ID: <20130405150901.6dd07f52c3a0c6a70864708c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__5_Apr_2013_15_09_01_+1100_eIWWVS.pPHirFMJ5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:52437 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383Ab3DEEJM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Apr 2013 00:09:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>

--Signature=_Fri__5_Apr_2013_15_09_01_+1100_eIWWVS.pPHirFMJ5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in
include/linux/kvm_host.h between commit 060f0ce6ff97 ("KVM: Introduce
KVM_VIRTIO_CCW_NOTIFY_BUS") from the kvm tree and commit 4697e2cddfe6
("kvm: add PV MMIO EVENTFD") from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/kvm_host.h
index 0f4941a,35b74cd..0000000
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@@ -149,7 -149,7 +149,8 @@@ struct kvm_io_bus=20
  enum kvm_bus {
  	KVM_MMIO_BUS,
  	KVM_PIO_BUS,
 +	KVM_VIRTIO_CCW_NOTIFY_BUS,
+ 	KVM_PV_MMIO_BUS,
  	KVM_NR_BUSES
  };
 =20

--Signature=_Fri__5_Apr_2013_15_09_01_+1100_eIWWVS.pPHirFMJ5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRXk5dAAoJEECxmPOUX5FExTcQAJLISNrnqfd2luY88TS5LQoz
IVX2AVMNs0q+446iI8Fx2nmgqi3diugRGBP6/qDhfajXNeun54DbVEMyax8zD9qb
L0SX+JOe7BfjJN+1zM4L/zZuoHiacwRXQ2H5dTDw5EXE5nTsaTU7f7KoV8LMyZaz
SBCYG6iKJvI466lWIyUpOsxHKsUPOeocDWAs/TDqiJ1RHqfATkMm4qAMZEo0NJVL
AybFhEPWRHycisuOOS++GwiL4Pt7LBdzba1GvvSBtv0DpU60fUs+FJZo4SEZCI/P
bv8NcsMhNe0cMhZH79/uI53gP73tCHIxVQHpT+YYVIXfkRzjO182a5HDMTJQnxL9
TPvxzhC4bpFnknMfTm0jv8YrKEp67UXRwLWBsrKwQDIS6PG2NRTw5DoLk6GOkaXF
qx1jghJHGSpecq67nquhu+eS84SB4juncRW9u9Sa2oDDmTyfHa8gKpu7aKUGV/fg
kHEAs3UgOmjoJmBQA4eFA2k6+tVaUJQahZG29NJhwntxXr61VOn5syaeGOLS3Knc
LcA2eLMV5fiYbhYgw0t+5LSDt2yZ10keX2IJyOAUcKH6eChJEsNZwqo1pjUHsamA
tdlrjPxSE5HC34NAftRO62KV33zRfA63SJA3Ie1T84q+SudNV5ZIMMuWvTkIHhJZ
yFrVHtm+OsVTiugID1BA
=YkNW
-----END PGP SIGNATURE-----

--Signature=_Fri__5_Apr_2013_15_09_01_+1100_eIWWVS.pPHirFMJ5--
