From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 2 Feb 2015 16:03:02 +1100
Message-ID: <20150202160302.0f50babf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c1vmr63YSgg3tvXZrDREXMy"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38904 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750699AbbBBFDL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2015 00:03:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>, Mario Smarduch <m.smarduch@samsung.com>

--Sig_/c1vmr63YSgg3tvXZrDREXMy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/arm/kvm/mmu.c between commits 363ef89f8e9b ("arm/arm64: KVM:
Invalidate data cache on unmap") and 0d3e4d4fade6 ("arm/arm64: KVM: Use
kernel mapping to perform invalidation on page fault") from Linus' tree
and commits c64735554c0a ("KVM: arm: Add initial dirty page locking
support"), 53c810c364d7 ("KVM: arm: dirty logging write protect
support") and 15a49a44fc36 ("KVM: arm: page logging 2nd stage fault
handling") from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

P.S. commits c64735554c0a, 53c810c364d7 and 15a49a44fc36 have no
signed-off-by from their committer (Christoffer Dall).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kvm/mmu.c
index 136662547ca6,74aeabaa3c4d..000000000000
--- a/arch/arm/kvm/mmu.c
+++ b/arch/arm/kvm/mmu.c
@@@ -58,26 -78,25 +78,45 @@@ static void kvm_tlb_flush_vmid_ipa(stru
  		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, kvm, ipa);
  }
 =20
 +/*
 + * D-Cache management functions. They take the page table entries by
 + * value, as they are flushing the cache using the kernel mapping (or
 + * kmap on 32bit).
 + */
 +static void kvm_flush_dcache_pte(pte_t pte)
 +{
 +	__kvm_flush_dcache_pte(pte);
 +}
 +
 +static void kvm_flush_dcache_pmd(pmd_t pmd)
 +{
 +	__kvm_flush_dcache_pmd(pmd);
 +}
 +
 +static void kvm_flush_dcache_pud(pud_t pud)
 +{
 +	__kvm_flush_dcache_pud(pud);
 +}
 +
+ /**
+  * stage2_dissolve_pmd() - clear and flush huge PMD entry
+  * @kvm:	pointer to kvm structure.
+  * @addr:	IPA
+  * @pmd:	pmd pointer for IPA
+  *
+  * Function clears a PMD entry, flushes addr 1st and 2nd stage TLBs. Mark=
s all
+  * pages in the range dirty.
+  */
+ static void stage2_dissolve_pmd(struct kvm *kvm, phys_addr_t addr, pmd_t =
*pmd)
+ {
+ 	if (!kvm_pmd_huge(*pmd))
+ 		return;
+=20
+ 	pmd_clear(pmd);
+ 	kvm_tlb_flush_vmid_ipa(kvm, addr);
+ 	put_page(virt_to_page(pmd));
+ }
+=20
  static int mmu_topup_memory_cache(struct kvm_mmu_memory_cache *cache,
  				  int min, int max)
  {
@@@ -957,12 -957,151 +1009,157 @@@ static bool kvm_is_device_pfn(unsigned=20
  	return !pfn_valid(pfn);
  }
 =20
 +static void coherent_cache_guest_page(struct kvm_vcpu *vcpu, pfn_t pfn,
 +				      unsigned long size, bool uncached)
 +{
 +	__coherent_cache_guest_page(vcpu, pfn, size, uncached);
 +}
 +
+ /**
+  * stage2_wp_ptes - write protect PMD range
+  * @pmd:	pointer to pmd entry
+  * @addr:	range start address
+  * @end:	range end address
+  */
+ static void stage2_wp_ptes(pmd_t *pmd, phys_addr_t addr, phys_addr_t end)
+ {
+ 	pte_t *pte;
+=20
+ 	pte =3D pte_offset_kernel(pmd, addr);
+ 	do {
+ 		if (!pte_none(*pte)) {
+ 			if (!kvm_s2pte_readonly(pte))
+ 				kvm_set_s2pte_readonly(pte);
+ 		}
+ 	} while (pte++, addr +=3D PAGE_SIZE, addr !=3D end);
+ }
+=20
+ /**
+  * stage2_wp_pmds - write protect PUD range
+  * @pud:	pointer to pud entry
+  * @addr:	range start address
+  * @end:	range end address
+  */
+ static void stage2_wp_pmds(pud_t *pud, phys_addr_t addr, phys_addr_t end)
+ {
+ 	pmd_t *pmd;
+ 	phys_addr_t next;
+=20
+ 	pmd =3D pmd_offset(pud, addr);
+=20
+ 	do {
+ 		next =3D kvm_pmd_addr_end(addr, end);
+ 		if (!pmd_none(*pmd)) {
+ 			if (kvm_pmd_huge(*pmd)) {
+ 				if (!kvm_s2pmd_readonly(pmd))
+ 					kvm_set_s2pmd_readonly(pmd);
+ 			} else {
+ 				stage2_wp_ptes(pmd, addr, next);
+ 			}
+ 		}
+ 	} while (pmd++, addr =3D next, addr !=3D end);
+ }
+=20
+ /**
+   * stage2_wp_puds - write protect PGD range
+   * @pgd:	pointer to pgd entry
+   * @addr:	range start address
+   * @end:	range end address
+   *
+   * Process PUD entries, for a huge PUD we cause a panic.
+   */
+ static void  stage2_wp_puds(pgd_t *pgd, phys_addr_t addr, phys_addr_t end)
+ {
+ 	pud_t *pud;
+ 	phys_addr_t next;
+=20
+ 	pud =3D pud_offset(pgd, addr);
+ 	do {
+ 		next =3D kvm_pud_addr_end(addr, end);
+ 		if (!pud_none(*pud)) {
+ 			/* TODO:PUD not supported, revisit later if supported */
+ 			BUG_ON(kvm_pud_huge(*pud));
+ 			stage2_wp_pmds(pud, addr, next);
+ 		}
+ 	} while (pud++, addr =3D next, addr !=3D end);
+ }
+=20
+ /**
+  * stage2_wp_range() - write protect stage2 memory region range
+  * @kvm:	The KVM pointer
+  * @addr:	Start address of range
+  * @end:	End address of range
+  */
+ static void stage2_wp_range(struct kvm *kvm, phys_addr_t addr, phys_addr_=
t end)
+ {
+ 	pgd_t *pgd;
+ 	phys_addr_t next;
+=20
+ 	pgd =3D kvm->arch.pgd + pgd_index(addr);
+ 	do {
+ 		/*
+ 		 * Release kvm_mmu_lock periodically if the memory region is
+ 		 * large. Otherwise, we may see kernel panics with
+ 		 * CONFIG_DETECT_HUNG_TASK, CONFIG_LOCKUP_DETECTOR,
+ 		 * CONFIG_LOCKDEP. Additionally, holding the lock too long
+ 		 * will also starve other vCPUs.
+ 		 */
+ 		if (need_resched() || spin_needbreak(&kvm->mmu_lock))
+ 			cond_resched_lock(&kvm->mmu_lock);
+=20
+ 		next =3D kvm_pgd_addr_end(addr, end);
+ 		if (pgd_present(*pgd))
+ 			stage2_wp_puds(pgd, addr, next);
+ 	} while (pgd++, addr =3D next, addr !=3D end);
+ }
+=20
+ /**
+  * kvm_mmu_wp_memory_region() - write protect stage 2 entries for memory =
slot
+  * @kvm:	The KVM pointer
+  * @slot:	The memory slot to write protect
+  *
+  * Called to start logging dirty pages after memory region
+  * KVM_MEM_LOG_DIRTY_PAGES operation is called. After this function retur=
ns
+  * all present PMD and PTEs are write protected in the memory region.
+  * Afterwards read of dirty page log can be called.
+  *
+  * Acquires kvm_mmu_lock. Called with kvm->slots_lock mutex acquired,
+  * serializing operations for VM memory regions.
+  */
+ void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
+ {
+ 	struct kvm_memory_slot *memslot =3D id_to_memslot(kvm->memslots, slot);
+ 	phys_addr_t start =3D memslot->base_gfn << PAGE_SHIFT;
+ 	phys_addr_t end =3D (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
+=20
+ 	spin_lock(&kvm->mmu_lock);
+ 	stage2_wp_range(kvm, start, end);
+ 	spin_unlock(&kvm->mmu_lock);
+ 	kvm_flush_remote_tlbs(kvm);
+ }
+=20
+ /**
+  * kvm_arch_mmu_write_protect_pt_masked() - write protect dirty pages
+  * @kvm:	The KVM pointer
+  * @slot:	The memory slot associated with mask
+  * @gfn_offset:	The gfn offset in memory slot
+  * @mask:	The mask of dirty pages at offset 'gfn_offset' in this memory
+  *		slot to be write protected
+  *
+  * Walks bits set in mask write protects the associated pte's. Caller must
+  * acquire kvm_mmu_lock.
+  */
+ void kvm_arch_mmu_write_protect_pt_masked(struct kvm *kvm,
+ 		struct kvm_memory_slot *slot,
+ 		gfn_t gfn_offset, unsigned long mask)
+ {
+ 	phys_addr_t base_gfn =3D slot->base_gfn + gfn_offset;
+ 	phys_addr_t start =3D (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
+ 	phys_addr_t end =3D (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
+=20
+ 	stage2_wp_range(kvm, start, end);
+ }
+=20
  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  			  struct kvm_memory_slot *memslot, unsigned long hva,
  			  unsigned long fault_status)
@@@ -1059,13 -1220,13 +1277,12 @@@
  		if (writable) {
  			kvm_set_s2pte_writable(&new_pte);
  			kvm_set_pfn_dirty(pfn);
+ 			mark_page_dirty(kvm, gfn);
  		}
 -		coherent_cache_guest_page(vcpu, hva, PAGE_SIZE,
 -					  fault_ipa_uncached);
 +		coherent_cache_guest_page(vcpu, pfn, PAGE_SIZE, fault_ipa_uncached);
- 		ret =3D stage2_set_pte(kvm, memcache, fault_ipa, &new_pte,
- 			pgprot_val(mem_type) =3D=3D pgprot_val(PAGE_S2_DEVICE));
+ 		ret =3D stage2_set_pte(kvm, memcache, fault_ipa, &new_pte, flags);
  	}
 =20
-=20
  out_unlock:
  	spin_unlock(&kvm->mmu_lock);
  	kvm_release_pfn_clean(pfn);

--Sig_/c1vmr63YSgg3tvXZrDREXMy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUzwULAAoJEMDTa8Ir7ZwV714P/jkc0mlxDWkZ/2fQSpK0qyJM
fraEKmNDsebSC6BJHnAvviXHpuhnEJe2x1QWCDkII6NKBx9sgn78JpDCtUNVY5Sv
8THkIKTDgCDvzJJT4Rn3mh+zQSgu6IxFsQ1FZXlEJoYP7wVZyIedp708Q36quR6T
FcYok3ShHdRs4qo12JLekFCLAdWbdGrZmLl+Ob4/4a02Nsksk4nAs7xKX8xmlCLd
s96O08v6QuPI1glPGJEHNMbCocqFC8Zk8tiXVz4FFAaYOmM0FKkE5PHK9Q7CltzA
CGEv0544VBSXXN/kR6OM2zrDCpELZ2X+ozOa/UuoGDMmoOSygSlrHGgq3XGfGloJ
mmJ50Z9m0agLjlvSieZZL1RO0lQp5bEiqSr36pw5wu2jHx04uX1zIOBHxDGKqoCD
5E8tifXot4f3uNdqeVEfZ+TZSL6v2NdxCH2RtlnmF16reZAMO3oxcq5LCb6ugGki
0b7pvZM/k//hiVhKL8QUOAPtdpsH6IlUZqseSh2TTeT6s3/2MHq+evZ5taXn6hK+
BmPaYBCEQCaeMrFkrBxsdB39s0pSV94S34b3PVkW2zy6FMHeFyDxQjQONZaPffcs
2FmIrXZxLOKeDSF0STUAhEGlh2mdFhi7twagxk+nIgsNNQp6ewopKHcCshmhV7ys
Edb9mg5pcsH4CklTbEJm
=J8QO
-----END PGP SIGNATURE-----

--Sig_/c1vmr63YSgg3tvXZrDREXMy--
