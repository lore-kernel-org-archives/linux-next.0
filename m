Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087933DB65A;
	Tue, 19 May 2026 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183151; cv=none; b=W7ln4PNP615ILVRJe4h7ipZyFckEKd/22p4nHIblN5/rPEvtRVAvqmwysl0rZs5ckrd7JsxmYDulu9Dromw4FxC3tfgYPkOUyVlnr7kHyRXWLcoErb7+wkNeeWOjRJPtZb4UlU2DqiEipanSyT1ekObp9CMkdc+kPuEt0sJ3KUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183151; c=relaxed/simple;
	bh=Dqi51q04Il936izENrB7jNYyDbPgLE4Yag6cprho0hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+xAwzAuNPXnfZD1UvNT0Qi+37UoGy2Kma8wAA7NImE1SHJ1FTJYc5r7hfM1by5TNIqQgAd0/N0bJthBWl96LpzH6QhSl4KjKe9ycoufrKQ+g10dKaW+hj09ieuSAu/MUEo79nYI4zrvW9y3ZAUAtaFcWFvZGV33Iv0yJFVGuZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBIMgctZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBIMgctZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FC0C2BCC6;
	Tue, 19 May 2026 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183150;
	bh=Dqi51q04Il936izENrB7jNYyDbPgLE4Yag6cprho0hI=;
	h=Date:From:To:Cc:Subject:From;
	b=HBIMgctZWZI0AOQxolpvzEmRL1vbzqZDsMX5xc23Yr9mi3RqRStCRxvNJQw2+ox/C
	 BQfZmchSXH/ppy/7wlrr//Lm0VR2mNWl9Ho3DXtnuLbwjuU3ksa4cUzwImOC4adIj5
	 /VAjVYstUadr6MCGeLT53pXXZxbc4P+ijwNURAljTTBAFBM7W6OeAyY7U5VIjP0BQr
	 AwiShoaxVWKF0WdR53+LK+Hcbqbxq1GFekbuOev36nITHP+Ma3Q7WakfJGPuOXPcs6
	 mNkWJXj9vRagubUuVZog8eOwsG7T/j7C2Me2wGq2wl6cWuGufULTClOQ6st92k+WHA
	 iC537RAgGj12A==
Date: Tue, 19 May 2026 10:32:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 origin tree
Message-ID: <agwuKp3CtmlA8t4n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cZUSTRKqZe7XQbTx"
Content-Disposition: inline


--cZUSTRKqZe7XQbTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/hugetlb_cma.c

