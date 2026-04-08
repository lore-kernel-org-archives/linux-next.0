Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E126E165;
	Wed,  8 Apr 2026 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662311; cv=none; b=a126q2TqNk0VNNurYe1dgK8QgsoolWZhnExULX8/fe6Av59dN/3oQ0o3SYkbgZQFuw6t/R3eEMm/yvAgTWfzEfgq+ulU4fjxp6JDtDbKu8+VZgJoiepqLFGfPJT4U/5gTit4fgD3b5i6NrOo/qVAczrBCTllrDvzUKCBQa4AaQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662311; c=relaxed/simple;
	bh=4b7tFqefXT4X/Eedo0x31pT88yhA8TxFq/Ben5zkgNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLBwy4W4hZh3LLUbN4Y/82b4vfrdXcRYa2F37UuYu7PFVbJUzHjHJjD/oCa/GNEKbzvvoy6e7TZQakBiTeoW5w6D4yUd9zxugb4zVbshChLcWiTKZPCBO0oASPyjyF1FyyLoGe1qRWfFOMlvGIIJIBWlROVcdeblXOjEbkUQS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9pIGWdW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9pIGWdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7013FC19421;
	Wed,  8 Apr 2026 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775662310;
	bh=4b7tFqefXT4X/Eedo0x31pT88yhA8TxFq/Ben5zkgNU=;
	h=Date:From:To:Cc:Subject:From;
	b=A9pIGWdWqzGGRTfuU6KwTqHc/MkrNWzt2LzUj7sQ++UmmKnCD60sVOdAWmlGAeYXY
	 dhgjFjas4IuwAznyXMmYaDTyL0WeRCcHtzLtbicN2em8aHuLuk5W043rTtAk8s+EId
	 hx7jB1qg2jqhcsFNpfstE5g2f28hXhbECF6OubKGyxt2gNx608iv8ksDwzim37+CvM
	 SnEEtvgCXE+qeP3ArJJuI9MmuB/AOOqsxv4ftzuTo4Pmw2qTEwI8Ow0IUkPiXRrSrj
	 g6JDHeoZRexDNqPFarkZlIO7vvdSPW5M33mkZObL9lSHLrH/leENJC4jiaoIJ2Zcme
	 B1fCzaz4PPR9w==
Date: Wed, 8 Apr 2026 16:31:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvms390 tree with the origin tree
Message-ID: <adZ04hmcjflLOMNU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cju2nsGhHPlOZ7BS"
Content-Disposition: inline


--Cju2nsGhHPlOZ7BS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/kvm/gmap.c

between commit:

  45921d0212d4a ("KVM: s390: Fix gmap_link()")

=66rom the origin tree and commit:

  4204067f99820 ("KVM: s390: Add alignment checks for hugepages")

=66rom the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/kvm/gmap.c
index 57802cb8af8e4,e3c1b070a11dc..0000000000000
--- a/arch/s390/kvm/gmap.c
+++ b/arch/s390/kvm/gmap.c
@@@ -623,78 -619,48 +624,97 @@@ static inline bool gmap_2g_allowed(stru
  	return false;
  }
 =20
