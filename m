From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-arm
 tree
Date: Thu, 2 Aug 2018 11:19:16 +1000
Message-ID: <20180802111916.7435c0ac@canb.auug.org.au>
References: <20180731142339.19b52ce0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sowLDvZxFpDyyG4yo/_Zpig"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731142339.19b52ce0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Dongjiu Geng <gengdongjiu@huawei.com>, Janosch Frank <frankja@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sowLDvZxFpDyyG4yo/_Zpig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 31 Jul 2018 14:23:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kvms390 tree got a conflict in:
>=20
>   include/uapi/linux/kvm.h
>=20
> between commit:
>=20
>   be26b3a73413 ("arm64: KVM: export the capability to set guest SError sy=
ndrome")
>=20
> from the kvm-arm tree and commit:
>=20
>   a449938297e5 ("KVM: s390: Add huge page enablement control")
>=20
> from the kvms390 tree.
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
> index a7d9bc4e4068,b955b986b341..000000000000
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@@ -949,7 -949,7 +949,8 @@@ struct kvm_ppc_resize_hpt=20
>   #define KVM_CAP_GET_MSR_FEATURES 153
>   #define KVM_CAP_HYPERV_EVENTFD 154
>   #define KVM_CAP_HYPERV_TLBFLUSH 155
>  -#define KVM_CAP_S390_HPAGE_1M 156
>  +#define KVM_CAP_ARM_INJECT_SERROR_ESR 156
> ++#define KVM_CAP_S390_HPAGE_1M 157
>  =20
>   #ifdef KVM_CAP_IRQ_ROUTING
>  =20

This is now a conflict between the s390 and kvm-arm trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/sowLDvZxFpDyyG4yo/_Zpig
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltiXBQACgkQAVBC80lX
0Gz4Ggf6AvUpu7vkp1HitNDKgycCHY7tEkbPKS76UsQl5wOW23tuKFLmHNMCskyL
/PkalVu/UGgiF5vFG0gtj5zT24xRIFmU+mVYBbPOFSKomJ4mA2HZNELwpJjASPoL
lNq7jG2Vbm3YldX3MwefMwG3FFN1dfihy/WE1KCPenugSPt/9pM8PAJT4rActifT
I1illgcSBxP8hVQDOVvfjMfn8Rzl7AqRayeyI+izxgxRJ85GcU2p/NF9VawIiR3Q
e7DENwy7isbzW8zTlloibMhmohoXtCP7Ud2SOD1ebRflXZ/1YA/nI0XGNvz10/FE
ZAOn2gbTlvIWeU5v5BWDki1SoncmNw==
=Rc+G
-----END PGP SIGNATURE-----

--Sig_/sowLDvZxFpDyyG4yo/_Zpig--
