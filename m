Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A12D47E4;
	Thu,  5 Feb 2026 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296663; cv=none; b=mlcYrJ2Oq4zn/tcW9LtLBrRuOxDSFqdZL5N9eAkcII7UFQSu95lguKqlGfp5m1LYkaGkAgJyp1MvV1kMaT47MKk2pgpaJJURq9eObfjlVKbmAbvAKiv5Kkd8VW8lfRadKLcs81TNYIzaKyAGx9eAcYiNS/17Oe8fOfAgnh3MNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296663; c=relaxed/simple;
	bh=sxWXnfiPo3jnBI1KWnq1cSyhdOXozHGk4R5LJ0chqLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmvSTLjAFum8LKJBxP32O85FaMSGGd/usgVUfPviCBHNkTnxMwZzwHO5roBsMGfa5A+NnNW0NgqYkThTFRhw/GijDhrvLZwHBt/OwR+e1O+OxdyoskhX+dUH2qwZqieUt7gHyVhey6Qo/vkzKIyg84kZgUoJ72eDDqh2dm+0MwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7KGa8ua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7KGa8ua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9494CC4CEF7;
	Thu,  5 Feb 2026 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770296663;
	bh=sxWXnfiPo3jnBI1KWnq1cSyhdOXozHGk4R5LJ0chqLg=;
	h=Date:From:To:Cc:Subject:From;
	b=B7KGa8uaYsXqXAYmQ6HJLrdTImaPmqbYH7pNv3Z+C49vKxNzYfvOfby4CDL9enaSY
	 6WCxG3l3evZUeKwNVhHHXAXcRvZJDJUWBX0zEon2wBSYMX+hXPJPlorXu0vs58A/q/
	 0vJ9RhNRNIHWI2nsYSL9XHHgmmjBMKxQ/4A0dFtSz9/xSdrqC6cGrFC8xIEJX4GPHy
	 +FpwhDEItcpEoiUQxlju5aykjDunkU2pdtwkimKhX1AKMdVCCGn1XTAQl7fLDYJ8rf
	 ChW67uLsJZcavWBcx0ZuOQEnCX3tmXqYtjf2fyp2O4ShegkgGDymdeK2S8KdBhxQJw
	 S/7m0/vuK54+A==
Date: Thu, 5 Feb 2026 13:04:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Kairui Song <kasong@tencent.com>, Kairui Song <ryncsn@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvms390 tree with the mm-stable tree
Message-ID: <aYSVUnyIHvEkCN4U@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47PsE2kcZ0lg2e9n"
Content-Disposition: inline


--47PsE2kcZ0lg2e9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/mm/pgtable.c

between commit:

  36976159140bc ("mm, swap: cleanup swap entry management workflow")

=66rom the mm-stable tree and commit:

  728b0e21b473a ("KVM: S390: Remove PGSTE code from linux/s390 mm")

=66rom the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/s390/mm/pgtable.c
index b22181e1079e8,4acd8b140c4bd..0000000000000
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@@ -24,7 -24,6 +24,6 @@@
  #include <asm/tlbflush.h>
  #include <asm/mmu_context.h>
  #include <asm/page-states.h>
- #include <asm/pgtable.h>
  #include <asm/machine.h>
 =20
  pgprot_t pgprot_writecombine(pgprot_t prot)
@@@ -116,149 -115,14 +115,14 @@@ static inline pte_t ptep_flush_lazy(str
  	return old;
  }
 =20