between commits:

  8f5ce56b76303 ("mm/hugetlb_cma: round up per_node before logging it")
  4d33b7a0c04bf ("mm/hugetlb_cma: restrict hugetlb_cma parameter to giganti=
c-page alignment")

=66rom the origin tree and commit:

  2638c879e1082 ("mm/hugetlb_cma: round up per_node before logging it")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/hugetlb_cma.c
index 39344d6c78d84,7693ccefd0c64..0000000000000
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@@ -142,7 -142,7 +142,7 @@@ unsigned int __weak arch_hugetlb_cma_or
 =20
  void __init hugetlb_cma_reserve(void)
  {
 -	unsigned long size, reserved, per_node, order;
 +	unsigned long size, reserved, per_node, order, gigantic_page_size;
  	bool node_specific_cma_alloc =3D false;
  	int nid;
 =20
@@@ -162,36 -162,37 +162,36 @@@
  	 * breaking this assumption.
  	 */
  	VM_WARN_ON(order <=3D MAX_PAGE_ORDER);
 +	gigantic_page_size =3D PAGE_SIZE << order;
 =20
  	hugetlb_bootmem_set_nodes();
 =20
  	for (nid =3D 0; nid < MAX_NUMNODES; nid++) {
 -		if (hugetlb_cma_size_in_node[nid] =3D=3D 0)
 +		size =3D hugetlb_cma_size_in_node[nid];
 +		if (size =3D=3D 0)
  			continue;
 =20
  		if (!node_isset(nid, hugetlb_bootmem_nodes)) {
  			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
 -			hugetlb_cma_size -=3D hugetlb_cma_size_in_node[nid];
 -			hugetlb_cma_size_in_node[nid] =3D 0;
 +		} else if (!IS_ALIGNED(size, gigantic_page_size)) {
 +			pr_warn("hugetlb_cma: cma area of node %d must be a multiple of %lu Mi=
B\n",
 +				nid, gigantic_page_size / SZ_1M);
 +		} else {
 +			node_specific_cma_alloc =3D true;
  			continue;
  		}
 =20
 -		if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
 -			pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n=
",
 -				nid, (PAGE_SIZE << order) / SZ_1M);
 -			hugetlb_cma_size -=3D hugetlb_cma_size_in_node[nid];
 -			hugetlb_cma_size_in_node[nid] =3D 0;
 -		} else {
 -			node_specific_cma_alloc =3D true;
 -		}
 +		hugetlb_cma_size -=3D size;
 +		hugetlb_cma_size_in_node[nid] =3D 0;
  	}
 =20
  	/* Validate the CMA size again in case some invalid nodes specified. */
  	if (!hugetlb_cma_size)
  		return;
 =20
 -	if (hugetlb_cma_size < (PAGE_SIZE << order)) {
 -		pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
 -			(PAGE_SIZE << order) / SZ_1M);
 +	if (!IS_ALIGNED(hugetlb_cma_size, gigantic_page_size)) {
 +		pr_warn("hugetlb_cma: cma area must be a multiple of %lu MiB\n",
 +			gigantic_page_size / SZ_1M);
  		hugetlb_cma_size =3D 0;
  		return;
  	}
@@@ -203,7 -204,7 +203,7 @@@
  		 */
  		per_node =3D DIV_ROUND_UP(hugetlb_cma_size,
  					nodes_weight(hugetlb_bootmem_nodes));
 -		per_node =3D round_up(per_node, PAGE_SIZE << order);
 +		per_node =3D round_up(per_node, gigantic_page_size);
  		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
  			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
  	}
@@@ -222,13 -223,15 +222,13 @@@
  			size =3D min(per_node, hugetlb_cma_size - reserved);
  		}
 =20
 -		size =3D round_up(size, PAGE_SIZE << order);
 -
  		snprintf(name, sizeof(name), "hugetlb%d", nid);
  		/*
  		 * Note that 'order per bit' is based on smallest size that
  		 * may be returned to CMA allocator in the case of
  		 * huge page demotion.
  		 */
 -		res =3D cma_declare_contiguous_multi(size, PAGE_SIZE << order,
 +		res =3D cma_declare_contiguous_multi(size, gigantic_page_size,
  					HUGETLB_PAGE_ORDER, name,
  					&hugetlb_cma[nid], nid);
  		if (res) {

--cZUSTRKqZe7XQbTx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMLikACgkQJNaLcl1U
h9ANWQf+LJEg0JvGdihfqfMC1ZJ9lOIN9ya61T39H6p89fBzSoJXRZf7Nard4TV5
aUW+hGU6NFO0HW6ARFq3MWmhcUGuZZGueIc3d3Wzjb8WzUuw4W8WIai9JkrqSp+A
Lzvp+9DBQps5aLXjd/wEcomHqnOaJqaF21efnaeQErzicnRSegDf900Bvtj/W/8o
TDGY51l6WQjgm2EgvKjlmlkYIL3Vxe3cA2aphj923sukb+EnSZM2LFswNNMFezPi
fk+sElOu1HlQPNfStPb1Jzbq0B9T4l/XgfmilrIWaF2LF3FbWCeb5AJVxsXIZQDZ
bh7HFiNHC+g5PCHHcK8Npy8Nxku+Rg==
=OczE
-----END PGP SIGNATURE-----

--cZUSTRKqZe7XQbTx--
