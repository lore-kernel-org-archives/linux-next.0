From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 17 Apr 2019 16:53:21 +1000
Message-ID: <20190417165321.61cd6380@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bd=lVB6xi8RtUho1ZJYpL/Y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bd=lVB6xi8RtUho1ZJYpL/Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/binfmt_elf.c: In function 'load_elf_binary':
fs/binfmt_elf.c:1140:7: error: 'elf_interpreter' undeclared (first use in t=
his function); did you mean 'interpreter'?
  if (!elf_interpreter)
       ^~~~~~~~~~~~~~~
       interpreter


Caused by commit

  3ebf0dd657ce ("fs/binfmt_elf.c: move brk out of mmap when doing direct lo=
ader exec")

interacting with commit

  a34f642bccf1 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Apr 2019 16:48:29 +1000
Subject: [PATCH] fix "fs/binfmt_elf.c: move brk out of mmap when doing dire=
ct loader exec"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/binfmt_elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index b3bbe6bca499..fe5668a1bbaa 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1137,7 +1137,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	 * collide early with the stack growing down), and into the unused
 	 * ELF_ET_DYN_BASE region.
 	 */
-	if (!elf_interpreter)
+	if (!interpreter)
 		current->mm->brk =3D current->mm->start_brk =3D ELF_ET_DYN_BASE;
=20
 	if ((current->flags & PF_RANDOMIZE) && (randomize_va_space > 1)) {
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/bd=lVB6xi8RtUho1ZJYpL/Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2zWEACgkQAVBC80lX
0GxAqQf/XtjY9CQ2auY+756f5/Mo7tU3IiCeQbfx/PqKttY6xFRhVPWUwYmLQBEO
GXC13BL00o2WU6QBZyvxVJOTJEymolxOLIxL3soIwa8tafJZeJtZNiLfFUREoAXL
meFN2pWstqGA3FjvJ02FmNQJ5kXEDIoKgRn+VGNzkj8RejX6Jld1JrY4X7oNjkw0
9WIRcIB82tuKDpoPC5ktq/LU608qR36dA3FBoCFZVnpGidbESqA+2WjYip1TQpyi
WKNB/FErVvGUTDihFlSYxt077pTncY2jKMA1eizlmvKrqBOJ9mq3KsoNS5eGeqIe
LIPTGdFTgPtv7cXK2ATcjUdvAXRQ8Q==
=0NE0
-----END PGP SIGNATURE-----

--Sig_/bd=lVB6xi8RtUho1ZJYpL/Y--
