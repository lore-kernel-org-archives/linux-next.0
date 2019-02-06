From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 powerpc-fixes tree
Date: Wed, 6 Feb 2019 16:15:01 +1100
Message-ID: <20190206161501.070912bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ocMURUR.zSRJHN=EfOUsA1T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ocMURUR.zSRJHN=EfOUsA1T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/mm/pgtable-book3s64.c

between commit:

  579b9239c1f3 ("powerpc/radix: Fix kernel crash with mremap()")

from the powerpc-fixes tree and commit:

  41bde21e85a7 ("arch/powerpc/mm: Nest MMU workaround for mprotect RW upgra=
de")

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

diff --cc arch/powerpc/mm/pgtable-book3s64.c
index ecd31569a120,9f154efed1ae..c11c60056669
--- a/arch/powerpc/mm/pgtable-book3s64.c
+++ b/arch/powerpc/mm/pgtable-book3s64.c
@@@ -401,24 -398,27 +398,49 @@@ void arch_report_meminfo(struct seq_fil
  }
  #endif /* CONFIG_PROC_FS */
 =20
 +/*
 + * For hash translation mode, we use the deposited table to store hash sl=
ot
 + * information and they are stored at PTRS_PER_PMD offset from related pmd
 + * location. Hence a pmd move requires deposit and withdraw.
 + *
 + * For radix translation with split pmd ptl, we store the deposited table=
 in the
 + * pmd page. Hence if we have different pmd page we need to withdraw duri=
ng pmd
 + * move.
 + *
 + * With hash we use deposited table always irrespective of anon or not.
 + * With radix we use deposited table only for anonymous mapping.
 + */
 +int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 +			   struct spinlock *old_pmd_ptl,
 +			   struct vm_area_struct *vma)
 +{
 +	if (radix_enabled())
 +		return (new_pmd_ptl !=3D old_pmd_ptl) && vma_is_anonymous(vma);
 +
 +	return true;
 +}
++
+ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long ad=
dr,
+ 			     pte_t *ptep)
+ {
+ 	unsigned long pte_val;
+=20
+ 	/*
+ 	 * Clear the _PAGE_PRESENT so that no hardware parallel update is
+ 	 * possible. Also keep the pte_present true so that we don't take
+ 	 * wrong fault.
+ 	 */
+ 	pte_val =3D pte_update(vma->vm_mm, addr, ptep, _PAGE_PRESENT, _PAGE_INVA=
LID, 0);
+=20
+ 	return __pte(pte_val);
+=20
+ }
+=20
+ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long ad=
dr,
+ 			     pte_t *ptep, pte_t old_pte, pte_t pte)
+ {
+ 	if (radix_enabled())
+ 		return radix__ptep_modify_prot_commit(vma, addr,
+ 						      ptep, old_pte, pte);
+ 	set_pte_at(vma->vm_mm, addr, ptep, pte);
+ }

--Sig_/ocMURUR.zSRJHN=EfOUsA1T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxabVUACgkQAVBC80lX
0Gz8QggAgtrN83vfPaENyHMWdrr/t6+xWtG20urPqQGGTj3WBAPd5a5OoUUa9a21
KPwB0+1kdwcFOmupAyCGRzz3+8Zw9jXGxZTSJqYajL1kM5tWoYTQMnSWOIonQDke
hsVNwclWCd+8D8vzGw8qWN5V1+M3M+OAsck5RiyPMlgicUaDQELQ6bwttKRb0b+x
2b/D1ZExPngCRkBnBzIcWsh4Br12QkTejlI0IJKGhSj5I7tBm6yWrqoS2/QU3y5Q
5qlWv9znvKTWZB0boG04nzvQc5SpwUou678XG3qtf8eydW8Wrzu2yfH9uJ+tEhuh
8Eux6sq1KODdt8k9JDjzh/QxHcCiSQ==
=ko55
-----END PGP SIGNATURE-----

--Sig_/ocMURUR.zSRJHN=EfOUsA1T--
