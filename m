From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 28 May 2019 13:50:00 +1000
Message-ID: <20190528135000.247cfe4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WmuwxYVxOxiu3GFbVs594I0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/WmuwxYVxOxiu3GFbVs594I0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/mm/extable.c:6:
include/linux/uaccess.h:302:29: error: static declaration of 'probe_user_re=
ad' follows non-static declaration
 static __always_inline long probe_user_read(void *dst, const void __user *=
src,
                             ^~~~~~~~~~~~~~~
include/linux/uaccess.h:254:13: note: previous declaration of 'probe_user_r=
ead' was here
 extern long probe_user_read(void *dst, const void __user *src, size_t size=
);
             ^~~~~~~~~~~~~~~

(and more ...)

Caused by commit

  3d127e17e970 ("include/linux/uaccess.h: add probe_user_read()")

interacting with commit

  3d7081822f7f ("uaccess: Add non-pagefault user-space read functions")

from the ftrace tree.

I have reverted the akpm-current tree fix for today (and the following
"mm-add-probe_user_read-fix").  Hopefully the following commit

  f414d1502add ("powerpc: use probe_user_read()") is still valid.

--=20
Cheers,
Stephen Rothwell

--Sig_/WmuwxYVxOxiu3GFbVs594I0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzsr+gACgkQAVBC80lX
0GxSyQf7BZj8dtGeDHtIzcfX5OK7tApjoIasX4EkUKLtpg2SWpcc6xIPDQvhIylD
Wxvnth/dd/zmB8//TVsXCLZ3rgQLrStnpHEVrq2mxzeoy5uTh0UPd+fGRz9gk0tE
tpgnX/VZA7PsOU6nM1Mm9b6y+ml0Eo4nYUVS8LnV/592lFaAoazTRSzxJ8wUjb6b
dADaKOkRNzMmoSLuGySBGazZcNGePjs6yYoer6qoIASwvUZyy1of3hmDqL1Usdgm
jD3z++A9TmBVzEZGodFxLBUnjoX10tW8KHU1OfUWCXBoazDeJvTEU34Qo9DRK0VQ
RMOyrREv+TBdkxvv1xkTbKgi7hTosw==
=Yj02
-----END PGP SIGNATURE-----

--Sig_/WmuwxYVxOxiu3GFbVs594I0--
