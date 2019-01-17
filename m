From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arc-current tree with Linus' tree
Date: Fri, 18 Jan 2019 08:22:37 +1100
Message-ID: <20190118082237.4cb892c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+cLRlcqQ.iby8NRqd33W9Aw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

--Sig_/+cLRlcqQ.iby8NRqd33W9Aw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arc-current tree got a conflict in:

  arch/arc/mm/fault.c

between commit:

  d8d7d842e828 ("arch/arc/mm/fault.c: remove caller signal_pending_branch p=
redictions")

from Linus' tree and commit:

  ce3e02e8be58 ("ARC: mm: do_page_fault fixes #1: relinquish mmap_sem if si=
gnal arrives while handle_mm_fault")

from the arc-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arc/mm/fault.c
index a1d723197084,535cf18e8bf2..000000000000
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@@ -141,12 -141,17 +141,17 @@@ good_area
  	 */
  	fault =3D handle_mm_fault(vma, address, flags);
 =20
- 	/* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
 -	if (unlikely(fatal_signal_pending(current))) {
 +	if (fatal_signal_pending(current)) {
- 		if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
- 			up_read(&mm->mmap_sem);
- 		if (user_mode(regs))
+=20
+ 		/*
+ 		 * if fault retry, mmap_sem already relinquished by core mm
+ 		 * so OK to return to user mode (with signal handled first)
+ 		 */
+ 		if (fault & VM_FAULT_RETRY) {
+ 			if (!user_mode(regs))
+ 				goto no_context;
  			return;
+ 		}
  	}
 =20
  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);

--Sig_/+cLRlcqQ.iby8NRqd33W9Aw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxA8h0ACgkQAVBC80lX
0GyLAwf7BLnSKmuQV1SRxUTc4sQVuaTbJ6Le68lfRqFU0PWOtCqcXxffmy1xUsKN
ihgJ+mu25mw9ZpX2razrtAxJJDy2jyDdlZ8E+Q9o0PZQ6/natcaUBIxayvnBsGiC
SjfEAAS7l1Q5Lt5fYydY6ZQBfYyVNM64lQtr8rrcspmgSusS0Jxj5QxpZZVZ+8Hu
19f6JiFrpjGS4v3ISC32Rv13GuJYTg++ASnnvwfZiMOYVtTmkNDEaY26of+fXnOa
4P5lNPjTo62MDV/o7EKSqVuqRTS8HqUiJ68c9z1rZbzSTZ+6l87vqjtBwcBuPV7j
TVw3x7fboUP2t7C6jVYXRr0PI0iHdg==
=eZEw
-----END PGP SIGNATURE-----

--Sig_/+cLRlcqQ.iby8NRqd33W9Aw--
