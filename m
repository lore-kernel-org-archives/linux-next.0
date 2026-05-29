Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12673624C9;
	Fri, 29 May 2026 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095473; cv=none; b=V8XydSfYlHb3mN0SCOaCxO+y8tQAFgC5CuvzXflNfbgB0VPUDpr5k6W16L0Zg/sZ1ZLGrdn/vpkdM1jYCKeq1lr1z880LBqgxoDc6wsMV1GJErxXU7UsXcqpkvUP6NAzsGKOTcOsYaKzn+iUqkP0HxOlxQP85RekiLlS6zaM/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095473; c=relaxed/simple;
	bh=qgDU2wU5kP6IlWNK/L5eMhycAAR9T/2AUlc0wVn9EZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irXecHwdU/hfaBY6Ffw+uQQ0ICRqyfo0itoi3pMwXabe2+xyGh5OWLO6O7CRtkvMpC60EDUBpp4mbb5/sA6h+rB9VuY/wZyZjyYwlYD2JAv74RhalyfLLRW+tcnXw9GZSXSokqGp0P2zwFT5fxSJ7crgQjmenPEhKKImdLdpFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtiYwnwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtiYwnwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302B91F00899;
	Fri, 29 May 2026 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780095472;
	bh=kpLpAraxQqXFsbun0c3mQ4hsCaMtmiHbPYWj0R0Od+4=;
	h=Date:From:To:Cc:Subject;
	b=PtiYwnwa2zY+El8r2ut32QWwCnkL+KnW3XvPAxcLJgcVQNT98PIFLBcvQlaJvNpja
	 sNzwiB2gziiWFEVUqD9OxZ/OVWe79FRg6rq791Du0r03ad1/wS0KT6T1A6Ritiv4th
	 +wzSapHgSyl2R7Emu8pa20ug0HZ8twBF2IgJycCgPasLRC4YEkt0regKhXS8vpBNY1
	 yj87mWgZOoTzDEQa9qT/PLEf5VlHkcpjkDoIfe/6Dz4RZSQP7G6aaL/nINcW30AlGY
	 Mv8f8n8jQb0ubjSzdr4clH1yPPbrSQgOzQERDED+fPUfZRMhLlQls02Pa7RWyATxL4
	 NEbTvWSBFpVKw==
Date: Fri, 29 May 2026 23:57:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the slab tree with the drm-misc tree
Message-ID: <ahoZ7OCzxTAbGMtO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/FySevHECwqnBuk5"
Content-Disposition: inline


--/FySevHECwqnBuk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  drivers/gpu/drm/panthor/panthor_mmu.c

between commit:

  1013bf53650ec ("drm/panthor: Split panthor_vm_prepare_map_op_ctx() to pre=
pare for reclaim")

=66rom the drm-misc tree and commit:

  90720e61fb737 ("mm/slab: improve kmem_cache_alloc_bulk")

=66rom the slab tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/panthor/panthor_mmu.c
index 9d45008505619,b12c641af46c8..0000000000000
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@@ -1235,44 -1180,6 +1235,45 @@@ panthor_vm_op_ctx_prealloc_vmas(struct=20
  	return 0;
  }
 =20
 +static void panthor_vm_init_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 +				   u64 size, u64 va, u32 flags)
 +{
 +	memset(op_ctx, 0, sizeof(*op_ctx));
 +	op_ctx->flags =3D flags;
 +	op_ctx->va.range =3D size;
 +	op_ctx->va.addr =3D va;
 +}
 +
 +static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ct=
x)
 +{
 +	u64 size =3D op_ctx->va.range;
 +	u64 va =3D op_ctx->va.addr;
- 	int ret;
 +
 +	/* L1, L2 and L3 page tables.
 +	 * We could optimize L3 allocation by iterating over the sgt and merging
 +	 * 2M contiguous blocks, but it's simpler to over-provision and return
 +	 * the pages if they're not used.
 +	 */
 +	u64 pt_count =3D ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull <<=
 39)) >> 39) +
 +		       ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> =
30) +
 +		       ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> =
21);
 +
 +	op_ctx->rsvd_page_tables.pages =3D kzalloc_objs(*op_ctx->rsvd_page_table=
s.pages,
 +						      pt_count);
 +	if (!op_ctx->rsvd_page_tables.pages)
 +		return -ENOMEM;
 +
- 	ret =3D kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
- 				    op_ctx->rsvd_page_tables.pages);
- 	op_ctx->rsvd_page_tables.count =3D ret;
- 	if (ret !=3D pt_count)
++	if (!kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
++			op_ctx->rsvd_page_tables.pages)) {
++		op_ctx->rsvd_page_tables.count =3D 0;
 +		return -ENOMEM;
++	}
++	op_ctx->rsvd_page_tables.count =3D pt_count;
 +
 +	return 0;
 +}
 +
  #define PANTHOR_VM_BIND_OP_MAP_FLAGS \
  	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
  	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \

--/FySevHECwqnBuk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaGesACgkQJNaLcl1U
h9C2PAf/W6bFYPplUDpXT588DDTYaEdXWU9d2q5tShkA4Ju5a32p+E82FM3yWgGe
58vJ8+hCOAl02xRQE8A3UZvGQKf+v/bu/cF2ZYlBaMvhFK+SXKcJLDhOEuiFeEka
66InrDxmLdolHqKA6C6PiWImUO+9cLpJ40wgBXCQl8wUQl5D5YGkjL70JYHHj2lk
R94geMYM6HT8vbkayvNlNx+t2GVSw+4+GQ7JzGykP1OgmL/jNvme9E9mOY6BaBDv
9bVJvQpPkt087aVlflbf0EC0VpfQSbL7WHNY7OGtFbUvyLdZfI9rmU9e/yreF0u/
/iEmdvGoj6Al4hanMg/3KvoP2H8Pew==
=3lDq
-----END PGP SIGNATURE-----

--/FySevHECwqnBuk5--
