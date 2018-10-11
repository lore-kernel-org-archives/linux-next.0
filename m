From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm-arm
 tree
Date: Thu, 11 Oct 2018 13:06:23 +1100
Message-ID: <20181011130623.59a160f5@canb.auug.org.au>
References: <20181010132224.3bee4dfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3w0=xgN3F_mBFfyBq9X7KLx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010132224.3bee4dfd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3w0=xgN3F_mBFfyBq9X7KLx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Oct 2018 13:22:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kvm-ppc tree got a conflict in:
>=20
>   include/uapi/linux/kvm.h
>=20
> between commit:
>=20
>   233a7cb23531 ("kvm: arm64: Allow tuning the physical address size for V=
M")
>=20
> from the kvm-arm tree and commit:
>=20
>   aa069a996951 ("KVM: PPC: Book3S HV: Add a VM capability to enable neste=
d virtualization")
>=20
> from the kvm-ppc tree.
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
> index 95aa73ca65dc,7f2ff3a76995..000000000000
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@@ -962,7 -954,7 +963,8 @@@ struct kvm_ppc_resize_hpt=20
>   #define KVM_CAP_NESTED_STATE 157
>   #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
>   #define KVM_CAP_MSR_PLATFORM_INFO 159
>  -#define KVM_CAP_PPC_NESTED_HV 160
>  +#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a V=
M */
> ++#define KVM_CAP_PPC_NESTED_HV 161
>  =20
>   #ifdef KVM_CAP_IRQ_ROUTING
>  =20

This is now a conflict between the kvm tree and the kvm-arm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3w0=xgN3F_mBFfyBq9X7KLx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu+sB8ACgkQAVBC80lX
0Gz9lQf+L1a1NBK867v+J5+fc4A8yXfuJtMBrgIvN/YXo4vrqpTmg6PbzYa3BbDB
t86aVjGKXZSI0PhO73+OozBcOhyHVpu4Q0GUsFgEM291wjwJzL/TyT8VQP3eyzzh
A7BKGSY0MJHVNftQLkatr02mlQytVwiQn+AHJxdODZ+bCNbAy92dyFan9DxyAaXX
gGgQRONJ5i023o27UCqjzDSmnoTZ5jMENfVobJoFSFVtwNuo1kx2nuGzU8E3cVpV
iq3cz7EUasMsuZuiNdSOXRCaPAA8tRylyipLiMF4JeXNhX46UmcIpkDYl8QTuQPa
qXH6KmZ6t+seTVm/aX9nq6W1xZDVUg==
=yYQX
-----END PGP SIGNATURE-----

--Sig_/3w0=xgN3F_mBFfyBq9X7KLx--