- static inline pgste_t pgste_get(pte_t *ptep)
- {
- 	unsigned long pgste =3D 0;
- #ifdef CONFIG_PGSTE
- 	pgste =3D *(unsigned long *)(ptep + PTRS_PER_PTE);
- #endif
- 	return __pgste(pgste);
- }
-=20
- static inline void pgste_set(pte_t *ptep, pgste_t pgste)
- {
- #ifdef CONFIG_PGSTE
- 	*(pgste_t *)(ptep + PTRS_PER_PTE) =3D pgste;
- #endif
- }
-=20
- static inline pgste_t pgste_update_all(pte_t pte, pgste_t pgste,
- 				       struct mm_struct *mm)
- {
- #ifdef CONFIG_PGSTE
- 	unsigned long address, bits, skey;
-=20
- 	if (!mm_uses_skeys(mm) || pte_val(pte) & _PAGE_INVALID)
- 		return pgste;
- 	address =3D pte_val(pte) & PAGE_MASK;
- 	skey =3D (unsigned long) page_get_storage_key(address);
- 	bits =3D skey & (_PAGE_CHANGED | _PAGE_REFERENCED);
- 	/* Transfer page changed & referenced bit to guest bits in pgste */
- 	pgste =3D set_pgste_bit(pgste, bits << 48); /* GR bit & GC bit */
- 	/* Copy page access key and fetch protection bit to pgste */
- 	pgste =3D clear_pgste_bit(pgste, PGSTE_ACC_BITS | PGSTE_FP_BIT);
- 	pgste =3D set_pgste_bit(pgste, (skey & (_PAGE_ACC_BITS | _PAGE_FP_BIT)) =
<< 56);
- #endif
- 	return pgste;
-=20
- }
-=20
- static inline void pgste_set_key(pte_t *ptep, pgste_t pgste, pte_t entry,
- 				 struct mm_struct *mm)
- {
- #ifdef CONFIG_PGSTE
- 	unsigned long address;
- 	unsigned long nkey;
-=20
- 	if (!mm_uses_skeys(mm) || pte_val(entry) & _PAGE_INVALID)
- 		return;
- 	VM_BUG_ON(!(pte_val(*ptep) & _PAGE_INVALID));
- 	address =3D pte_val(entry) & PAGE_MASK;
- 	/*
- 	 * Set page access key and fetch protection bit from pgste.
- 	 * The guest C/R information is still in the PGSTE, set real
- 	 * key C/R to 0.
- 	 */
- 	nkey =3D (pgste_val(pgste) & (PGSTE_ACC_BITS | PGSTE_FP_BIT)) >> 56;
- 	nkey |=3D (pgste_val(pgste) & (PGSTE_GR_BIT | PGSTE_GC_BIT)) >> 48;
- 	page_set_storage_key(address, nkey, 0);
- #endif
- }
-=20
- static inline pgste_t pgste_set_pte(pte_t *ptep, pgste_t pgste, pte_t ent=
ry)
- {
- #ifdef CONFIG_PGSTE
- 	if ((pte_val(entry) & _PAGE_PRESENT) &&
- 	    (pte_val(entry) & _PAGE_WRITE) &&
- 	    !(pte_val(entry) & _PAGE_INVALID)) {
- 		if (!machine_has_esop()) {
- 			/*
- 			 * Without enhanced suppression-on-protection force
- 			 * the dirty bit on for all writable ptes.
- 			 */
- 			entry =3D set_pte_bit(entry, __pgprot(_PAGE_DIRTY));
- 			entry =3D clear_pte_bit(entry, __pgprot(_PAGE_PROTECT));
- 		}
- 		if (!(pte_val(entry) & _PAGE_PROTECT))
- 			/* This pte allows write access, set user-dirty */
- 			pgste =3D set_pgste_bit(pgste, PGSTE_UC_BIT);
- 	}
- #endif
- 	set_pte(ptep, entry);
- 	return pgste;
- }
-=20
- static inline pgste_t pgste_pte_notify(struct mm_struct *mm,
- 				       unsigned long addr,
- 				       pte_t *ptep, pgste_t pgste)
- {
- #ifdef CONFIG_PGSTE
- 	unsigned long bits;
-=20
- 	bits =3D pgste_val(pgste) & (PGSTE_IN_BIT | PGSTE_VSIE_BIT);
- 	if (bits) {
- 		pgste =3D __pgste(pgste_val(pgste) ^ bits);
- 		ptep_notify(mm, addr, ptep, bits);
- 	}
- #endif
- 	return pgste;
- }
-=20
- static inline pgste_t ptep_xchg_start(struct mm_struct *mm,
- 				      unsigned long addr, pte_t *ptep)
- {
- 	pgste_t pgste =3D __pgste(0);
-=20
- 	if (mm_has_pgste(mm)) {
- 		pgste =3D pgste_get_lock(ptep);
- 		pgste =3D pgste_pte_notify(mm, addr, ptep, pgste);
- 	}
- 	return pgste;
- }
-=20
- static inline pte_t ptep_xchg_commit(struct mm_struct *mm,
- 				    unsigned long addr, pte_t *ptep,
- 				    pgste_t pgste, pte_t old, pte_t new)
- {
- 	if (mm_has_pgste(mm)) {
- 		if (pte_val(old) & _PAGE_INVALID)
- 			pgste_set_key(ptep, pgste, new, mm);
- 		if (pte_val(new) & _PAGE_INVALID) {
- 			pgste =3D pgste_update_all(old, pgste, mm);
- 			if ((pgste_val(pgste) & _PGSTE_GPS_USAGE_MASK) =3D=3D
- 			    _PGSTE_GPS_USAGE_UNUSED)
- 				old =3D set_pte_bit(old, __pgprot(_PAGE_UNUSED));
- 		}
- 		pgste =3D pgste_set_pte(ptep, pgste, new);
- 		pgste_set_unlock(ptep, pgste);
- 	} else {
- 		set_pte(ptep, new);
- 	}
- 	return old;
- }
-=20
  pte_t ptep_xchg_direct(struct mm_struct *mm, unsigned long addr,
  		       pte_t *ptep, pte_t new)
  {
- 	pgste_t pgste;
  	pte_t old;
- 	int nodat;
 =20
  	preempt_disable();
- 	pgste =3D ptep_xchg_start(mm, addr, ptep);
- 	nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 	old =3D ptep_flush_direct(mm, addr, ptep, nodat);
- 	old =3D ptep_xchg_commit(mm, addr, ptep, pgste, old, new);
+ 	old =3D ptep_flush_direct(mm, addr, ptep, 1);
+ 	set_pte(ptep, new);
  	preempt_enable();
  	return old;
  }
@@@ -292,15 -156,11 +156,11 @@@ EXPORT_SYMBOL(ptep_reset_dat_prot)
  pte_t ptep_xchg_lazy(struct mm_struct *mm, unsigned long addr,
  		     pte_t *ptep, pte_t new)
  {
- 	pgste_t pgste;
  	pte_t old;
- 	int nodat;
 =20
  	preempt_disable();
- 	pgste =3D ptep_xchg_start(mm, addr, ptep);
- 	nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 	old =3D ptep_flush_lazy(mm, addr, ptep, nodat);
- 	old =3D ptep_xchg_commit(mm, addr, ptep, pgste, old, new);
+ 	old =3D ptep_flush_lazy(mm, addr, ptep, 1);
+ 	set_pte(ptep, new);
  	preempt_enable();
  	return old;
  }
