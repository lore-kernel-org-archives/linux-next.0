From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bpf-next tree with the s390
 tree
Date: Wed, 9 May 2018 14:21:54 +1000
Message-ID: <20180509142154.73ff5772@canb.auug.org.au>
References: <20180508102638.1e19b7f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZEI8h3kHyu3upTWz_00lbu/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508102638.1e19b7f2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Networking <netdev@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Miller <davem@davemloft.net>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ZEI8h3kHyu3upTWz_00lbu/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 May 2018 10:26:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>=20
>   arch/s390/net/bpf_jit.S
>=20
> between commit:
>=20
>   de5cb6eb514e ("s390: use expoline thunks in the BPF JIT")
>=20
> from the s390 tree and commit:
>=20
>   e1cf4befa297 ("bpf, s390x: remove ld_abs/ld_ind")
>=20
> from the bpf-next tree.
>=20
> I fixed it up (I just removed the file as the latter does) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the net-next and s390 trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZEI8h3kHyu3upTWz_00lbu/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlryd2IACgkQAVBC80lX
0GxO0Af/WFqKfLIxODePDRc7kJDTY44CC0jXkQCc5YiGInrk9zBSBMGrhLZUpSv9
Vfgt+EA/r98zfpCDFwg+PJ7q6WIzRK6CnP1p8O+twQjXI+CQlJFr+4s/hAJ7KfYQ
/RQauRNEJge4hfxqk8JEUjeO+yY9LNUzzHf4Pb9TJN7jt/kImBRHFPpZ+RU6uQf8
jeNk/1UtGujazY9Ys0K4ZWwbbET5cKBuMQcWJMWeyC6hT3u68JhM9b+EK0upv9A3
66OT0AwBkNqI2PWi2paA2hyxyPjljhZFIPiiW5ceMXx4m1Dg6AYFbWyHEZVgakY1
zhLJHZW5e1dgdcer733VqMS6ukJxfw==
=ZCsq
-----END PGP SIGNATURE-----

--Sig_/ZEI8h3kHyu3upTWz_00lbu/--
