Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B693B7750;
	Fri,  3 Apr 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223258; cv=none; b=saf7Jo38XEUszsdF9Vt7U9cxr2LlDto74FgxvcWCR9zjdJhRPiKKWInzmpStWS/1bo9K1OE6dxhrJjWMdMwXsAwC7EuU70Z+TCfOLoQ7XdN/NpK3EldrqCpXhlDv/Qsm9s17P9g60zgGXPlwH9UlE5gj62Et5xb3QXemB/4OU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223258; c=relaxed/simple;
	bh=DIQBYZ6MxzsBXUsvvT5LPGWQpjkKRzlO7KjSmq9vf/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcTjWAQRFKejZGxhq/6cxV4EI/kwTdtr2KpKEgoB21j8fg4jQrSFYwyrirVPWwDbBN+/eKhlYIj54rpvh9lRV7rhqUfXRpRHGAJBPEqQPOwG/cc2CidYlS9MLz8DRe0Bcik7Nv9Ho5tLmIB0DaTLVRm8oLE4Vp/Ijr8scoLvy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B76j39VB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B76j39VB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7CDC4CEF7;
	Fri,  3 Apr 2026 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775223258;
	bh=DIQBYZ6MxzsBXUsvvT5LPGWQpjkKRzlO7KjSmq9vf/g=;
	h=Date:From:To:Cc:Subject:From;
	b=B76j39VBvZQCc1lZ+ZMYq5neJjLTDH000ePKPUmYheBMZeYqwkIyR6wd9gfpW1i44
	 J0wcDAoJvBCCTddm+8LWUnb1+Rlgliv7VghoYbppbAbYhXuWjhnYvtyHgAvC5uAVpQ
	 QrhU5X8BiMAsizLNrfxUUYQI1KtfYRWoJ94DIWXVE2ao3u8kkbUuzTNhxm5pw5h+Br
	 2mXNYRllwe1ScKkAjhgDO2keu0I3ZYsmXu2/AzF/Rykkay6luc7fTXIkAHGBHKwCZL
	 pSCYEYzokbgAD1kF2Yutui8Alrc8WF2axhPEKmNBPVGvY/4C35to4HXGduC+sI0itK
	 nHpd5hdfx67Pw==
Date: Fri, 3 Apr 2026 14:34:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <ac_B1p2wNP2Nk1RM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vMrcI1uf3QTFOhA3"
Content-Disposition: inline


--vMrcI1uf3QTFOhA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_gem_shmem_helper.c

between commits:

  d9a4a2021d4a5 ("Merge tag 'drm-misc-next-2026-03-12' of https://gitlab.fr=
eedesktop.org/drm/misc/kernel into drm-next")
  f6225b546dfcc ("BackMerge tag 'v7.0-rc6' into drm-next")

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
index 2062ca6078330,545933c7f7121..0000000000000
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@@ -554,6 -554,21 +554,21 @@@ int drm_gem_shmem_dumb_create(struct dr
  }
  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 =20
+ static void drm_gem_shmem_record_mkwrite(struct vm_fault *vmf)
+ {
+ 	struct vm_area_struct *vma =3D vmf->vma;
+ 	struct drm_gem_object *obj =3D vma->vm_private_data;
+ 	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
+ 	loff_t num_pages =3D obj->size >> PAGE_SHIFT;
+ 	pgoff_t page_offset =3D vmf->pgoff - vma->vm_pgoff; /* page offset withi=
n VMA */
+=20
+ 	if (drm_WARN_ON(obj->dev, !shmem->pages || page_offset >=3D num_pages))
+ 		return;
+=20
+ 	file_update_time(vma->vm_file);
+ 	folio_mark_dirty(page_folio(shmem->pages[page_offset]));
+ }
+=20
  static vm_fault_t try_insert_pfn(struct vm_fault *vmf, unsigned int order,
  				 unsigned long pfn)
  {
@@@ -566,8 -581,23 +581,23 @@@
 =20
  		if (aligned &&
  		    folio_test_pmd_mappable(page_folio(pfn_to_page(pfn)))) {
+ 			vm_fault_t ret;
+=20
  			pfn &=3D PMD_MASK >> PAGE_SHIFT;
- 			return vmf_insert_pfn_pmd(vmf, pfn, false);
+=20
+ 			/* Unlike PTEs which are automatically upgraded to
+ 			 * writeable entries, the PMD upgrades go through
+ 			 * .huge_fault(). Make sure we pass the "write" info
+ 			 * along in that case.
+ 			 * This also means we have to record the write fault
+ 			 * here, instead of in .pfn_mkwrite().
+ 			 */
+ 			ret =3D vmf_insert_pfn_pmd(vmf, pfn,
+ 						 vmf->flags & FAULT_FLAG_WRITE);
+ 			if (ret =3D=3D VM_FAULT_NOPAGE && (vmf->flags & FAULT_FLAG_WRITE))
+ 				drm_gem_shmem_record_mkwrite(vmf);
+=20
+ 			return ret;
  		}
  #endif
  	}
@@@ -655,19 -685,7 +685,7 @@@ static void drm_gem_shmem_vm_close(stru
 =20
  static vm_fault_t drm_gem_shmem_pfn_mkwrite(struct vm_fault *vmf)
  {
- 	struct vm_area_struct *vma =3D vmf->vma;
- 	struct drm_gem_object *obj =3D vma->vm_private_data;
- 	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
- 	loff_t num_pages =3D obj->size >> PAGE_SHIFT;
- 	pgoff_t page_offset =3D vmf->pgoff - vma->vm_pgoff; /* page offset withi=
n VMA */
-=20
- 	if (drm_WARN_ON(obj->dev, !shmem->pages || page_offset >=3D num_pages))
- 		return VM_FAULT_SIGBUS;
-=20
- 	file_update_time(vma->vm_file);
-=20
- 	folio_mark_dirty(page_folio(shmem->pages[page_offset]));
-=20
+ 	drm_gem_shmem_record_mkwrite(vmf);
  	return 0;
  }
 =20

--vMrcI1uf3QTFOhA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPwdUACgkQJNaLcl1U
h9B1Gwf+NXKrf2ldubiQjKciUi5bMoq+Jop0S+8phbRwnKtKTKlL5YfwwOkKBEtF
kUMjJX9O4EZSdCBDNGqPtG0IBnSprmyY6AYh7PiI7ZU2p/K3najYVsIh1G/5663/
jNpNH392O7mxgLUZ4JMNhZ5/hxDBrH+sKY24ndlhgb2Fr5oTLVwSOjCuBnia+oZy
v5cbO7eYqPXSEnWnVFx90B5NoDJyGTllG2/On63oGi7hItkr54g8nj5Br+7a+/px
0N19drURyfHRDXKItoY8v9LHOC8vYAKxQpZ94dPI7k06kP16nCZXZZZcN/DJaQLI
CbCBmfUO1Gz86rVj+dO+sRNAPMYvZQ==
=6sMy
-----END PGP SIGNATURE-----

--vMrcI1uf3QTFOhA3--
