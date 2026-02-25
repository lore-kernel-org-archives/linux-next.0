Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA49328B53;
	Wed, 25 Feb 2026 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018394; cv=none; b=m4Tw/LyOt38ZSthYahIS4Nue5ajcNshf1kSsV9HFfxYBiLN0wM0SSxM3DxNq+v+AGqdZJFCxZ9vGr78GUHZ30pzNTZINNglscT6ImzaIZo9UOdynL5GAAeacuWsoOUGPsoz+lvv7Ht0kTeEgPZJ/m8TjDD1p2vphqdipDG8uVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018394; c=relaxed/simple;
	bh=oMuppjpDBgU6CMU7H6oG+tWecofTBvxD/WKOn1hqjrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PoueObWQmv/HNUQfrKJ1jN73fKqGKpbC87b3Rf+n4Af87CfmBjM9CuDDNm5e/MxbPPHQ8pfmPKa/muZlsKtLGk7uS1i3aUb8IVu8wDQSPx+37gv6l8Hi8gxsRE5vWAkaTe06F7nikJbg9eyQYmdBChZu+e2zrG2T7mCJS6dZnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tw3mHg6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tw3mHg6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E79C116D0;
	Wed, 25 Feb 2026 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018394;
	bh=oMuppjpDBgU6CMU7H6oG+tWecofTBvxD/WKOn1hqjrk=;
	h=Date:From:To:Cc:Subject:From;
	b=tw3mHg6yNS5mxDNrd9YUuo3UEhV/Dd2dunOiJt9gkYKfwRCzYtgkZeFMrOSDE9ikr
	 bCwbG/LnWZJRc0qVtiK6U4Q/Rmkau+VlFvosf3uulyPnp8My5b6Edx4JDWsgIod1CO
	 FA3Hn5JfYXyM4SUfe3Q1qxCE0AjiKl3Pj/Hlq5ZWvGQut1eiKlOxacra6sBrXwLhkI
	 MqYnMOAco+deUfhNFKaA6YBbiY9a6VQa2M6h3oozMZAfp8+aucLFqexP2/BYzDdtKo
	 IyNheveUhcCaaqcrnvaftA4AfX13qKX0oGfxiXzTOZKCZxTMPKrVlKyelZBRAyYijv
	 mm7kk+OdaWZgQ==
Date: Wed, 25 Feb 2026 11:19:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the mm-unstable tree
Message-ID: <aZ7a1vc2xSClNEZi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atUZthrJSehvIAKY"
Content-Disposition: inline


--atUZthrJSehvIAKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  mm/migrate_device.c

between commit:

  1de80c790c979 ("mm/migrate_device: remove dead migration entry check in m=
igrate_vma_collect_huge_pmd()")

=66rom the mm-unstable tree and commit:

  a69d1ab971a62 ("mm: Fix a hmm_range_fault() livelock / starvation problem=
")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/migrate_device.c
index 78c7acf024615,deab89fd45419..0000000000000
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@@ -175,6 -175,12 +175,6 @@@ static int migrate_vma_collect_huge_pmd
  			return migrate_vma_collect_skip(start, end, walk);
  		}
 =20
 -		if (softleaf_is_migration(entry)) {
 -			softleaf_entry_wait_on_locked(entry, ptl);
 -			spin_unlock(ptl);
 -			return -EAGAIN;
 -		}
 -
  		if (softleaf_is_device_private_write(entry))
  			write =3D MIGRATE_PFN_WRITE;
  	} else {
@@@ -265,7 -271,7 +265,7 @@@ again
  	ptep =3D pte_offset_map_lock(mm, pmdp, start, &ptl);
  	if (!ptep)
  		goto again;
 -	arch_enter_lazy_mmu_mode();
 +	lazy_mmu_mode_enable();
  	ptep +=3D (addr - start) / PAGE_SIZE;
 =20
  	for (; addr < end; addr +=3D PAGE_SIZE, ptep++) {
@@@ -307,7 -313,7 +307,7 @@@
  			if (folio_test_large(folio)) {
  				int ret;
 =20
 -				arch_leave_lazy_mmu_mode();
 +				lazy_mmu_mode_disable();
  				pte_unmap_unlock(ptep, ptl);
  				ret =3D migrate_vma_split_folio(folio,
  							  migrate->fault_page);
@@@ -350,7 -356,7 +350,7 @@@
  			if (folio && folio_test_large(folio)) {
  				int ret;
 =20
 -				arch_leave_lazy_mmu_mode();
 +				lazy_mmu_mode_disable();
  				pte_unmap_unlock(ptep, ptl);
  				ret =3D migrate_vma_split_folio(folio,
  							  migrate->fault_page);
@@@ -479,7 -485,7 +479,7 @@@ next
  	if (unmapped)
  		flush_tlb_range(walk->vma, start, end);
 =20
 -	arch_leave_lazy_mmu_mode();
 +	lazy_mmu_mode_disable();
  	pte_unmap_unlock(ptep - 1, ptl);
 =20
  	return 0;
@@@ -1413,10 -1419,10 +1413,10 @@@ EXPORT_SYMBOL(migrate_device_range)
 =20
  /**
   * migrate_device_pfns() - migrate device private pfns to normal memory.
 - * @src_pfns: pre-popluated array of source device private pfns to migrat=
e.
 + * @src_pfns: pre-populated array of source device private pfns to migrat=
e.
   * @npages: number of pages to migrate.
   *
 - * Similar to migrate_device_range() but supports non-contiguous pre-popl=
uated
 + * Similar to migrate_device_range() but supports non-contiguous pre-popu=
lated
   * array of device pages to migrate.
   */
  int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)

--atUZthrJSehvIAKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme2tUACgkQJNaLcl1U
h9APYAf/c1n3dha5gJrR6x3Cp7LmblVDopR/Zk6ipqli8jtkkrWTknk5fu2KIo5K
bDLOPFXO+r8irmj3ULk28LA31/Yyz6jKCMS9D6wa5YCze1U2/2u3S+lVsd3kpHW2
TjgosWq50InLx2GQNjECZPMX5ytr9HOpK9xqyhCG4Jmn/mPrimBW0qRckdlVVGgM
CK7PPYf52wEH3UAlpEms0cAT7OEx8FwiUHtOoCayco6mk9uN7vVqxeH7jecbfowk
4c2CQZwiBr7c4LmcOwlynlBXb24L5WzDniSUfAB5IBMtlc+ybbL1xemQUBq12s6a
6E9d4awGlAvD+F9Ku1xS8ADcj74RZQ==
=PZS+
-----END PGP SIGNATURE-----

--atUZthrJSehvIAKY--
