From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the rcu tree
Date: Thu, 22 Jan 2015 16:09:11 +1100
Message-ID: <20150122160911.07d2ed62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tc.QuaDu7qAnBtk=k85YWqE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60117 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750829AbbAVFJS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2015 00:09:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pranith Kumar <bobby.prani@gmail.com>, Mario Smarduch <m.smarduch@samsung.com>

--Sig_/tc.QuaDu7qAnBtk=k85YWqE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in
arch/arm64/kvm/Kconfig between commit 83fe27ea5311 ("rcu: Make SRCU
optional by using CONFIG_SRCU") from the rcu tree and commit
7276030a082c ("KVM: arm/arm64: Enable Dirty Page logging for ARMv8")
from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/kvm/Kconfig
index b334084d3675,3ce389b3c21c..000000000000
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@@ -26,7 -27,7 +27,8 @@@ config KV
  	select KVM_ARM_HOST
  	select KVM_ARM_VGIC
  	select KVM_ARM_TIMER
+ 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 +	select SRCU
  	---help---
  	  Support hosting virtualized guest machines.
 =20

--Sig_/tc.QuaDu7qAnBtk=k85YWqE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwIX7AAoJEMDTa8Ir7ZwVfrsP/1/saatvyS7RobB/daFKawLd
nSusvFhKY5T8ic+6kAfHXnkQ0dBxM2mxWQvsSBo6fdjDHaqVsXSOmv0bhBzaBDS1
3fRuzDiMA1J5CwYv/zUADnFtLzS2R34ifHlbskK4y3Ccx564tYQTPkSmNoJuINIB
MqiYHYCohJkqJIjYTvbEgJZ8mUS/vNCtBIOH98X4hwx0urfXGMRF0uI5YzfNjbwe
53bDpZ8+MeBjc36f8iY6TFHKeBVCqvQYaiBEhRVpOj8Tcq8iPF2u7y/JKIxcJxKF
WviYxxoqvUhuRNTusip5yvfH/ZcE64BpqKETAkbGHck16faA82KiEqYcrz03LHYz
HGkOR84jj6iR5LMKIQ2Asg7AZ5JK+mw4DCfFhQnc1+RBIuWXBrSsLnL09CvG0UX8
nUcm06J7VNin7gSdzHEA0iig6FH/E9Qt9kxAuf8YIEi4nbYb74KFg7YZUVlXRe7W
cn2tdph+5hyWXm9otaqHSBBDtYZBqXJw8P1u0N893zR5GmxwoHdybiYtYeXiJg7e
WBQoeYq/0t4hjXbz6MtkYIdl9T1nn5Zg2Rxt4zR8qyV4ajsNj/q7x7rFXVPQ47t4
iOJ2h7VyNoMKWcUoPD6I+vlhgSnQzU5S7ZpSMSQ2XCSAZHl6eG/OLoeLtdH4NDen
1xmbq4M7gBf0fGBz2ZH4
=xXF+
-----END PGP SIGNATURE-----

--Sig_/tc.QuaDu7qAnBtk=k85YWqE--
