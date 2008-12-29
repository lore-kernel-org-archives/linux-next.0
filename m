From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kvm tree build failure
Date: Mon, 29 Dec 2008 16:17:50 +1100
Message-ID: <20081229161750.e2197bad.sfr@canb.auug.org.au>
References: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_16_17_50_+1100_2b.wOBWp6HYLIO9X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46674 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750780AbYL2FR4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 00:17:56 -0500
In-Reply-To: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Hollis Blanchard <hollisb@us.ibm.com>

--Signature=_Mon__29_Dec_2008_16_17_50_+1100_2b.wOBWp6HYLIO9X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

On Tue, 23 Dec 2008 00:25:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc44x_config) failed like this:
>=20
> arch/powerpc/kvm/44x.c: In function 'kvmppc_core_load_guest_debugstate':
> arch/powerpc/kvm/44x.c:58: warning: initialization from incompatible poin=
ter type
> arch/powerpc/kvm/44x.c:75: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:76: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:79: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:80: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:83: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:84: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:87: error: 'struct kvm_guest_debug' has no member =
named 'bp'
> arch/powerpc/kvm/44x.c:88: error: 'struct kvm_guest_debug' has no member =
named 'bp'
>=20
> Probably caused by commit 6968f31a2163f8fcf26ea8775c44d7e5be54d622 ("KVM:
> Remove old kvm_guest_debug structs") so I have reverted the kvm tree for
> today.

This error is still there, so I have dropped the kvm tree again today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_16_17_50_+1100_2b.wOBWp6HYLIO9X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYXX4ACgkQjjKRsyhoI8wNeACfaEp1ienILb/3oY/r56Vbe+yy
rTIAoLvQBcG6fWU0e1jRjt/eCzkXk8Vd
=1qxf
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_16_17_50_+1100_2b.wOBWp6HYLIO9X--
