From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 7 May 2018 09:52:00 +1000
Message-ID: <20180507095200.1e925a8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/muvqRkCsOPSxMyVMbf6QHJS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/muvqRkCsOPSxMyVMbf6QHJS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  kernel/bpf/syscall.c

between commit:

  9ef09e35e521 ("bpf: fix possible spectre-v1 in find_and_alloc_map()")

from the net tree and commit:

  a26ca7c982cb ("bpf: btf: Add pretty print support to the basic arraymap")

from the net-next tree.

I fixed it up (I removed the conflicting addition of an include of
linux/btf.h in the latter commit as it had already been included
earlier in the file by a previous commit) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/muvqRkCsOPSxMyVMbf6QHJS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrvlSAACgkQAVBC80lX
0GyAtAf/X9undtDvXiux7WO0WcncrtBYGmO8wHZpPAshZfpLGwdAJ4R7U5wHrXcd
U4Nf2h0/qTD2icqN2udGyeunqRThCjsrfEKX02tZ+CbjVNcfzzXXkQds6o1yyOhn
iMXjDegkFOEey3/2a8BBHtFF/Bbwhh6kQADF5zFZIeZgS2nhG1eBd2OhKrLFf04c
5k8OCOdIGFMe9oyiiT/78WQufpcn97/QAdV3HvzW2MD1gp2TjriRLoEtMh8Fq636
1eXS3L2m1yIVCoTE7a8PrwPuAViJg2uuQgiz66mhT/i8T4+/Ua38ELv2ngcvsoUW
bWI0cYEShWGQqn/xYXOMA5N0xQjVuw==
=GtHY
-----END PGP SIGNATURE-----

--Sig_/muvqRkCsOPSxMyVMbf6QHJS--
