From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Tue, 26 Aug 2008 14:45:42 +1000
Message-ID: <20080826144542.9dabd12e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__26_Aug_2008_14_45_42_+1000_dCIA68zOvfUmIr0Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37566 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751284AbYHZEpz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 00:45:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>

--Signature=_Tue__26_Aug_2008_14_45_42_+1000_dCIA68zOvfUmIr0Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
include/linux/kvm.h between commit
1327138e294ffda120a50c8f31d792addb196c79 ("KVM: fix userspace ABI
breakage") from Linus' tree (a version of which which also exists in the
kvm tree) and commit b8486fbae0046883437c91e9b475f1878888fe72 ("KVM:
kvmtrace: replace get_cycles with ktime_get v3") from the kvm tree.

I used the version from the kvm tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__26_Aug_2008_14_45_42_+1000_dCIA68zOvfUmIr0Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkizinYACgkQjjKRsyhoI8yTSQCglCk9IOP2aWSGn6Sf8YXirWKs
zQgAnjw8JKdrs2G0R/jhI2by5KwkFCXP
=a5Ka
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Aug_2008_14_45_42_+1000_dCIA68zOvfUmIr0Y--
