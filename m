From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Tue, 23 Dec 2008 00:25:14 +1100
Message-ID: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Dec_2008_00_25_14_+1100_KEhqiEWfdeX6cT7N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53285 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754181AbYLVNZq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 08:25:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Hollis Blanchard <hollisb@us.ibm.com>

--Signature=_Tue__23_Dec_2008_00_25_14_+1100_KEhqiEWfdeX6cT7N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (powerpc ppc44x_config) failed like this:

arch/powerpc/kvm/44x.c: In function 'kvmppc_core_load_guest_debugstate':
arch/powerpc/kvm/44x.c:58: warning: initialization from incompatible pointe=
r type
arch/powerpc/kvm/44x.c:75: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:76: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:79: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:80: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:83: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:84: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:87: error: 'struct kvm_guest_debug' has no member na=
med 'bp'
arch/powerpc/kvm/44x.c:88: error: 'struct kvm_guest_debug' has no member na=
med 'bp'

Probably caused by commit 6968f31a2163f8fcf26ea8775c44d7e5be54d622 ("KVM:
Remove old kvm_guest_debug structs") so I have reverted the kvm tree for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Dec_2008_00_25_14_+1100_KEhqiEWfdeX6cT7N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklPlTsACgkQjjKRsyhoI8zVAACdFvIa33HbGv1gtC3pimFSwQ77
nhkAoIY7HlGxC5ZCLgNyDAzfNV/ySYUb
=JMoZ
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Dec_2008_00_25_14_+1100_KEhqiEWfdeX6cT7N--
