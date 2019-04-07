From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp-gustavo tree with Linus' tree
Date: Mon, 8 Apr 2019 07:17:31 +1000
Message-ID: <20190408071731.6bd422f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y475Gd=COLBmDJe7eBg+gzi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Y475Gd=COLBmDJe7eBg+gzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp-gustavo tree got a conflict in:

  arch/x86/include/asm/syscall.h

between commits:

  b35f549df1d7 ("syscalls: Remove start and number from syscall_get_argumen=
ts() args")
  32d92586629a ("syscalls: Remove start and number from syscall_set_argumen=
ts() args")

from Linus' tree and commit:

  1f7ae812f87e ("x86/syscalls: Mark expected switch fall-throughs")

from the kspp-gustavo tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y475Gd=COLBmDJe7eBg+gzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyqaOwACgkQAVBC80lX
0Gx+Pgf+N9aZKC61UevWKUQaZgOhdFapOma2hw3WBjRl87tVHEXsOIVem1c8/Y+O
w71OM2AbIyyQUCOBzNqLARbqcZORrvW/yJ5FAVgAS7ZIJFG1NcAHMEwWe500jugQ
wNi2POD7di6TwQiAsm5YOKg987vmDfj7gjzS31vvuFVT+o7zpDOMefUuWTgclLG0
ZDDbYGkTY+ZrOyQceYlK3YvJZeR7puq4RK5r/4AXRBa0JIsif2dnal6iKIsJ2jw1
tf/X7nNeGfkRBEQNMlU8Ix1Tds0XWVeuT2+blBkkeRzD2KWsfJws++i1Xj9iXJzK
xhAl50X0ypbbYPD9Rdlvl/8UpXV86A==
=Xbdc
-----END PGP SIGNATURE-----

--Sig_/Y475Gd=COLBmDJe7eBg+gzi--
