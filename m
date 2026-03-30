Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C12377543;
	Mon, 30 Mar 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886528; cv=none; b=u9gcdRH65ykopGJvSb+lvYAbKy7EdzuaI6vO1MbMStJdEEAzBzI5lcqkMO44H7uWPBV2vLfNrIk2NTrBROpshdQbi3S9tDm1/t227ATEcMigX9JBlRlvI7kK4GwJ2OoXfX1VpB+FDpIJEfWzI+IlqYXFEwfSj5zwOhtM5t81AIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886528; c=relaxed/simple;
	bh=AZ0uldLaPK5hj2AgqSOwxEW6YqwCYBF18h01AvCu1nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/EW0unXEguph+i84CeZTmaa9T0qpA+SKesozek4vpbXw1XEn9/klxfH9xsszX2N9kiGMjlz6YYjQdl0i6fB5iC/XSjeSJM5zMxV+rifi2UXjo+WUcu2txCsweO9gMXajgH0M3H5wLWEtlahySybJbrNv9sqy3y99y+WtmCdNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRBCsvkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRBCsvkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25EC2BCB2;
	Mon, 30 Mar 2026 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886528;
	bh=AZ0uldLaPK5hj2AgqSOwxEW6YqwCYBF18h01AvCu1nM=;
	h=Date:From:To:Cc:Subject:From;
	b=lRBCsvkUDgYCeFXwKP0ieKfVCrnq23WG2/iGygDx03+c4ybXzxe0a/zcmqU7lLnq/
	 1G7dNSwqbrt0AE2gjT07Q+O3uHbJ5JiA6ql5GOIR+b7l9NhZNeX7lhk5G0sTSoY1b+
	 0Q4aqz9wsT0JtKROcMN9P3lmoV0j7/4mNcTxFre6TsbS4Qv9w+RHAKWJu53nrtbeUv
	 vt4VkmuyJQp6/RAEus2hIG/iEHc7/7sSB2taUf3bBwAmj1fWi23khbcD7vXDieuNo1
	 9A1QXY1MulFAcg+G2rMIRCXJHwU3SDTS6jAtSaKr/p7hQBMW9igm1sHullKAfNG2yZ
	 /Fv9r5EGaPsuQ==
Date: Mon, 30 Mar 2026 17:02:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <acqee1y4jIIuFlJe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q9oCtFYbqaFS5j8v"
Content-Disposition: inline


--q9oCtFYbqaFS5j8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_gem_shmem_helper.c

between commits:

  d9a4a2021d4a5 ("Merge tag 'drm-misc-next-2026-03-12' of https://gitlab.fr=
eedesktop.org/drm/misc/kernel into drm-next")

=66rom the drm tree and commit:

  6fdfd24017756 ("Merge drm/drm-fixes into drm-misc-next-fixes")

=66rom the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/drm_gem_shmem_helper.c
index 044f0d4ebf555,2062ca6078330..0000000000000
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@@ -554,20 -554,24 +554,20 @@@ int drm_gem_shmem_dumb_create(struct dr
  }
  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 =20
 -static vm_fault_t try_insert_pfn(struct vm_fault *vmf, unsigned int order,
 -				 unsigned long pfn)
 +static vm_fault_t drm_gem_shmem_try_insert_pfn_pmd(struct vm_fault *vmf, =
unsigned long pfn)
  {
 -	if (!order) {
 -		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
  #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 -	} else if (order =3D=3D PMD_ORDER) {
 -		unsigned long paddr =3D pfn << PAGE_SHIFT;
 -		bool aligned =3D (vmf->address & ~PMD_MASK) =3D=3D (paddr & ~PMD_MASK);
 +	unsigned long paddr =3D pfn << PAGE_SHIFT;
 +	bool aligned =3D (vmf->address & ~PMD_MASK) =3D=3D (paddr & ~PMD_MASK);
 =20
 -		if (aligned &&
 -		    folio_test_pmd_mappable(page_folio(pfn_to_page(pfn)))) {
 -			pfn &=3D PMD_MASK >> PAGE_SHIFT;
 -			return vmf_insert_pfn_pmd(vmf, pfn, false);
 -		}
 -#endif
 +	if (aligned && pmd_none(*vmf->pmd)) {
 +		/* Read-only mapping; split upon write fault */
 +		pfn &=3D PMD_MASK >> PAGE_SHIFT;
 +		return vmf_insert_pfn_pmd(vmf, pfn, false);
  	}
 -	return VM_FAULT_FALLBACK;
 +#endif
 +
 +	return 0;
  }
 =20
  static vm_fault_t drm_gem_shmem_any_fault(struct vm_fault *vmf, unsigned =
int order)
@@@ -584,6 -588,9 +584,9 @@@
  	struct folio *folio;
  	unsigned long pfn;
 =20
+ 	if (order && order !=3D PMD_ORDER)
+ 		return VM_FAULT_FALLBACK;
+=20
  	dma_resv_lock(obj->resv, NULL);
 =20
  	if (page_offset >=3D num_pages || drm_WARN_ON_ONCE(dev, !shmem->pages) ||
@@@ -597,11 -604,7 +600,11 @@@
 =20
  	pfn =3D page_to_pfn(page);
 =20
 -	ret =3D try_insert_pfn(vmf, order, pfn);
 +	if (folio_test_pmd_mappable(folio))
 +		ret =3D drm_gem_shmem_try_insert_pfn_pmd(vmf, pfn);
 +	if (ret !=3D VM_FAULT_NOPAGE)
 +		ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
 +
  	if (ret =3D=3D VM_FAULT_NOPAGE)
  		folio_mark_accessed(folio);
 =20

--q9oCtFYbqaFS5j8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKnnsACgkQJNaLcl1U
h9ATtwf/XVwOAJ9jZAbFoRGmM+aLhW814fUUnre9YJFIUtrihvOzF+CSmQt6iiBY
UPuEhCRtw6qkP5+Dnf/nmlCx1F+99sN8QqV8GdgSPxeMp8krpMjHgpi3kkPbCSwq
tC7JwzlrzeyC6vVmBCQMlx9duUGt1BHb4QtF0iX2viJm4mhc0iEwFDqdfYWZNA5O
YGzTCoO1JdoCv9GN3PlsonncRHFnOwJzq47dVTMIl96bU0dAH0WU34kkVfH5QY1L
f3Ipkqtyxw4J2ueI+dPAuJsjn7gjyGLMMjC72vQKp9tHZfN/lNAlU1HJR4uKo3/9
ejY2wKNjnz963sg/5NdmhKqGZBtbZw==
=+Hwg
-----END PGP SIGNATURE-----

--q9oCtFYbqaFS5j8v--
