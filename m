From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc-merge-mpe
 tree
Date: Fri, 24 Apr 2015 12:10:36 +1000
Message-ID: <20150424121036.55fabf0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jlzC.SkQG4xZc3Cg9AMVVy3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50183 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753167AbbDXCKn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2015 22:10:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>, Paul Mackerras <paulus@samba.org>

--Sig_/jlzC.SkQG4xZc3Cg9AMVVy3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/powerpc/kvm/book3s_hv_rm_mmu.c between commit dac565706791 ("KVM:
PPC: Remove page table walk helpers") from the powerpc-merge-mpe tree
and commit a4bd6eb07ca7 ("KVM: PPC: Book3S HV: Add helpers for
lock/unlock hpte") from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/kvm/book3s_hv_rm_mmu.c
index d839f08cb903,f6bf0b1de6d7..000000000000
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@@ -134,12 -131,25 +134,6 @@@ static void remove_revmap_chain(struct=20
  	unlock_rmap(rmap);
  }
 =20
- static inline void unlock_hpte(__be64 *hpte, unsigned long hpte_v)
 -static pte_t lookup_linux_pte_and_update(pgd_t *pgdir, unsigned long hva,
 -			      int writing, unsigned long *pte_sizep)
--{
- 	asm volatile(PPC_RELEASE_BARRIER "" : : : "memory");
- 	hpte[0] =3D cpu_to_be64(hpte_v);
 -	pte_t *ptep;
 -	unsigned long ps =3D *pte_sizep;
 -	unsigned int hugepage_shift;
 -
 -	ptep =3D find_linux_pte_or_hugepte(pgdir, hva, &hugepage_shift);
 -	if (!ptep)
 -		return __pte(0);
 -	if (hugepage_shift)
 -		*pte_sizep =3D 1ul << hugepage_shift;
 -	else
 -		*pte_sizep =3D PAGE_SIZE;
 -	if (ps > *pte_sizep)
 -		return __pte(0);
 -	return kvmppc_read_update_linux_pte(ptep, writing, hugepage_shift);
--}
--
  long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
  		       long pte_index, unsigned long pteh, unsigned long ptel,
  		       pgd_t *pgdir, bool realmode, unsigned long *pte_idx_ret)

--Sig_/jlzC.SkQG4xZc3Cg9AMVVy3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVOaYgAAoJEMDTa8Ir7ZwVUn4P/3r+jZZO/rToCkLUnY0519IJ
ombF+4XRSLZZalcO18oPF096vVQpczF7cr3Ojpur1GzR32tioUSOK8hSQh8uyMrU
NQbti/dsBK2eAitZLBx71plc+eiu/xAY9LyxsEMxO87z80LL3fZSDtOZ3KrAkrIl
8fKaHbvt9YjC5wjAX+m04TKD7epajNqcXEB1FCj1MoT/pyFQ9fBuAOTjcjIAW9Q+
snE5UbgSBOwDCvuao1BrY8oJABCAApr8cm0qt/UNwvXFJCszc4CvzBokmNWrxjai
M09xmxnVavS91ovp4Yh+CzLrLEPhWyKS8mzYlDA/fzq1dyf9uqkMYJrthBQUsx4s
qs7BY2MyUeQP//evlxVGngFwsKC0bMesVvBRVQAGBpE2mLqb+Qz5FltEDlT2YTAT
tujLWjkiaAqa4YCtiYoKOeEyWEK4FwbJdC35UpKr2GRsm9iMflrXuYU+3qv8oh+y
KTvW9/8lCxVS3xJ96/CTWUsY/GhQ4bDH45OFUBdiEuNoMjCIZML1Fh5ziQGqWCsb
yJgvlcgNreDYK8xf9SEkr9zCeG+omOgVxEPQARQaQHyR0bbaBlUpupG5IFuob6rJ
zOzIM41d1e+AILd3p3oThaQ5uORS6o072/MR1g4WI+e8NFIZXHE4EIiRuY2c+2CT
uV+tLIYrvZkC66zqCult
=Aqwa
-----END PGP SIGNATURE-----

--Sig_/jlzC.SkQG4xZc3Cg9AMVVy3--
