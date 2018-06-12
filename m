From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Tue, 12 Jun 2018 12:26:40 +1000
Message-ID: <20180612122640.534118ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VyhoGSrerE.YtOd2YUrq1u0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VyhoGSrerE.YtOd2YUrq1u0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (powerpc allyesconfig)
failed like this:

ld: net/bpfilter/bpfilter_umh.o: compiled for a little endian system and ta=
rget is big endian
ld: failed to merge target specific data of file net/bpfilter/bpfilter_umh.o

This has come to light since I started using a native compiler (i.e. one
that can build executables, not just the kernel) for my PowerPC builds
on a powerpcle host.

I have switched back to my limited compiler.

--=20
Cheers,
Stephen Rothwell

--Sig_/VyhoGSrerE.YtOd2YUrq1u0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsfL2AACgkQAVBC80lX
0GzhhQf/dCEFz2naJA3Uwspxm0fioygm5jpmhvUMa/Mo1QmtdG06VRt9nbQQ/bdw
lLb/2l/rDp2cl9wXPjWOZnY7nJPvsR/sIw2D1Gi+ZaeWn29nojZ6KmE+bqeJHMIZ
+ecFo4+aa9MHJjy4X7Inig3q4zwfSFD2AuFHX7aoabcBqbYb73xhOYP72CQH5qiV
K8mz97TZbKTbaVyoeb7N6tbnhyZxZGpKrbuG/uRoE7JJJZDlxMG1FuJZoio3LBJl
UQVpWrtmOqy4ZAj2o9zH7yfcUiC7NUsKJXHPns1GqChNlZr67Hh6Y24oqEQA3fT0
2m1c1Isw4u+jQz3EpvOnjiefN5pVVg==
=f5hV
-----END PGP SIGNATURE-----

--Sig_/VyhoGSrerE.YtOd2YUrq1u0--
