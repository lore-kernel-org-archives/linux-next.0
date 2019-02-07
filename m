From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the mips-fixes tree
Date: Fri, 8 Feb 2019 09:22:10 +1100
Message-ID: <20190208092210.653a9bcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rrF3iid0usznE6OR18/XudT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Huang Pei <huangpei@loongson.cn>
List-Id: linux-next.vger.kernel.org

--Sig_/rrF3iid0usznE6OR18/XudT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/include/asm/pgtable.h

between commit:

  e02e07e3127d ("MIPS: Loongson: Introduce and use loongson_llsc_mb()")

from the mips-fixes tree and commit:

  c7e2d71dda7a ("MIPS: Fix set_pte() for Netlogic XLR using cmpxchg64()")

from the mips tree.

I fixed it up (I just used the mips tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/rrF3iid0usznE6OR18/XudT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxcr5IACgkQAVBC80lX
0GwAfAf+OdzsNJWdkZsZAt0+mLS7IYyWB45KKDXCzrAwK/9i2b1MIjeECKheJUyE
NRbJ6wBN//+b/XbgZq27/nPe0rasyzDCwN6SxOpgCNKpCSl5Ylcbjz97EPdUp1Z8
m6o6mMz8qU/LDBf2khURAPUWO7lMmmj9zTU4RhZa1Rr08Crq1jo8227JEUSt3noS
+d7Uni4EcWoA7J28L3qesoHCo+k31QAivlbkXtXW053lZ9uNWoXQAklWhXQC20Sy
S4opS3eXReLA089SmE8r3O6f8go/56IclzGl76Oeh+tRiYfE65VH7/bpGmSjfueq
4sNwTbG0HFPNCGt3wBy4L+Xygz/0XQ==
=fmO3
-----END PGP SIGNATURE-----

--Sig_/rrF3iid0usznE6OR18/XudT--
