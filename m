From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the pm tree
Date: Tue, 4 Dec 2018 16:54:47 +1100
Message-ID: <20181204165447.1532b860@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GT2+twQSgi.G9sZxOUmDEpw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

--Sig_/GT2+twQSgi.G9sZxOUmDEpw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/exec.c

between commit:

  67fe1224adc5 ("Revert "exec: make de_thread() freezable"")

from the pm tree and patch:

  "fs/: remove caller signal_pending branch predictions"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/exec.c
index ea7d439cf79e,044e296f2381..000000000000
--- a/fs/exec.c
+++ b/fs/exec.c
@@@ -1086,8 -1087,8 +1086,8 @@@ static int de_thread(struct task_struc
  	while (sig->notify_count) {
  		__set_current_state(TASK_KILLABLE);
  		spin_unlock_irq(lock);
 -		freezable_schedule();
 +		schedule();
- 		if (unlikely(__fatal_signal_pending(tsk)))
+ 		if (__fatal_signal_pending(tsk))
  			goto killed;
  		spin_lock_irq(lock);
  	}
@@@ -1114,8 -1115,8 +1114,8 @@@
  			__set_current_state(TASK_KILLABLE);
  			write_unlock_irq(&tasklist_lock);
  			cgroup_threadgroup_change_end(tsk);
 -			freezable_schedule();
 +			schedule();
- 			if (unlikely(__fatal_signal_pending(tsk)))
+ 			if (__fatal_signal_pending(tsk))
  				goto killed;
  		}
 =20

--Sig_/GT2+twQSgi.G9sZxOUmDEpw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwGFqcACgkQAVBC80lX
0GyWmQf8CsB1PNYlnXaVvkA7En1TTJtQOPvobSItAL+bGMskalF0SBuGu2VM2Tm1
flrzBLINQkecNOWLsU0ZYgqGvwBRZKtmrBd5fFeWiO3HAYRq0mejFCCuFDUf1czZ
uXlWhPM9iqCrO4r8o3bdXA9ySThH4EPoVpMLCqQWu1Uexx8aP/d6P2y4Yuxq8XXq
awE7S7lP1kLEmRDZClKYiExa3Nbe3IEP96N7JktVv/TzqvDam2otjfu8w1Ta0tdR
M2Q9QEMrK7A/y3mtzP0tpeurrqO0lCXCYdDlvi0wl8ml5hE9BEZzuaAqCRdLAQcH
utq1/duRhHCmM1CbMDgozrVLLdObfw==
=vFKv
-----END PGP SIGNATURE-----

--Sig_/GT2+twQSgi.G9sZxOUmDEpw--
