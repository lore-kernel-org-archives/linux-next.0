From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the netfilter-next tree with the
 netfilter tree
Date: Tue, 16 Apr 2019 11:26:24 +1000
Message-ID: <20190416112624.597e3fd2@canb.auug.org.au>
References: <20190415112216.451541f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HdqGYCYdJHK2MVfjDqHqtMG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415112216.451541f6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/HdqGYCYdJHK2MVfjDqHqtMG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Apr 2019 11:22:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the netfilter-next tree got a conflict in:
>=20
>   tools/testing/selftests/netfilter/Makefile
>=20
> between commit:
>=20
>   becf2319f320 ("selftests: netfilter: check icmp pkttoobig errors are se=
t as related")
>=20
> from the netfilter tree and commit:
>=20
>   26f7fe4a5db5 ("selftests: netfilter: add ebtables broute test case")
>=20
> from the netfilter-next tree.
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
> diff --cc tools/testing/selftests/netfilter/Makefile
> index a37cb1192c6a,80dae72a25c7..000000000000
> --- a/tools/testing/selftests/netfilter/Makefile
> +++ b/tools/testing/selftests/netfilter/Makefile
> @@@ -1,6 -1,6 +1,6 @@@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for netfilter selftests
>  =20
> - TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh conntrack_icmp_related.sh
>  -TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh bridge_brouter.sh
> ++TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh conntrack_icmp_related.s=
h bridge_brouter.sh
>  =20
>   include ../lib.mk

This is now a conflict between the net-next and netfilter trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/HdqGYCYdJHK2MVfjDqHqtMG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1L0AACgkQAVBC80lX
0GyGuAgAnb38YRpcBwZLivcb7dTLp6GRoZSwyn8sAVFzvoioQPSyh1UrP/3YWPGC
vD0tKMkm3DWJd0XjycbKY0isKp0NCzxWcrM2ikRu7ldTJ8u7FpNmCD3I7JL0SreU
Zx7lKhxjiLfZW9VenoTzL0PGTRWo/1cqjbrf/b6+nYGUmOHrqkIG2KejvwaVTfQ/
oaY7udoxS9KafGQAq7XvYc2v5NPwCkRsCVfwv/APEV7B/mFf54Pd84jh/98OfIie
jmNB+adc81ZV6l7m9xMdZUjoe2IJIsYg4BvqqQ0ZzDKP4YXM0ctHKa++nKYBCkY1
b61j6ZDxRkGNR7RDKqvhCw2YBFdk/g==
=9yAt
-----END PGP SIGNATURE-----

--Sig_/HdqGYCYdJHK2MVfjDqHqtMG--
