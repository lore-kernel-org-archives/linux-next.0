From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kvm tree build failure
Date: Fri, 2 Jan 2009 11:53:54 +1100
Message-ID: <20090102115354.46fc59e0.sfr@canb.auug.org.au>
References: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>
	<20081229161750.e2197bad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__2_Jan_2009_11_53_54_+1100_l8Tyoe/I5sJR4s_N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43239 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911AbZABAyC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jan 2009 19:54:02 -0500
In-Reply-To: <20081229161750.e2197bad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Hollis Blanchard <hollisb@us.ibm.com>

--Signature=_Fri__2_Jan_2009_11_53_54_+1100_l8Tyoe/I5sJR4s_N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

On Mon, 29 Dec 2008 16:17:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 23 Dec 2008 00:25:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next build (powerpc ppc44x_config) failed like this:
> >=20
> > arch/powerpc/kvm/44x.c: In function 'kvmppc_core_load_guest_debugstate':
> > arch/powerpc/kvm/44x.c:58: warning: initialization from incompatible po=
inter type
> > arch/powerpc/kvm/44x.c:75: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:76: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:79: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:80: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:83: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:84: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:87: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> > arch/powerpc/kvm/44x.c:88: error: 'struct kvm_guest_debug' has no membe=
r named 'bp'
> >=20
> > Probably caused by commit 6968f31a2163f8fcf26ea8775c44d7e5be54d622 ("KV=
M:
> > Remove old kvm_guest_debug structs") so I have reverted the kvm tree for
> > today.
>=20
> This error is still there, so I have dropped the kvm tree again today.

And again.  Can you please find some fix for this so that the kvm tree
can get some integration testing ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__2_Jan_2009_11_53_54_+1100_l8Tyoe/I5sJR4s_N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkldZaIACgkQjjKRsyhoI8zG3gCgkoLeqtswvoYmc3jIex1fvFnN
6VIAoJhDzguXO/gmxsd6u9z9E2bn7s73
=0a33
-----END PGP SIGNATURE-----

--Signature=_Fri__2_Jan_2009_11_53_54_+1100_l8Tyoe/I5sJR4s_N--
