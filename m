From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the userns tree with the tip tree
Date: Mon, 15 Oct 2018 15:34:37 +1100
Message-ID: <20181015153437.70179aaf@canb.auug.org.au>
References: <20181015151159.5ce4faa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//uPbGZ1o=3dWRqpA95cLJTb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015151159.5ce4faa5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_//uPbGZ1o=3dWRqpA95cLJTb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Oct 2018 15:11:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the userns tree got a conflict in:
>=20
>   arch/x86/mm/fault.c
>=20
> between commit:
>=20
>   164477c2331b ("x86/mm: Clarify hardware vs. software "error_code"")
> (and others from that series)
>=20
> from the tip tree and commits:
>=20
>   768fd9c69bb5 ("signal/x86: Remove pkey parameter from bad_area_nosemaph=
ore")
>   25c102d803ea ("signal/x86: Remove pkey parameter from mm_fault_error")
>=20
> from the userns tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/x86/mm/fault.c
> index c2e3e5127ebc,8d77700a7883..000000000000
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
>  +/* Handle faults in the user portion of the address space */
>  +static inline
>  +void do_user_addr_fault(struct pt_regs *regs,
>  +			unsigned long hw_error_code,
>  +			unsigned long address)
>  +{
>  +	unsigned long sw_error_code;
>  +	struct vm_area_struct *vma;
>  +	struct task_struct *tsk;
>  +	struct mm_struct *mm;
>  +	vm_fault_t fault, major =3D 0;
>  +	unsigned int flags =3D FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>  +	u32 pkey;

I missed removing the above line.

--=20
Cheers,
Stephen Rothwell

--Sig_//uPbGZ1o=3dWRqpA95cLJTb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvEGN0ACgkQAVBC80lX
0GxieQf/aeK0x25reZH22JcQ6z0FnNQzrBZP+N5NAuDPmnfbZXYmD5znKX+ssN9Q
beel1mQ1k8Ks4mM7VXSUdgQeP8z1VFxoEgRm+oSr3Z1igmmMDoXpdOF0AAkzaCTP
Lxnb9mCC1tuKpeVyiNlgNcXwJgwtQhL8w1Wdkrd6dfqMFohQ53/F7nD2LXPwPCLb
e1jCj8YNeFoSM+0fA52lU/7XZBz+1Try7/3+br46aahhxZPiFeRxrYfZbdFWdJxH
tmzpDe4lxB9HdxXF/hNaHZoD9jEJwSXV2RQqdtIqT419cOP02YSF6WNCSjw3j2S9
uDQClDB5G/BF5b7V7LXsqBIRCCHgaQ==
=NDmc
-----END PGP SIGNATURE-----

--Sig_//uPbGZ1o=3dWRqpA95cLJTb--
