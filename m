From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-mips
 tree
Date: Wed, 29 Mar 2017 10:21:12 +0100
Message-ID: <20170329092112.GV31606@jhogan-linux.le.imgtec.org>
References: <20170329140832.5cbfb6ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z118w8IfbP8nVdqq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:25688 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753226AbdC2JVP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2017 05:21:15 -0400
Content-Disposition: inline
In-Reply-To: <20170329140832.5cbfb6ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Zhang <zhangfan@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>

--z118w8IfbP8nVdqq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 02:08:32PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the kvms390 tree got a conflict in:
>=20
>   include/uapi/linux/kvm.h
>=20
> between commits:
>=20
>   a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
>   578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")
>=20
> from the kvm-mips tree and commit:
>=20
>   4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")
>=20
> from the kvms390 tree.
>=20
> It looks like someone needs to arbitrate on these KVM_CAP_ numbers ...
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc include/uapi/linux/kvm.h
> index 1e1a6c728a18,c9d522765f8f..000000000000
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt=20
>   #define KVM_CAP_PPC_MMU_RADIX 134
>   #define KVM_CAP_PPC_MMU_HASH_V3 135
>   #define KVM_CAP_IMMEDIATE_EXIT 136
>  -#define KVM_CAP_S390_GS 137
>  +#define KVM_CAP_MIPS_VZ 137
>  +#define KVM_CAP_MIPS_TE 138
>  +#define KVM_CAP_MIPS_64BIT 139
> ++#define KVM_CAP_S390_GS 140
>  =20
>   #ifdef KVM_CAP_IRQ_ROUTING

Thanks Stephen,

Cc'ing Paulo and Radim.

This does seem a bit of a conflict magnet, and they're part of the user
ABI so when the values change upon merge, the intermediate versions
before and after require different userland builds.

Should the numbering be decided in advance somehow (i.e. in response to
conflicts in linux-next)? I don't particularly want to change the
numbering again as others would need rebuilds again, but I only just
pushed the MIPS changes, so if I change the MIPS numbering to 138-140,
can we expect other branches to continue at 141 so I don't need to
change them again?

Alternatively does it make sense to have different ranges reserved for
different architectures (like the get one reg numbers)?

Cheers
James

--z118w8IfbP8nVdqq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY23yIAAoJEGwLaZPeOHZ6IiEP/1Dbg8ZdBFp70AEy3AQz+BbV
G/RirR9A2DB8jypRoyzGCww52y/Dh1Tncn0Dyww1JnO8CU/5H0rMYtGNpyFVxFu3
PUfBp7DVzM6ukRgBEYZIJUhGAtjg9layYqXR7cWOjkd3Bz1UUTKcbQoymLXyeJWm
yFvyOzwqJA0g104EW/NAVwjKOxwTCQHVGRSJAwnjcP3jHQ7uw+coy+KywwY8zSsR
YRiGV+GdkKiuCHbO1P2S1KM15RVbH9pFn+k/G1tQW9G5JNxli5Vh7RoyKM7AviW4
JVUXLkECh2sdSTradyKEHmzY6xl7sSajbjphL+VkAMbW5O5J2ynN52kx5ioysvWx
RjH5NZQtD+9InhXSnTWG1zHWobaFdq5ftQlpNJ7TRlFLjf2EJIk3Wrxe24TCE0kV
cQTBr8CBoKvAoj9OznjHPvYTICqx2+e/n7UmYGYYVRib2wayvwLrq59GO7EUfrJA
M0299GZJj3UzUFb883NFrm1PNjDNohUoxlTDIF/E1kdVIMIIvXvf73d/Dk+tfNhF
Ac05m96O4rHhAfjKXrb2zgoCzVtOTOdFOY/aS2tNYOyHk0gEfQMoDutJwjEP8n+z
nbXNZmYx6/hQJtymUNj8/gNxQ3149nPYz1IhF9J59SqQhHntbJXP33ApeiUqGlqX
Cy0Oky6EYouCq9M7dxpY
=wxGl
-----END PGP SIGNATURE-----

--z118w8IfbP8nVdqq--
