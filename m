From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Date: Mon, 25 Feb 2019 17:16:09 +1100
Message-ID: <20190225171609.07e1fc5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wB4RF05PjbNRP=+Lz_T8n29"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Mike Rapoport <rppt@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wB4RF05PjbNRP=+Lz_T8n29
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/kernel/setup_64.c

between commits:

  c8e409a33cf8 ("powerpc/irq: use memblock functions returning virtual addr=
ess")
  d608898abc74 ("powerpc: clean stack pointers naming")

from the powerpc tree and commit:

  82af77ee7503 ("powerpc: prefer memblock APIs returning virtual address")

from the akpm-current tree.

Commits 82af77ee7503 and c8e409a33cf8 overlap.

I fixed it up (I just used the powerpc tree version of this file) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/wB4RF05PjbNRP=+Lz_T8n29
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxziCkACgkQAVBC80lX
0GyuBgf9FaNXvPy+jebJC00E3VW/fZhuXIA/tmJo/VHT5juh3uXkJI9uOO2/m435
vHSCtdrKouDdZilm0nv2flDVU/h+Cat4Rh5icLYuB5+b1q1LPgIgNUhaMayKQDNs
XK6knx7bw+ZFhxzEUS6C24G0W80ywnXwNcAysrL/nE8ter4QfjSq5ejjfsS9rdw8
4M+9rv2KmRu7uvF4BkzGoj4nnwq6C6v1TqCHcudCdqMV4aYIkWPqOvaE8vHqUXis
ak0wiRwiBYAXO/mMV4TjRi0PA8RXjbq6ZJ6pIu90yzsyu/3xnmE1CYnnWaUF24tn
ZsW6cU2KMMVGgcQBlnhk2H0OxzkDtw==
=VCbT
-----END PGP SIGNATURE-----

--Sig_/wB4RF05PjbNRP=+Lz_T8n29--
