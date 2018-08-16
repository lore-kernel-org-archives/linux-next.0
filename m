From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64
 tree
Date: Thu, 16 Aug 2018 10:15:15 +1000
Message-ID: <20180816101515.24d0b49f@canb.auug.org.au>
References: <20180723144641.62b2b226@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_drNc1zMIutlJWBHBs63jx2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723144641.62b2b226@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/_drNc1zMIutlJWBHBs63jx2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Jul 2018 14:46:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>=20
>   arch/arm64/include/asm/cpucaps.h
>=20
> between commit:
>=20
>   314d53d29798 ("arm64: Handle mismatched cache type")
>=20
> from the arm64 tree and commit:
>=20
>   e48d53a91f6e ("arm64: KVM: Add support for Stage-2 control of memory ty=
pes and cacheability")
>=20
> from the kvm-arm tree.
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
> diff --cc arch/arm64/include/asm/cpucaps.h
> index be3bf3d08916,ed84d6536830..000000000000
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@@ -49,8 -49,8 +49,9 @@@
>   #define ARM64_HAS_CACHE_DIC			28
>   #define ARM64_HW_DBM				29
>   #define ARM64_SSBD				30
>  -#define ARM64_HAS_STAGE2_FWB			31
>  +#define ARM64_MISMATCHED_CACHE_TYPE		31
> ++#define ARM64_HAS_STAGE2_FWB			32
>  =20
> --#define ARM64_NCAPS				32
> ++#define ARM64_NCAPS				33
>  =20
>   #endif /* __ASM_CPUCAPS_H */

This is now a conflict between Linus' tree and the kvm-arm tree (and
presumably soon the kvm tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/_drNc1zMIutlJWBHBs63jx2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0whMACgkQAVBC80lX
0GywpAf/Xr+5TKHad/aBC+S0xL1NjioQRkIccxPgha+z3hOACtzgnsqCwCkLOHLw
vq6ZtVwhzvCRhy0ra6jmKEgb+8RnvlkKtRxTNU67mj8oKMfaSofWqz50o0qKlUlQ
QllYc9Fn/jkuSrKyW2ZiSdEYLuLyXcim1KdURSiw7hwzDfMdfjcx2kcG2UeYOXu6
EcghEchmbMqnNhh7DeK3cx0JE9uWXLpVuUuyb1ojvFgSx6XN7CYgkJkNVz8QI7/y
OFd2JXYyjq4KyQ5j6Q0KhQcWYrhRDHh1CUY/NJ62ur69fmjA/WnxZQh+lMlCRIdw
20NbnJZ6zHdcqx4RoMWWDW51X7nI/A==
=rVg/
-----END PGP SIGNATURE-----

--Sig_/_drNc1zMIutlJWBHBs63jx2--
