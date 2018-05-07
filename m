From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the bpf-next tree
Date: Mon, 7 May 2018 14:10:03 +1000
Message-ID: <20180507141003.79783848@canb.auug.org.au>
References: <20180507120909.1fee1683@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hw=IYb7DNUBa+Czzs7Ie82F"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507120909.1fee1683@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hw=IYb7DNUBa+Czzs7Ie82F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 May 2018 12:09:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/net/bpf_jit_comp.c
>=20
> between commit:
>=20
>   e782bdcf58c5 ("bpf, x64: remove ld_abs/ld_ind")
>=20
> from the bpf-next tree and commit:
>=20
>   5f26c50143f5 ("x86/bpf: Clean up non-standard comments, to make the cod=
e more readable")
>=20
> from the tip tree.
>=20
> I fixed it up (the former commit removed some code modified by the latter,
> so I just removed it) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Actually the tip tree commit has been added to the bpf-next tree as a
different commit, so dropping it from the tip tree will clean this up.

--=20
Cheers,
Stephen Rothwell

--Sig_/hw=IYb7DNUBa+Czzs7Ie82F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrv0ZsACgkQAVBC80lX
0GyOXAf+JxiquAEWPrSyRDaDB/e54JPJ24C3gctU0pqfcCp8XFe6D2V0s2NQdeu/
l/ydOpslZCDxYZqkT81FiWLQa9JLz5fDXxNJIYE4v9VPtR2NHuCGXUYqVes2rGeo
OeOCxCkG1TAPLz68f1S/YdleEORWGHkdfzdJl2+GcmSwJa/NrnpCNSGNTfb7bOLj
HxDR0gReH8GuKP7/0nXD5IlWJyj9+XNZKAnj2pAHjYTXbBwO8N4SxcQPgnvcaKE3
UvEPBqFwPLo0aHItLFJ9AtEkzoCrR1JU0U3zbNFx1O3eSV0EQ0JeeGT2zVfMcgJ0
mEhgMTn06a+NaJ05mShmJyY2PYAXvA==
=br3K
-----END PGP SIGNATURE-----

--Sig_/hw=IYb7DNUBa+Czzs7Ie82F--
