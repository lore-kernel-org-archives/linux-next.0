From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Wed, 15 Aug 2018 14:27:32 +1000
Message-ID: <20180815142732.6c9108a0@canb.auug.org.au>
References: <20180808135445.1a85f9b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vogrmeqq0sIyF6..pcmK9xn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808135445.1a85f9b5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Tatashin <pasha.tatashin@oracle.com>, Wanpeng Li <wanpengli@tencent.com>
List-Id: linux-next.vger.kernel.org

--Sig_/vogrmeqq0sIyF6..pcmK9xn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Aug 2018 13:54:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Paolo pointed out a semantic conflict between the kvm tree and the tip
> tree in
>=20
>   arch/x86/kernel/kvm.c
>=20
> between commit:
>=20
>   368a540e0232 ("x86/kvmclock: Remove memblock dependency")
>=20
> from the tip tree and commit:
>=20
>   d63bae079b64 ("KVM: X86: Add kvm hypervisor init time platform setup ca=
llback")
>=20
> from the kvm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> I applied the following (as suggested) after the automatic merge:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 8 Aug 2018 13:48:34 +1000
> Subject: [PATCH] kvm: x86: fix semantic conflict in platform init
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index 0906b8731393..e2499bad3209 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -714,13 +714,13 @@ static void __init kvm_apic_init(void)
>  static void __init kvm_init_platform(void)
>  {
>  	x86_platform.apic_post_init =3D kvm_apic_init;
> +	kvmclock_init();
>  }
> =20
>  const __initconst struct hypervisor_x86 x86_hyper_kvm =3D {
>  	.name			=3D "KVM",
>  	.detect			=3D kvm_detect,
>  	.type			=3D X86_HYPER_KVM,
> -	.init.init_platform	=3D kvmclock_init,
>  	.init.guest_late_init	=3D kvm_guest_init,
>  	.init.x2apic_available	=3D kvm_para_available,
>  	.init.init_platform	=3D kvm_init_platform,
> --=20
> 2.18.0

This is now a conflict between Linus' tree and the kvm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/vogrmeqq0sIyF6..pcmK9xn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzq7QACgkQAVBC80lX
0Gw+XAgAo7NNTGWO2oKALvnbQ8tFT5Z10y4gi2XdjmCKX4G+6vsIb8qf9oioCz3L
DgTeBPyu5K1gZC1CBPGaipMNM76HvXFBuLxCXf26yfClbw0v0yyIjnxtvrCxNYCx
o0/OI2vv0nM8DviRP66dh4qxbH+U6nwECO92i1BYv/Y2gHDoNBErio0oMSJwsHRH
7mgBi/mH7mB3I6KdYZVtCeoUNMi4ZPxp/J7lVnAcxWwpFdom7nZckZgiXHO5qSrf
gfEKNWdjZ+7zgsd3+HJdxY2qvEO3RLdZIoj+ns/Eb4Shk0SvCSplIthXaotB7xyR
g1xl8CMoBVYaFocM8n2frm14Juqtbg==
=68dh
-----END PGP SIGNATURE-----

--Sig_/vogrmeqq0sIyF6..pcmK9xn--
