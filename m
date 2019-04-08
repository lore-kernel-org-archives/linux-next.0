From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Mon, 8 Apr 2019 11:31:31 +1000
Message-ID: <20190408113131.222f480a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YA13TXinWxi=57RCNhi.iwP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>, "Dmitry V. Levin" <ldv@altlinux.org>
List-Id: linux-next.vger.kernel.org

--Sig_/YA13TXinWxi=57RCNhi.iwP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got conflicts in:

  arch/mips/kernel/ptrace.c
  kernel/seccomp.c

between commit:

  b35f549df1d7 ("syscalls: Remove start and number from syscall_get_argumen=
ts() args")

from Linus' tree and commit:

  16add411645c ("syscall_get_arch: add "struct task_struct *" argument")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/kernel/ptrace.c
index 3a62f80958e1,2ead6ff919b7..000000000000
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@@ -1418,8 -1418,8 +1418,8 @@@ asmlinkage long syscall_trace_enter(str
  		unsigned long args[6];
 =20
  		sd.nr =3D syscall;
- 		sd.arch =3D syscall_get_arch();
+ 		sd.arch =3D syscall_get_arch(current);
 -		syscall_get_arguments(current, regs, 0, 6, args);
 +		syscall_get_arguments(current, regs, args);
  		for (i =3D 0; i < 6; i++)
  			sd.args[i] =3D args[i];
  		sd.instruction_pointer =3D KSTK_EIP(current);
diff --cc kernel/seccomp.c
index df27e499956a,36f36ab00f48..000000000000
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@@ -148,8 -148,8 +148,8 @@@ static void populate_seccomp_data(struc
  	unsigned long args[6];
 =20
  	sd->nr =3D syscall_get_nr(task, regs);
- 	sd->arch =3D syscall_get_arch();
+ 	sd->arch =3D syscall_get_arch(task);
 -	syscall_get_arguments(task, regs, 0, 6, args);
 +	syscall_get_arguments(task, regs, args);
  	sd->args[0] =3D args[0];
  	sd->args[1] =3D args[1];
  	sd->args[2] =3D args[2];

--Sig_/YA13TXinWxi=57RCNhi.iwP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyqpHMACgkQAVBC80lX
0Gy01Af/XeCzjLJfHa4aJdS9laNaWzt/uoB0ern40eoTLG/FY61TbgI/Vw2hDAzG
rvz2fo/Mt373SQf/LTHLzktDAgrGZaketo1KMPJvQQ6fR2A0UyfNQU/aNl9Q+L+O
QNP0YVraJj7mm7gJ8juTtOEWKkCCrMPuhMr8wojhCW661Q3xCSAm2I5aL/dAZJFv
OhEuLvLNRJh3U1SlX9W/6cmJCm0S/6eMvk2SBshm6EwuZN5eDeTv8bPiDfUpp8Sp
TSlx9ymcC6G2uS06VbRujHia5Xjh8u+loIg0nkCi5de94Fx/EecZusp0s2Bv8r3n
9C42uc5fp8gBRRH8oA6tvi+1cAOoWg==
=GhgX
-----END PGP SIGNATURE-----

--Sig_/YA13TXinWxi=57RCNhi.iwP--
