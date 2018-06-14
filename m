From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Thu, 14 Jun 2018 11:36:12 +1000
Message-ID: <20180614113612.14dbbe6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x6fEeW5MREffoTit27wXdY0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/x6fEeW5MREffoTit27wXdY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/binfmt_elf.c

between commit:

  42bc47b35320 ("treewide: Use array_size() in vmalloc()")

from Linus' tree and commit:

  1d5239111f52 ("coredump: fix spam with zero VMA process")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/binfmt_elf.c
index 070b6184642d,8676bb01b5a9..000000000000
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@@ -2294,8 -2294,8 +2294,8 @@@ static int elf_core_dump(struct coredum
 =20
  	if (segs - 1 > ULONG_MAX / sizeof(*vma_filesz))
  		goto end_coredump;
- 	vma_filesz =3D vmalloc(array_size(sizeof(*vma_filesz), (segs - 1)));
- 	if (!vma_filesz)
 -	vma_filesz =3D kvmalloc((segs - 1) * sizeof(*vma_filesz), GFP_KERNEL);
++	vma_filesz =3D kvmalloc(array_size(sizeof(*vma_filesz), (segs - 1)), GFP=
_KERNEL);
+ 	if (ZERO_OR_NULL_PTR(vma_filesz))
  		goto end_coredump;
 =20
  	for (i =3D 0, vma =3D first_vma(current, gate_vma); vma !=3D NULL;

--Sig_/x6fEeW5MREffoTit27wXdY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlshxowACgkQAVBC80lX
0GzOMwf7BmzDaYGonseWEytuGruqxr6XBLGnQyN9um+6k7P+tR0ifXpEnZ7Rd+Rr
snMiDMs25PL/wVwV2z0vRU+qDTgKRJ6d+eAtOZbmAIDGAUNeyID9aBGKQkqfhdPS
wbvKlhSpwSm6Eqo7uZQbQSSZqP2/J0P0jrpEz1KTUwCdG1XpOWLHue4RYJyWt/tR
JqG4y+cpusaqc+ZLRyaqSFNF/Kl7kEL9ldssXJUlX9Dsq4k39ip4y0zLePURSXg2
uzTDw7F/yDPRNIwqIoYJ6dbhT+3SfzAxy5Zoi8hWo8jdWylX90jlQKC0Sz/CZf3g
HJSdk9FV2P3cgX+1J+71OeWaiLI0bQ==
=RlxI
-----END PGP SIGNATURE-----

--Sig_/x6fEeW5MREffoTit27wXdY0--