@@@ -309,47 -169,22 +169,22 @@@ EXPORT_SYMBOL(ptep_xchg_lazy)
  pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long ad=
dr,
  			     pte_t *ptep)
  {
- 	pgste_t pgste;
- 	pte_t old;
- 	int nodat;
- 	struct mm_struct *mm =3D vma->vm_mm;
-=20
- 	pgste =3D ptep_xchg_start(mm, addr, ptep);
- 	nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 	old =3D ptep_flush_lazy(mm, addr, ptep, nodat);
- 	if (mm_has_pgste(mm)) {
- 		pgste =3D pgste_update_all(old, pgste, mm);
- 		pgste_set(ptep, pgste);
- 	}
- 	return old;
+ 	return ptep_flush_lazy(vma->vm_mm, addr, ptep, 1);
  }
 =20
  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long ad=
dr,
  			     pte_t *ptep, pte_t old_pte, pte_t pte)
  {
- 	pgste_t pgste;
- 	struct mm_struct *mm =3D vma->vm_mm;
-=20
- 	if (mm_has_pgste(mm)) {
- 		pgste =3D pgste_get(ptep);
- 		pgste_set_key(ptep, pgste, pte, mm);
- 		pgste =3D pgste_set_pte(ptep, pgste, pte);
- 		pgste_set_unlock(ptep, pgste);
- 	} else {
- 		set_pte(ptep, pte);
- 	}
+ 	set_pte(ptep, pte);
  }
 =20
  static inline void pmdp_idte_local(struct mm_struct *mm,
  				   unsigned long addr, pmd_t *pmdp)
  {
  	if (machine_has_tlb_guest())
- 		__pmdp_idte(addr, pmdp, IDTE_NODAT | IDTE_GUEST_ASCE,
- 			    mm->context.asce, IDTE_LOCAL);
+ 		__pmdp_idte(addr, pmdp, IDTE_NODAT | IDTE_GUEST_ASCE, mm->context.asce,=
 IDTE_LOCAL);
  	else
  		__pmdp_idte(addr, pmdp, 0, 0, IDTE_LOCAL);
- 	if (mm_has_pgste(mm) && mm->context.allow_gmap_hpage_1m)
- 		gmap_pmdp_idte_local(mm, addr);
  }
 =20
  static inline void pmdp_idte_global(struct mm_struct *mm,
@@@ -358,12 -193,8 +193,8 @@@
  	if (machine_has_tlb_guest()) {
  		__pmdp_idte(addr, pmdp, IDTE_NODAT | IDTE_GUEST_ASCE,
  			    mm->context.asce, IDTE_GLOBAL);
- 		if (mm_has_pgste(mm) && mm->context.allow_gmap_hpage_1m)
- 			gmap_pmdp_idte_global(mm, addr);
  	} else {
  		__pmdp_idte(addr, pmdp, 0, 0, IDTE_GLOBAL);
- 		if (mm_has_pgste(mm) && mm->context.allow_gmap_hpage_1m)
- 			gmap_pmdp_idte_global(mm, addr);
  	}
  }
 =20
@@@ -398,8 -229,6 +229,6 @@@ static inline pmd_t pmdp_flush_lazy(str
  			  cpumask_of(smp_processor_id()))) {
  		set_pmd(pmdp, set_pmd_bit(*pmdp, __pgprot(_SEGMENT_ENTRY_INVALID)));
  		mm->context.flush_mm =3D 1;
- 		if (mm_has_pgste(mm))
- 			gmap_pmdp_invalidate(mm, addr);
  	} else {
  		pmdp_idte_global(mm, addr, pmdp);
  	}
@@@ -407,40 -236,6 +236,6 @@@
  	return old;
  }
 =20
