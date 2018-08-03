From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 3 Aug 2018 12:14:30 +1000
Message-ID: <20180803121430.25899c83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Fsb4bth4XmH6FhThHKnKa+."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Fsb4bth4XmH6FhThHKnKa+.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (perf) failed
like this:

In file included from btf.c:10:0:
btf.h:25:24: error: redundant redeclaration of 'btf__type_by_id' [-Werror=
=3Dredundant-decls]
 const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_i=
d);
                        ^~~~~~~~~~~~~~~
btf.h:20:24: note: previous declaration of 'btf__type_by_id' was here
 const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 id);
                        ^~~~~~~~~~~~~~~
btf.c:405:24: error: redefinition of 'btf__type_by_id'
 const struct btf_type *btf__type_by_id(const struct btf *btf,
                        ^~~~~~~~~~~~~~~
btf.c:197:24: note: previous definition of 'btf__type_by_id' was here
 const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_i=
d)
                        ^~~~~~~~~~~~~~~
btf.c:40:20: error: 'btf_name_by_offset' defined but not used [-Werror=3Dun=
used-function]
 static const char *btf_name_by_offset(const struct btf *btf, __u32 offset)
                    ^~~~~~~~~~~~~~~~~~
mv: cannot stat 'perf/.libbpf.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target 'perf/libbpf.o' failed
In file included from libbpf.c:52:0:
btf.h:25:24: error: redundant redeclaration of 'btf__type_by_id' [-Werror=
=3Dredundant-decls]
 const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_i=
d);
                        ^~~~~~~~~~~~~~~
btf.h:20:24: note: previous declaration of 'btf__type_by_id' was here
 const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 id);
                        ^~~~~~~~~~~~~~~
mv: cannot stat 'perf/.libbpf.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target 'perf/libbpf.o' failed

Caused by commit

  89b1698c93a9 ("Merge ra.kernel.org:/pub/scm/linux/kernel/git/davem/net")

Some of the lines in tools/lib/bpf/btf.[ch] were duplicated (they existed
on both sides of the merge).

I have used the net-next tree from next-20180802 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fsb4bth4XmH6FhThHKnKa+.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltjuoYACgkQAVBC80lX
0GwN6Qf9Eso6jbVnUyskijANFZoVYQrDwVMvuPsXOJ/+fHfe8hkbQ3FdkNCdLp4W
6St/e8nLK7B0OR1Oxog2zGagonnO4vePcayHahYhCanSogx95B+p4kGWa5HfxJU9
SBk1H6QaxxbzXLkHyVVcBCgaOzoRK4i7XP98cqA6QgelbydW4sh0CJ1XMCpojV9n
UYQRDwxHy8yKCjUNmqbOPwVLrdPvU7urqSjdxZQCBlFird92iGbasVxbAipugiuM
i10fQ35nZ36bVwDOo9cLqoiFNSY3bKYYU3piZsEuf2mvmJmr6wdPvpS51d+ihX4i
BdaSXSDsUFtBJZCQECfGlWeFx5Sa6g==
=F1G7
-----END PGP SIGNATURE-----

--Sig_/Fsb4bth4XmH6FhThHKnKa+.--
