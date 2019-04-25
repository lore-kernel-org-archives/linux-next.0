From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma-fixes tree with Linus' tree
Date: Fri, 26 Apr 2019 07:37:09 +1000
Message-ID: <20190426073709.77e7b0bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2ThAo/GKnTkTAEoqNWTyG/4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2ThAo/GKnTkTAEoqNWTyG/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma-fixes tree got a conflict in:

  drivers/infiniband/core/uverbs_main.c

between commit:

  04f5866e41fb ("coredump: fix race condition between mmget_not_zero()/get_=
task_mm() and core dumping")

from Linus' tree and commit:

  67f269b37f9b ("RDMA/ucontext: Fix regression with disassociate")

from the rdma-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/uverbs_main.c
index f2e7ffe6fc54,db20b6e0f253..000000000000
--- a/drivers/infiniband/core/uverbs_main.c
+++ b/drivers/infiniband/core/uverbs_main.c
@@@ -992,9 -1039,7 +1039,9 @@@ void uverbs_user_mmap_disassociate(stru
  		 * at a time to get the lock ordering right. Typically there
  		 * will only be one mm, so no big deal.
  		 */
- 		down_write(&mm->mmap_sem);
+ 		down_read(&mm->mmap_sem);
 +		if (!mmget_still_valid(mm))
 +			goto skip_mm;
  		mutex_lock(&ufile->umap_lock);
  		list_for_each_entry_safe (priv, next_priv, &ufile->umaps,
  					  list) {
@@@ -1006,11 -1051,9 +1053,10 @@@
 =20
  			zap_vma_ptes(vma, vma->vm_start,
  				     vma->vm_end - vma->vm_start);
- 			vma->vm_flags &=3D ~(VM_SHARED | VM_MAYSHARE);
  		}
  		mutex_unlock(&ufile->umap_lock);
 +	skip_mm:
- 		up_write(&mm->mmap_sem);
+ 		up_read(&mm->mmap_sem);
  		mmput(mm);
  	}
  }

--Sig_/2ThAo/GKnTkTAEoqNWTyG/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCKIUACgkQAVBC80lX
0GwHVwf/ZrNV36PBAapIgDy+mi4MTqKAXXdl8vobgt+TdpXfF5AUNsZyvhNh32HO
yZRVITnyaZx5fofjehE566jxz2nI6x56RXT031szgbVGnbtIViJpSLrTfHutqyTJ
KiBvMiuaXYk+ELfqA6WML4qV+nh+Zne4fxjUckj0Inj4sOTQk8t0j+S/pAmmKMLO
GXwX/Speum6UGykYDBzuNdMGDeYDyGcrWF3bWhhvu0PW207rjsft6Ds4EuNGgvws
GzEQkylx9Y7O5avetSIF6vH2jOhSISWYaw1a2mdMqf/Gzu9f97ziURB6u6+v0BUk
mKo2TpnH18Hacsr94okzQ0xXtT4sJw==
=dKKb
-----END PGP SIGNATURE-----

--Sig_/2ThAo/GKnTkTAEoqNWTyG/4--
