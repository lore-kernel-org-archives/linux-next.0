From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfio tree with Linus' tree
Date: Mon, 4 Jun 2018 16:15:18 +1000
Message-ID: <20180604161518.4276f5f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nQEGdUeeD31cBy7J7b/EWDC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nQEGdUeeD31cBy7J7b/EWDC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/vfio/vfio_iommu_type1.c

between commit:

  89c29def6b01 ("Revert "vfio/type1: Improve memory pinning process for raw=
 PFN mapping"")

from Linus' tree and commit:

  7b578b0de3d3 ("vfio/type1: Fix task tracking for QEMU vCPU hotplug")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/vfio/vfio_iommu_type1.c
index 3c082451ab1a,2c71508abdd8..000000000000
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@@ -422,8 -434,8 +426,8 @@@ static long vfio_pin_pages_remote(struc
  	 * Reserved pages aren't counted against the user, externally pinned
  	 * pages are already counted against the user.
  	 */
 -	if (!vfio_find_vpfn(dma, iova)) {
 +	if (!rsvd && !vfio_find_vpfn(dma, iova)) {
- 		if (!lock_cap && current->mm->locked_vm + 1 > limit) {
+ 		if (!dma->lock_cap && current->mm->locked_vm + 1 > limit) {
  			put_pfn(*pfn_base, dma->prot);
  			pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n", __func__,
  					limit << PAGE_SHIFT);
@@@ -448,8 -459,8 +452,8 @@@
  			break;
  		}
 =20
 -		if (!vfio_find_vpfn(dma, iova)) {
 +		if (!rsvd && !vfio_find_vpfn(dma, iova)) {
- 			if (!lock_cap &&
+ 			if (!dma->lock_cap &&
  			    current->mm->locked_vm + lock_acct + 1 > limit) {
  				put_pfn(pfn, dma->prot);
  				pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",

--Sig_/nQEGdUeeD31cBy7J7b/EWDC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsU2PYACgkQAVBC80lX
0GyVTggAnSYrqGw3Tr6MVYuOuvYq9BIGsi+qaDpkvyHTT9IhGCczZwCo4f5sXzYy
e8iRdksAwi+wxTrmH9MCJL6DOtZQ9dMPkzP/sqfJ71fF1/MHVBccOUOryYoSBnXZ
PN52CYBg9yzKXhyb0N/QfMlxt0VWs+EiRH/VyUrdj40DYXQLFBRrsoHnG15UT4v4
XO4X2Ds9/JvIKIZzIUCzR6bo9pDjjxedz9QOT+bij1xF1ki5BoXpyWcGnjQH5UVG
kO3L8XDjcVyEQSYdb3+Pu8NDPKCNsHaYAVhywAj+hAAl8Wj7R5qfqkT7QTrPBR/R
cPId1la64TETMQVgqhDbFuBra4kkeA==
=F0Sa
-----END PGP SIGNATURE-----

--Sig_/nQEGdUeeD31cBy7J7b/EWDC--