- #ifdef CONFIG_PGSTE
- static int pmd_lookup(struct mm_struct *mm, unsigned long addr, pmd_t **p=
mdp)
- {
- 	struct vm_area_struct *vma;
- 	pgd_t *pgd;
- 	p4d_t *p4d;
- 	pud_t *pud;
-=20
- 	/* We need a valid VMA, otherwise this is clearly a fault. */
- 	vma =3D vma_lookup(mm, addr);
- 	if (!vma)
- 		return -EFAULT;
-=20
- 	pgd =3D pgd_offset(mm, addr);
- 	if (!pgd_present(*pgd))
- 		return -ENOENT;
-=20
- 	p4d =3D p4d_offset(pgd, addr);
- 	if (!p4d_present(*p4d))
- 		return -ENOENT;
-=20
- 	pud =3D pud_offset(p4d, addr);
- 	if (!pud_present(*pud))
- 		return -ENOENT;
-=20
- 	/* Large PUDs are not supported yet. */
- 	if (pud_leaf(*pud))
- 		return -EFAULT;
-=20
- 	*pmdp =3D pmd_offset(pud, addr);
- 	return 0;
- }
- #endif
-=20
  pmd_t pmdp_xchg_direct(struct mm_struct *mm, unsigned long addr,
  		       pmd_t *pmdp, pmd_t new)
  {
@@@ -558,598 -353,3 +353,3 @@@ pgtable_t pgtable_trans_huge_withdraw(s
  	return pgtable;
  }
  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-=20
- #ifdef CONFIG_PGSTE
- void ptep_set_pte_at(struct mm_struct *mm, unsigned long addr,
- 		     pte_t *ptep, pte_t entry)
- {
- 	pgste_t pgste;
-=20
- 	/* the mm_has_pgste() check is done in set_pte_at() */
- 	preempt_disable();
- 	pgste =3D pgste_get_lock(ptep);
- 	pgste =3D clear_pgste_bit(pgste, _PGSTE_GPS_ZERO);
- 	pgste_set_key(ptep, pgste, entry, mm);
- 	pgste =3D pgste_set_pte(ptep, pgste, entry);
- 	pgste_set_unlock(ptep, pgste);
- 	preempt_enable();
- }
-=20
- void ptep_set_notify(struct mm_struct *mm, unsigned long addr, pte_t *pte=
p)
- {
- 	pgste_t pgste;
-=20
- 	preempt_disable();
- 	pgste =3D pgste_get_lock(ptep);
- 	pgste =3D set_pgste_bit(pgste, PGSTE_IN_BIT);
- 	pgste_set_unlock(ptep, pgste);
- 	preempt_enable();
- }
-=20
- /**
-  * ptep_force_prot - change access rights of a locked pte
-  * @mm: pointer to the process mm_struct
-  * @addr: virtual address in the guest address space
-  * @ptep: pointer to the page table entry
-  * @prot: indicates guest access rights: PROT_NONE, PROT_READ or PROT_WRI=
TE
-  * @bit: pgste bit to set (e.g. for notification)
-  *
-  * Returns 0 if the access rights were changed and -EAGAIN if the current
-  * and requested access rights are incompatible.
-  */
- int ptep_force_prot(struct mm_struct *mm, unsigned long addr,
- 		    pte_t *ptep, int prot, unsigned long bit)
- {
- 	pte_t entry;
- 	pgste_t pgste;
- 	int pte_i, pte_p, nodat;
-=20
- 	pgste =3D pgste_get_lock(ptep);
- 	entry =3D *ptep;
- 	/* Check pte entry after all locks have been acquired */
- 	pte_i =3D pte_val(entry) & _PAGE_INVALID;
- 	pte_p =3D pte_val(entry) & _PAGE_PROTECT;
- 	if ((pte_i && (prot !=3D PROT_NONE)) ||
- 	    (pte_p && (prot & PROT_WRITE))) {
- 		pgste_set_unlock(ptep, pgste);
- 		return -EAGAIN;
- 	}
- 	/* Change access rights and set pgste bit */
- 	nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 	if (prot =3D=3D PROT_NONE && !pte_i) {
- 		ptep_flush_direct(mm, addr, ptep, nodat);
- 		pgste =3D pgste_update_all(entry, pgste, mm);
- 		entry =3D set_pte_bit(entry, __pgprot(_PAGE_INVALID));
- 	}
- 	if (prot =3D=3D PROT_READ && !pte_p) {
- 		ptep_flush_direct(mm, addr, ptep, nodat);
- 		entry =3D clear_pte_bit(entry, __pgprot(_PAGE_INVALID));
- 		entry =3D set_pte_bit(entry, __pgprot(_PAGE_PROTECT));
- 	}
- 	pgste =3D set_pgste_bit(pgste, bit);
- 	pgste =3D pgste_set_pte(ptep, pgste, entry);
- 	pgste_set_unlock(ptep, pgste);
- 	return 0;
- }
-=20
- int ptep_shadow_pte(struct mm_struct *mm, unsigned long saddr,
- 		    pte_t *sptep, pte_t *tptep, pte_t pte)
- {
- 	pgste_t spgste, tpgste;
- 	pte_t spte, tpte;
- 	int rc =3D -EAGAIN;
-=20
- 	if (!(pte_val(*tptep) & _PAGE_INVALID))
- 		return 0;	/* already shadowed */
- 	spgste =3D pgste_get_lock(sptep);
- 	spte =3D *sptep;
- 	if (!(pte_val(spte) & _PAGE_INVALID) &&
- 	    !((pte_val(spte) & _PAGE_PROTECT) &&
- 	      !(pte_val(pte) & _PAGE_PROTECT))) {
- 		spgste =3D set_pgste_bit(spgste, PGSTE_VSIE_BIT);
- 		tpgste =3D pgste_get_lock(tptep);
- 		tpte =3D __pte((pte_val(spte) & PAGE_MASK) |
- 			     (pte_val(pte) & _PAGE_PROTECT));
- 		/* don't touch the storage key - it belongs to parent pgste */
- 		tpgste =3D pgste_set_pte(tptep, tpgste, tpte);
- 		pgste_set_unlock(tptep, tpgste);
- 		rc =3D 1;
- 	}
- 	pgste_set_unlock(sptep, spgste);
- 	return rc;
- }
-=20
- void ptep_unshadow_pte(struct mm_struct *mm, unsigned long saddr, pte_t *=
ptep)
- {
- 	pgste_t pgste;
- 	int nodat;
-=20
- 	pgste =3D pgste_get_lock(ptep);
- 	/* notifier is called by the caller */
- 	nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 	ptep_flush_direct(mm, saddr, ptep, nodat);
- 	/* don't touch the storage key - it belongs to parent pgste */
- 	pgste =3D pgste_set_pte(ptep, pgste, __pte(_PAGE_INVALID));
- 	pgste_set_unlock(ptep, pgste);
- }
-=20
- static void ptep_zap_softleaf_entry(struct mm_struct *mm, softleaf_t entr=
y)
- {
- 	if (softleaf_is_swap(entry))
- 		dec_mm_counter(mm, MM_SWAPENTS);
- 	else if (softleaf_is_migration(entry)) {
- 		struct folio *folio =3D softleaf_to_folio(entry);
-=20
- 		dec_mm_counter(mm, mm_counter(folio));
- 	}
- 	swap_put_entries_direct(entry, 1);
- }
-=20
- void ptep_zap_unused(struct mm_struct *mm, unsigned long addr,
- 		     pte_t *ptep, int reset)
- {
- 	unsigned long pgstev;
- 	pgste_t pgste;
- 	pte_t pte;
-=20
- 	/* Zap unused and logically-zero pages */
- 	preempt_disable();
- 	pgste =3D pgste_get_lock(ptep);
- 	pgstev =3D pgste_val(pgste);
- 	pte =3D *ptep;
- 	if (!reset && pte_swap(pte) &&
- 	    ((pgstev & _PGSTE_GPS_USAGE_MASK) =3D=3D _PGSTE_GPS_USAGE_UNUSED ||
- 	     (pgstev & _PGSTE_GPS_ZERO))) {
- 		ptep_zap_softleaf_entry(mm, softleaf_from_pte(pte));
- 		pte_clear(mm, addr, ptep);
- 	}
- 	if (reset)
- 		pgste =3D clear_pgste_bit(pgste, _PGSTE_GPS_USAGE_MASK | _PGSTE_GPS_NOD=
AT);
- 	pgste_set_unlock(ptep, pgste);
- 	preempt_enable();
- }
-=20
- void ptep_zap_key(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
- {
- 	unsigned long ptev;
- 	pgste_t pgste;
-=20
- 	/* Clear storage key ACC and F, but set R/C */
- 	preempt_disable();
- 	pgste =3D pgste_get_lock(ptep);
- 	pgste =3D clear_pgste_bit(pgste, PGSTE_ACC_BITS | PGSTE_FP_BIT);
- 	pgste =3D set_pgste_bit(pgste, PGSTE_GR_BIT | PGSTE_GC_BIT);
- 	ptev =3D pte_val(*ptep);
- 	if (!(ptev & _PAGE_INVALID) && (ptev & _PAGE_WRITE))
- 		page_set_storage_key(ptev & PAGE_MASK, PAGE_DEFAULT_KEY, 0);
- 	pgste_set_unlock(ptep, pgste);
- 	preempt_enable();
- }
-=20
- /*
-  * Test and reset if a guest page is dirty
-  */
- bool ptep_test_and_clear_uc(struct mm_struct *mm, unsigned long addr,
- 		       pte_t *ptep)
- {
- 	pgste_t pgste;
- 	pte_t pte;
- 	bool dirty;
- 	int nodat;
-=20
- 	pgste =3D pgste_get_lock(ptep);
- 	dirty =3D !!(pgste_val(pgste) & PGSTE_UC_BIT);
- 	pgste =3D clear_pgste_bit(pgste, PGSTE_UC_BIT);
- 	pte =3D *ptep;
- 	if (dirty && (pte_val(pte) & _PAGE_PRESENT)) {
- 		pgste =3D pgste_pte_notify(mm, addr, ptep, pgste);
- 		nodat =3D !!(pgste_val(pgste) & _PGSTE_GPS_NODAT);
- 		ptep_ipte_global(mm, addr, ptep, nodat);
- 		if (machine_has_esop() || !(pte_val(pte) & _PAGE_WRITE))
- 			pte =3D set_pte_bit(pte, __pgprot(_PAGE_PROTECT));
- 		else
- 			pte =3D set_pte_bit(pte, __pgprot(_PAGE_INVALID));
- 		set_pte(ptep, pte);
- 	}
- 	pgste_set_unlock(ptep, pgste);
- 	return dirty;
- }
- EXPORT_SYMBOL_GPL(ptep_test_and_clear_uc);
-=20
- int set_guest_storage_key(struct mm_struct *mm, unsigned long addr,
- 			  unsigned char key, bool nq)
- {
- 	unsigned long keyul, paddr;
- 	spinlock_t *ptl;
- 	pgste_t old, new;
- 	pmd_t *pmdp;
- 	pte_t *ptep;
-=20
- 	/*
- 	 * If we don't have a PTE table and if there is no huge page mapped,
- 	 * we can ignore attempts to set the key to 0, because it already is 0.
- 	 */
- 	switch (pmd_lookup(mm, addr, &pmdp)) {
- 	case -ENOENT:
- 		return key ? -EFAULT : 0;
- 	case 0:
- 		break;
- 	default:
- 		return -EFAULT;
- 	}
- again:
- 	ptl =3D pmd_lock(mm, pmdp);
- 	if (!pmd_present(*pmdp)) {
- 		spin_unlock(ptl);
- 		return key ? -EFAULT : 0;
- 	}
-=20
- 	if (pmd_leaf(*pmdp)) {
- 		paddr =3D pmd_val(*pmdp) & HPAGE_MASK;
- 		paddr |=3D addr & ~HPAGE_MASK;
- 		/*
- 		 * Huge pmds need quiescing operations, they are
- 		 * always mapped.
- 		 */
- 		page_set_storage_key(paddr, key, 1);
- 		spin_unlock(ptl);
- 		return 0;
- 	}
- 	spin_unlock(ptl);
-=20
- 	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
- 	if (!ptep)
- 		goto again;
- 	new =3D old =3D pgste_get_lock(ptep);
- 	new =3D clear_pgste_bit(new, PGSTE_GR_BIT | PGSTE_GC_BIT |
- 				   PGSTE_ACC_BITS | PGSTE_FP_BIT);
- 	keyul =3D (unsigned long) key;
- 	new =3D set_pgste_bit(new, (keyul & (_PAGE_CHANGED | _PAGE_REFERENCED)) =
<< 48);
- 	new =3D set_pgste_bit(new, (keyul & (_PAGE_ACC_BITS | _PAGE_FP_BIT)) << =
56);
- 	if (!(pte_val(*ptep) & _PAGE_INVALID)) {
- 		unsigned long bits, skey;
-=20
- 		paddr =3D pte_val(*ptep) & PAGE_MASK;
- 		skey =3D (unsigned long) page_get_storage_key(paddr);
- 		bits =3D skey & (_PAGE_CHANGED | _PAGE_REFERENCED);
- 		skey =3D key & (_PAGE_ACC_BITS | _PAGE_FP_BIT);
- 		/* Set storage key ACC and FP */
- 		page_set_storage_key(paddr, skey, !nq);
- 		/* Merge host changed & referenced into pgste  */
- 		new =3D set_pgste_bit(new, bits << 52);
- 	}
- 	/* changing the guest storage key is considered a change of the page */
- 	if ((pgste_val(new) ^ pgste_val(old)) &
- 	    (PGSTE_ACC_BITS | PGSTE_FP_BIT | PGSTE_GR_BIT | PGSTE_GC_BIT))
- 		new =3D set_pgste_bit(new, PGSTE_UC_BIT);
-=20
- 	pgste_set_unlock(ptep, new);
- 	pte_unmap_unlock(ptep, ptl);
- 	return 0;
- }
- EXPORT_SYMBOL(set_guest_storage_key);
-=20
- /*
-  * Conditionally set a guest storage key (handling csske).
-  * oldkey will be updated when either mr or mc is set and a pointer is gi=
ven.
-  *
-  * Returns 0 if a guests storage key update wasn't necessary, 1 if the gu=
est
-  * storage key was updated and -EFAULT on access errors.
-  */
- int cond_set_guest_storage_key(struct mm_struct *mm, unsigned long addr,
- 			       unsigned char key, unsigned char *oldkey,
- 			       bool nq, bool mr, bool mc)
- {
- 	unsigned char tmp, mask =3D _PAGE_ACC_BITS | _PAGE_FP_BIT;
- 	int rc;
-=20
- 	/* we can drop the pgste lock between getting and setting the key */
- 	if (mr | mc) {
- 		rc =3D get_guest_storage_key(current->mm, addr, &tmp);
- 		if (rc)
- 			return rc;
- 		if (oldkey)
- 			*oldkey =3D tmp;
- 		if (!mr)
- 			mask |=3D _PAGE_REFERENCED;
- 		if (!mc)
- 			mask |=3D _PAGE_CHANGED;
- 		if (!((tmp ^ key) & mask))
- 			return 0;
- 	}
- 	rc =3D set_guest_storage_key(current->mm, addr, key, nq);
- 	return rc < 0 ? rc : 1;
- }
- EXPORT_SYMBOL(cond_set_guest_storage_key);
-=20
- /*
-  * Reset a guest reference bit (rrbe), returning the reference and change=
d bit.
-  *
-  * Returns < 0 in case of error, otherwise the cc to be reported to the g=
uest.
-  */
- int reset_guest_reference_bit(struct mm_struct *mm, unsigned long addr)
- {
- 	spinlock_t *ptl;
- 	unsigned long paddr;
- 	pgste_t old, new;
- 	pmd_t *pmdp;
- 	pte_t *ptep;
- 	int cc =3D 0;
-=20
- 	/*
- 	 * If we don't have a PTE table and if there is no huge page mapped,
- 	 * the storage key is 0 and there is nothing for us to do.
- 	 */
- 	switch (pmd_lookup(mm, addr, &pmdp)) {
- 	case -ENOENT:
- 		return 0;
- 	case 0:
- 		break;
- 	default:
- 		return -EFAULT;
- 	}
- again:
- 	ptl =3D pmd_lock(mm, pmdp);
- 	if (!pmd_present(*pmdp)) {
- 		spin_unlock(ptl);
- 		return 0;
- 	}
-=20
- 	if (pmd_leaf(*pmdp)) {
- 		paddr =3D pmd_val(*pmdp) & HPAGE_MASK;
- 		paddr |=3D addr & ~HPAGE_MASK;
- 		cc =3D page_reset_referenced(paddr);
- 		spin_unlock(ptl);
- 		return cc;
- 	}
- 	spin_unlock(ptl);
-=20
- 	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
- 	if (!ptep)
- 		goto again;
- 	new =3D old =3D pgste_get_lock(ptep);
- 	/* Reset guest reference bit only */
- 	new =3D clear_pgste_bit(new, PGSTE_GR_BIT);
-=20
- 	if (!(pte_val(*ptep) & _PAGE_INVALID)) {
- 		paddr =3D pte_val(*ptep) & PAGE_MASK;
- 		cc =3D page_reset_referenced(paddr);
- 		/* Merge real referenced bit into host-set */
- 		new =3D set_pgste_bit(new, ((unsigned long)cc << 53) & PGSTE_HR_BIT);
- 	}
- 	/* Reflect guest's logical view, not physical */
- 	cc |=3D (pgste_val(old) & (PGSTE_GR_BIT | PGSTE_GC_BIT)) >> 49;
- 	/* Changing the guest storage key is considered a change of the page */
- 	if ((pgste_val(new) ^ pgste_val(old)) & PGSTE_GR_BIT)
- 		new =3D set_pgste_bit(new, PGSTE_UC_BIT);
-=20
- 	pgste_set_unlock(ptep, new);
- 	pte_unmap_unlock(ptep, ptl);
- 	return cc;
- }
- EXPORT_SYMBOL(reset_guest_reference_bit);
-=20
- int get_guest_storage_key(struct mm_struct *mm, unsigned long addr,
- 			  unsigned char *key)
- {
- 	unsigned long paddr;
- 	spinlock_t *ptl;
- 	pgste_t pgste;
- 	pmd_t *pmdp;
- 	pte_t *ptep;
-=20
- 	/*
- 	 * If we don't have a PTE table and if there is no huge page mapped,
- 	 * the storage key is 0.
- 	 */
- 	*key =3D 0;
-=20
- 	switch (pmd_lookup(mm, addr, &pmdp)) {
- 	case -ENOENT:
- 		return 0;
- 	case 0:
- 		break;
- 	default:
- 		return -EFAULT;
- 	}
- again:
- 	ptl =3D pmd_lock(mm, pmdp);
- 	if (!pmd_present(*pmdp)) {
- 		spin_unlock(ptl);
- 		return 0;
- 	}
-=20
- 	if (pmd_leaf(*pmdp)) {
- 		paddr =3D pmd_val(*pmdp) & HPAGE_MASK;
- 		paddr |=3D addr & ~HPAGE_MASK;
- 		*key =3D page_get_storage_key(paddr);
- 		spin_unlock(ptl);
- 		return 0;
- 	}
- 	spin_unlock(ptl);
-=20
- 	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
- 	if (!ptep)
- 		goto again;
- 	pgste =3D pgste_get_lock(ptep);
- 	*key =3D (pgste_val(pgste) & (PGSTE_ACC_BITS | PGSTE_FP_BIT)) >> 56;
- 	paddr =3D pte_val(*ptep) & PAGE_MASK;
- 	if (!(pte_val(*ptep) & _PAGE_INVALID))
- 		*key =3D page_get_storage_key(paddr);
- 	/* Reflect guest's logical view, not physical */
- 	*key |=3D (pgste_val(pgste) & (PGSTE_GR_BIT | PGSTE_GC_BIT)) >> 48;
- 	pgste_set_unlock(ptep, pgste);
- 	pte_unmap_unlock(ptep, ptl);
- 	return 0;
- }
- EXPORT_SYMBOL(get_guest_storage_key);
-=20
- /**
-  * pgste_perform_essa - perform ESSA actions on the PGSTE.
-  * @mm: the memory context. It must have PGSTEs, no check is performed he=
re!
-  * @hva: the host virtual address of the page whose PGSTE is to be proces=
sed
-  * @orc: the specific action to perform, see the ESSA_SET_* macros.
-  * @oldpte: the PTE will be saved there if the pointer is not NULL.
-  * @oldpgste: the old PGSTE will be saved there if the pointer is not NUL=
L.
-  *
-  * Return: 1 if the page is to be added to the CBRL, otherwise 0,
-  *	   or < 0 in case of error. -EINVAL is returned for invalid values
-  *	   of orc, -EFAULT for invalid addresses.
-  */
- int pgste_perform_essa(struct mm_struct *mm, unsigned long hva, int orc,
- 			unsigned long *oldpte, unsigned long *oldpgste)
- {
- 	struct vm_area_struct *vma;
- 	unsigned long pgstev;
- 	spinlock_t *ptl;
- 	pgste_t pgste;
- 	pte_t *ptep;
- 	int res =3D 0;
-=20
- 	WARN_ON_ONCE(orc > ESSA_MAX);
- 	if (unlikely(orc > ESSA_MAX))
- 		return -EINVAL;
-=20
- 	vma =3D vma_lookup(mm, hva);
- 	if (!vma || is_vm_hugetlb_page(vma))
- 		return -EFAULT;
- 	ptep =3D get_locked_pte(mm, hva, &ptl);
- 	if (unlikely(!ptep))
- 		return -EFAULT;
- 	pgste =3D pgste_get_lock(ptep);
- 	pgstev =3D pgste_val(pgste);
- 	if (oldpte)
- 		*oldpte =3D pte_val(*ptep);
- 	if (oldpgste)
- 		*oldpgste =3D pgstev;
-=20
- 	switch (orc) {
- 	case ESSA_GET_STATE:
- 		break;
- 	case ESSA_SET_STABLE:
- 		pgstev &=3D ~(_PGSTE_GPS_USAGE_MASK | _PGSTE_GPS_NODAT);
- 		pgstev |=3D _PGSTE_GPS_USAGE_STABLE;
- 		break;
- 	case ESSA_SET_UNUSED:
- 		pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 		pgstev |=3D _PGSTE_GPS_USAGE_UNUSED;
- 		if (pte_val(*ptep) & _PAGE_INVALID)
- 			res =3D 1;
- 		break;
- 	case ESSA_SET_VOLATILE:
- 		pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 		pgstev |=3D _PGSTE_GPS_USAGE_VOLATILE;
- 		if (pte_val(*ptep) & _PAGE_INVALID)
- 			res =3D 1;
- 		break;
- 	case ESSA_SET_POT_VOLATILE:
- 		pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 		if (!(pte_val(*ptep) & _PAGE_INVALID)) {
- 			pgstev |=3D _PGSTE_GPS_USAGE_POT_VOLATILE;
- 			break;
- 		}
- 		if (pgstev & _PGSTE_GPS_ZERO) {
- 			pgstev |=3D _PGSTE_GPS_USAGE_VOLATILE;
- 			break;
- 		}
- 		if (!(pgstev & PGSTE_GC_BIT)) {
- 			pgstev |=3D _PGSTE_GPS_USAGE_VOLATILE;
- 			res =3D 1;
- 			break;
- 		}
- 		break;
- 	case ESSA_SET_STABLE_RESIDENT:
- 		pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 		pgstev |=3D _PGSTE_GPS_USAGE_STABLE;
- 		/*
- 		 * Since the resident state can go away any time after this
- 		 * call, we will not make this page resident. We can revisit
- 		 * this decision if a guest will ever start using this.
- 		 */
- 		break;
- 	case ESSA_SET_STABLE_IF_RESIDENT:
- 		if (!(pte_val(*ptep) & _PAGE_INVALID)) {
- 			pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 			pgstev |=3D _PGSTE_GPS_USAGE_STABLE;
- 		}
- 		break;
- 	case ESSA_SET_STABLE_NODAT:
- 		pgstev &=3D ~_PGSTE_GPS_USAGE_MASK;
- 		pgstev |=3D _PGSTE_GPS_USAGE_STABLE | _PGSTE_GPS_NODAT;
- 		break;
- 	default:
- 		/* we should never get here! */
- 		break;
- 	}
- 	/* If we are discarding a page, set it to logical zero */
- 	if (res)
- 		pgstev |=3D _PGSTE_GPS_ZERO;
-=20
- 	pgste =3D __pgste(pgstev);
- 	pgste_set_unlock(ptep, pgste);
- 	pte_unmap_unlock(ptep, ptl);
- 	return res;
- }
- EXPORT_SYMBOL(pgste_perform_essa);
-=20
- /**
-  * set_pgste_bits - set specific PGSTE bits.
-  * @mm: the memory context. It must have PGSTEs, no check is performed he=
re!
-  * @hva: the host virtual address of the page whose PGSTE is to be proces=
sed
-  * @bits: a bitmask representing the bits that will be touched
-  * @value: the values of the bits to be written. Only the bits in the mask
-  *	   will be written.
-  *
-  * Return: 0 on success, < 0 in case of error.
-  */
- int set_pgste_bits(struct mm_struct *mm, unsigned long hva,
- 			unsigned long bits, unsigned long value)
- {
- 	struct vm_area_struct *vma;
- 	spinlock_t *ptl;
- 	pgste_t new;
- 	pte_t *ptep;
-=20
- 	vma =3D vma_lookup(mm, hva);
- 	if (!vma || is_vm_hugetlb_page(vma))
- 		return -EFAULT;
- 	ptep =3D get_locked_pte(mm, hva, &ptl);
- 	if (unlikely(!ptep))
- 		return -EFAULT;
- 	new =3D pgste_get_lock(ptep);
-=20
- 	new =3D clear_pgste_bit(new, bits);
- 	new =3D set_pgste_bit(new, value & bits);
-=20
- 	pgste_set_unlock(ptep, new);
- 	pte_unmap_unlock(ptep, ptl);
- 	return 0;
- }
- EXPORT_SYMBOL(set_pgste_bits);
-=20
- /**
-  * get_pgste - get the current PGSTE for the given address.
-  * @mm: the memory context. It must have PGSTEs, no check is performed he=
re!
-  * @hva: the host virtual address of the page whose PGSTE is to be proces=
sed
-  * @pgstep: will be written with the current PGSTE for the given address.
-  *
-  * Return: 0 on success, < 0 in case of error.
-  */
- int get_pgste(struct mm_struct *mm, unsigned long hva, unsigned long *pgs=
tep)
- {
- 	struct vm_area_struct *vma;
- 	spinlock_t *ptl;
- 	pte_t *ptep;
-=20
- 	vma =3D vma_lookup(mm, hva);
- 	if (!vma || is_vm_hugetlb_page(vma))
- 		return -EFAULT;
- 	ptep =3D get_locked_pte(mm, hva, &ptl);
- 	if (unlikely(!ptep))
- 		return -EFAULT;
- 	*pgstep =3D pgste_val(pgste_get(ptep));
- 	pte_unmap_unlock(ptep, ptl);
- 	return 0;
- }
- EXPORT_SYMBOL(get_pgste);
- #endif

--47PsE2kcZ0lg2e9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmElVEACgkQJNaLcl1U
h9DjZAf+O81aAbzbfiBPq1s006ihlrjHT1is3aao+cKfUg6UC7d2DjsVUU18Vmah
Um+FcRssuM075KmH5t2B6moWnkb9JcsTPzGnK2AtRnBtsBqwngAxph0vfLlM+YMB
Q9Ba0i1KUxqbJkwMDV0b03ru1L45ozK7N5C4qaYlAbJQkbmzan/0pMWTgL8FXnqR
dOE4osgNGjh67GWWgSv+P8Fcxjm+/QD6QEpLr8mYWIeSc6+bkPxMKswStJlTOnLl
GCY+rBraE0c3avIUy28Jxc7usKX5kWp3Lbbzgy09dbD/9E94ySu3yr+0K7Vz4OyX
EB19Bhn2C+CuYub1a0ju6G+YRkH7Ww==
=6qVx
-----END PGP SIGNATURE-----

--47PsE2kcZ0lg2e9n--