- static inline bool gmap_1m_allowed(struct gmap *gmap, gfn_t gfn)
+ /**
+  * gmap_1m_allowed() - Check whether a 1M hugepage is allowed.
+  * @gmap: The gmap of the guest.
+  * @f: Describes the fault that is being resolved.
+  * @slot: The memslot the faulting address belongs to.
+  *
+  * The function checks whether the GMAP_FLAG_ALLOW_HPAGE_1M flag is set f=
or
+  * @gmap, whether the offset of the address in the 1M virtual frame is the
+  * same as the offset in the physical 1M frame, and finally whether the w=
hole
+  * 1M page would fit in the given memslot.
+  *
+  * Return: true if a 1M hugepage is allowed to back the faulting address,=
 false
+  *         otherwise.
+  */
+ static inline bool gmap_1m_allowed(struct gmap *gmap, struct guest_fault =
*f,
+ 				   struct kvm_memory_slot *slot)
  {
- 	return test_bit(GMAP_FLAG_ALLOW_HPAGE_1M, &gmap->flags);
+ 	return test_bit(GMAP_FLAG_ALLOW_HPAGE_1M, &gmap->flags) &&
+ 	       !((f->gfn ^ f->pfn) & ~_SEGMENT_FR_MASK) &&
+ 	       slot->base_gfn <=3D ALIGN_DOWN(f->gfn, _PAGES_PER_SEGMENT) &&
+ 	       slot->base_gfn + slot->npages >=3D ALIGN(f->gfn + 1, _PAGES_PER_S=
EGMENT);
  }
 =20
 +static int _gmap_link(struct kvm_s390_mmu_cache *mc, struct gmap *gmap, i=
nt level,
 +		      struct guest_fault *f)
 +{
 +	union crste oldval, newval;
 +	union pte newpte, oldpte;
 +	union pgste pgste;
 +	int rc =3D 0;
 +
 +	rc =3D dat_entry_walk(mc, f->gfn, gmap->asce, DAT_WALK_ALLOC_CONTINUE, l=
evel,
 +			    &f->crstep, &f->ptep);
 +	if (rc =3D=3D -ENOMEM)
 +		return rc;
 +	if (KVM_BUG_ON(rc =3D=3D -EINVAL, gmap->kvm))
 +		return rc;
 +	if (rc)
 +		return -EAGAIN;
 +	if (KVM_BUG_ON(get_level(f->crstep, f->ptep) > level, gmap->kvm))
 +		return -EINVAL;
 +
 +	if (f->ptep) {
 +		pgste =3D pgste_get_lock(f->ptep);
 +		oldpte =3D *f->ptep;
 +		newpte =3D _pte(f->pfn, f->writable, f->write_attempt | oldpte.s.d, !f-=
>page);
 +		newpte.s.sd =3D oldpte.s.sd;
 +		oldpte.s.sd =3D 0;
 +		if (oldpte.val =3D=3D _PTE_EMPTY.val || oldpte.h.pfra =3D=3D f->pfn) {
 +			pgste =3D gmap_ptep_xchg(gmap, f->ptep, newpte, pgste, f->gfn);
 +			if (f->callback)
 +				f->callback(f);
 +		} else {
 +			rc =3D -EAGAIN;
 +		}
 +		pgste_set_unlock(f->ptep, pgste);
 +	} else {
 +		do {
 +			oldval =3D READ_ONCE(*f->crstep);
 +			newval =3D _crste_fc1(f->pfn, oldval.h.tt, f->writable,
 +					    f->write_attempt | oldval.s.fc1.d);
 +			newval.s.fc1.s =3D !f->page;
 +			newval.s.fc1.sd =3D oldval.s.fc1.sd;
 +			if (oldval.val !=3D _CRSTE_EMPTY(oldval.h.tt).val &&
 +			    crste_origin_large(oldval) !=3D crste_origin_large(newval))
 +				return -EAGAIN;
 +		} while (!gmap_crstep_xchg_atomic(gmap, f->crstep, oldval, newval, f->g=
fn));
 +		if (f->callback)
 +			f->callback(f);
 +	}
 +
 +	return rc;
 +}
 +
- int gmap_link(struct kvm_s390_mmu_cache *mc, struct gmap *gmap, struct gu=
est_fault *f)
+ int gmap_link(struct kvm_s390_mmu_cache *mc, struct gmap *gmap, struct gu=
est_fault *f,
+ 	      struct kvm_memory_slot *slot)
  {
  	unsigned int order;
 -	int rc, level;
 +	int level;
 =20
  	lockdep_assert_held(&gmap->kvm->mmu_lock);
 =20
  	level =3D TABLE_TYPE_PAGE_TABLE;
  	if (f->page) {
  		order =3D folio_order(page_folio(f->page));
- 		if (order >=3D get_order(_REGION3_SIZE) && gmap_2g_allowed(gmap, f->gfn=
))
+ 		if (order >=3D get_order(_REGION3_SIZE) && gmap_2g_allowed(gmap, f, slo=
t))
  			level =3D TABLE_TYPE_REGION3;
- 		else if (order >=3D get_order(_SEGMENT_SIZE) && gmap_1m_allowed(gmap, f=
->gfn))
+ 		else if (order >=3D get_order(_SEGMENT_SIZE) && gmap_1m_allowed(gmap, f=
, slot))
  			level =3D TABLE_TYPE_SEGMENT;
  	}
 -	rc =3D dat_link(mc, gmap->asce, level, uses_skeys(gmap), f);
 -	KVM_BUG_ON(rc =3D=3D -EINVAL, gmap->kvm);
 -	return rc;
 +	return _gmap_link(mc, gmap, level, f);
  }
 =20
  static int gmap_ucas_map_one(struct kvm_s390_mmu_cache *mc, struct gmap *=
gmap,

--Cju2nsGhHPlOZ7BS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWdOIACgkQJNaLcl1U
h9DLpQf/V2gjiPcOS4CVbP9DIfqAZpk0PvABuOW2+s39Tb6V72n3Z7qLwibpR2+G
j0hr5ftiV8fEGI6jqgIuohDXGk8yU03c82+vSmYSLV5cJMzb/4T6Ac1+Nu0wr4Fw
Wl5Elg4LQqzuvnzsFiQosRMAlToeU0Sb0CMcDW+CU+5Uol1ywZBpRwAALYqktkxB
Cnb/SdtBum7+rAwQOq8ZAQBidJGtJEzFwLsPsqoa2nCfo1YnwTR8g/kSJA13fh6C
2fHHDOmrYnS7LrGRNU5DMI+vnIjkcj8UXXXyAR7lIShzFYYpqnNSG1O5Y/gNF6oO
GI+LXesvTLg4sofg+LDSOd697Ew1eA==
=cZP+
-----END PGP SIGNATURE-----

--Cju2nsGhHPlOZ7BS--
