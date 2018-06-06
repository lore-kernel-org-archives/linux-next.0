From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the userns tree with the arm tree
Date: Wed, 6 Jun 2018 10:16:23 +1000
Message-ID: <20180606101623.1eacd4be@canb.auug.org.au>
References: <20180530183058.06a26dbe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n0R.KydN=e3r=CWLZ7sM920"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530183058.06a26dbe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@armlinux.org.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/n0R.KydN=e3r=CWLZ7sM920
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 May 2018 18:30:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the userns tree got a conflict in:
>=20
>   arch/arm/mm/fault.c
>=20
> between commit:
>=20
>   93a24d7e23e7 ("ARM: spectre-v2: harden user aborts in kernel space")
>=20
> from the arm tree and commit:
>=20
>   3eb0f5193b49 ("signal: Ensure every siginfo we send has all bits initia=
lized")
>=20
> from the userns tree.
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
> diff --cc arch/arm/mm/fault.c
> index 3b1ba003c4f9,32034543f49c..000000000000
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@@ -163,9 -163,8 +163,11 @@@ __do_user_fault(struct task_struct *tsk
>   {
>   	struct siginfo si;
>  =20
>  +	if (addr > TASK_SIZE)
>  +		harden_branch_predictor();
>  +
> + 	clear_siginfo(&si);
> +=20
>   #ifdef CONFIG_DEBUG_USER
>   	if (((user_debug & UDBG_SEGV) && (sig =3D=3D SIGSEGV)) ||
>   	    ((user_debug & UDBG_BUS)  && (sig =3D=3D SIGBUS))) {

This is now a conflict between the arm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/n0R.KydN=e3r=CWLZ7sM920
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXJ9cACgkQAVBC80lX
0GwX5Qf9E7Uih5osvX8kLykC/NtUQEVKKQVQgFOzuTRByWSXAQBlGs3hw9dq4K3m
OUUqsmMfzqluPewluBnMOBJVQwTBisY0ZUxZLVIXgXKpFMxfnboDtg6D/e3XDLEk
dMcJPq+GhC93jTbl5eGbQmhbq3I0hWU05zrzxU7FdyKTYi3qdPgxwJ2HNiTVQW3j
JKvtOQb+IoiQm1Y6tlOriOvnp0qfPBq4ofk4LVuxQdmnYmL4daLyrA/m9d4bfKg/
GFbhaLitmCSiUf+VOdEt3r4bsQwMoCynIN8+2v2y8LYtTcWKquJMacEh70fycpwp
zfHR//sygxu3KEr1HuExhQ3/T9ajVw==
=VVCT
-----END PGP SIGNATURE-----

--Sig_/n0R.KydN=e3r=CWLZ7sM920--
