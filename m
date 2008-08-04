From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Mon, 4 Aug 2008 13:13:09 +1000
Message-ID: <20080804131309.165722e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_Aug_2008_13_13_09_+1000_Fb7d5UJ1/uL0dk4Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58963 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753892AbYHDDNT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Aug 2008 23:13:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__4_Aug_2008_13_13_09_+1000_Fb7d5UJ1/uL0dk4Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
include/linux/kvm.h between commit
ed8486243379ef3e6c61363df915882945c0eaec ("KVM: Advertise synchronized
mmu support to userspace") from Linus' tree (which also extsts in the kvm
tree) and commit a6a19661fc371c188b9cdeceba402b93de2b957f ("KVM: pci
device assignment") from the kvm tree.

Just a contextual overlap.  I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_Aug_2008_13_13_09_+1000_Fb7d5UJ1/uL0dk4Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiWc8UACgkQjjKRsyhoI8wdLQCeL+vuvdhyB1vQcvygd5/eHJXI
peUAn2GBXaIXxYgslnXUp7i/LVvyeO+2
=sTfd
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Aug_2008_13_13_09_+1000_Fb7d5UJ1/uL0dk4Q--
