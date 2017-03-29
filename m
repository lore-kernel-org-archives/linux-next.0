From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-mips
 tree
Date: Wed, 29 Mar 2017 12:25:50 +0100
Message-ID: <20170329112550.GW31606@jhogan-linux.le.imgtec.org>
References: <20170329140832.5cbfb6ce@canb.auug.org.au>
 <20170329092112.GV31606@jhogan-linux.le.imgtec.org>
 <7115ff68-df06-10e0-6fff-e040a222a5e8@de.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A47bNRIYjYQgpFVi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7115ff68-df06-10e0-6fff-e040a222a5e8@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Zhang <zhangfan@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
List-Id: linux-next.vger.kernel.org

--A47bNRIYjYQgpFVi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 11:29:00AM +0200, Christian Borntraeger wrote:
> On 03/29/2017 11:21 AM, James Hogan wrote:
> > On Wed, Mar 29, 2017 at 02:08:32PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Today's linux-next merge of the kvms390 tree got a conflict in:
> >>
> >>   include/uapi/linux/kvm.h
> >>
> >> between commits:
> >>
> >>   a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
> >>   578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")
> >>
> >> from the kvm-mips tree and commit:
> >>
> >>   4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")
> >>
> >> from the kvms390 tree.
> >>
> >> It looks like someone needs to arbitrate on these KVM_CAP_ numbers ...
> >>
> >> I fixed it up (see below) and can carry the fix as necessary. This
> >> is now fixed as far as linux-next is concerned, but any non trivial
> >> conflicts should be mentioned to your upstream maintainer when your tr=
ee
> >> is submitted for merging.  You may also want to consider cooperating
> >> with the maintainer of the conflicting tree to minimise any particular=
ly
> >> complex conflicts.
> >>
> >> --=20
> >> Cheers,
> >> Stephen Rothwell
> >>
> >> diff --cc include/uapi/linux/kvm.h
> >> index 1e1a6c728a18,c9d522765f8f..000000000000
> >> --- a/include/uapi/linux/kvm.h
> >> +++ b/include/uapi/linux/kvm.h
> >> @@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt=20
> >>   #define KVM_CAP_PPC_MMU_RADIX 134
> >>   #define KVM_CAP_PPC_MMU_HASH_V3 135
> >>   #define KVM_CAP_IMMEDIATE_EXIT 136
> >>  -#define KVM_CAP_S390_GS 137
> >>  +#define KVM_CAP_MIPS_VZ 137
> >>  +#define KVM_CAP_MIPS_TE 138
> >>  +#define KVM_CAP_MIPS_64BIT 139
> >> ++#define KVM_CAP_S390_GS 140
> >>  =20
> >>   #ifdef KVM_CAP_IRQ_ROUTING
> >=20
> > Thanks Stephen,
> >=20
> > Cc'ing Paulo and Radim.
> >=20
> > This does seem a bit of a conflict magnet, and they're part of the user
> > ABI so when the values change upon merge, the intermediate versions
> > before and after require different userland builds.
> >=20
> > Should the numbering be decided in advance somehow (i.e. in response to
> > conflicts in linux-next)? I don't particularly want to change the
> > numbering again as others would need rebuilds again, but I only just
> > pushed the MIPS changes, so if I change the MIPS numbering to 138-140,
> > can we expect other branches to continue at 141 so I don't need to
> > change them again?
> >=20
> > Alternatively does it make sense to have different ranges reserved for
> > different architectures (like the get one reg numbers)?
>=20
> I can live with a changing GS capability number, so keep your number.

Okay, thanks

> In the end I think Radim/Paolo will do the assigment when merging.
> And no userspace should rely on this before this is at least in kvm/next
> Yes, this will be a bit of pain for internal QA, but this worked ok
> for the last 3 or 4 years on our side

Yeh, thats all it is, a bit of a pain, and probably just deserts for
having stuff out of tree for any length of time :)

Cheers
James

--A47bNRIYjYQgpFVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY25m3AAoJEGwLaZPeOHZ64DgQAKwKShNgv/B+byzGLl2Lm/f9
LEQelM2XeZsiU5hg8ZsTNbuzmZ4f5ggKvmNVG8YaY9T1icR49B8pgbwxaDKAot/q
3DFQIBIyrOaqXNdUro8R9pqXCr5C6Jc6xZvmnX67LcpWxc5N1w6ZwOnZmPBfLVbw
rLLzbL1qOyBcydbtUDlPUjAiz5iXqW4yM1CRmER+tvn6OiNcOyOYiv2rIwhXOlfv
Mh1a03csAZy7c8D7UGM+I/xNJkVCzMBE83HgVN/IXcT8c4+H6f9VngEkfZxRXIKO
WpLzm8g40l2aDfUDQZ+w7At/MKlNM+4z9R78U8v0Ev5dqu9wDgqHhIltpKREwg5U
5sssDsfK+IPghbG7jy5g7XukcxDQPejHf0+sH0B7vWvdaFehI9N5vK6HgBOs5/KZ
KyUKEa45S13DGYBEw4L62kHg3c12Cz6iPhYZD9YmcmHk2+78D3yXEKdysKQc6d0s
r2TgV1occUy3epB45+2zg86ZH5ZoVp6d7ryrqdJbgH5rZ1LPgb5sKkC2qkwxeUdI
VsM/iPWBFbo4uuWPNjx3JtNb5gAfZRIzAmM921XfuE3Z1UJWmcluJYY4yCy1xMC1
TNDn/uWDyjRxjSt23VgwgaDRyHK5K8RpysN2+onBOhSjc8JRHUsCqbCxiR+uAa3F
6N+LlTtMXdU7PUDB3h4J
=IOx/
-----END PGP SIGNATURE-----

--A47bNRIYjYQgpFVi--
