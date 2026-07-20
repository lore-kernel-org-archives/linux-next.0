Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D041DE0B;
	Mon, 20 Jul 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554270; cv=none; b=bv7nk7vbshoR8EMsEVAmW05Ophzg4UXqRtZYTPCSUiPoGNZZalnYPb3GCOmgDYUiSlxv4r+4VCmEEAScM5H9RRFUam8vP9c6WTji+h+VRZZooZaffx2B38tbK9tuhHgueJFNFskUAHfA5zKt1gKSapiU0vT6sKeAOO5cwEcNIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554270; c=relaxed/simple;
	bh=2CNT9g5SRlxHRbRYXXlxF0U/PrVQYRzsHQJeNARao2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXtYvh1Fx73YsyaAaXZo/5myx1wFvUgt49T2BDehLI3FJHiVXwBRUV+Kl2aSqGyqVastHA5wJ5LpCo1i1GP1rldo27S+blDEukXloTqWUifZCQdoIUqZjLMOX4VTH8Ag5/SZuepP7cDoG7vwSaTsZcb1CXGf4JqVfH0SaVwg6Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbTBrKnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbTBrKnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0001F00A3A;
	Mon, 20 Jul 2026 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784554268;
	bh=n4LShFotWlgKu+MbLg37BG2wSfYI+h1K64Cu2hXXrRk=;
	h=Date:From:To:Cc:Subject;
	b=WbTBrKnT9PNs6cq8v13SGJOe56/t89mo3nTYlElltZCmRjX01wC+V38VX9RlHWp9K
	 A0HQ+KNIcWmn/necIuvirXFCjetezBFo1OWjqNVlTqYyoGWdIrm0Ce5YKn0zo0UPqq
	 mxJUT513XIG6aag1TumUXhXpDAfSDl5ay2txs5HKpBqEKZhJ1Z3NwaORmTJZTtL9UN
	 6wbJ853svj0N9cMsNDNVi9eWr7XLoy/UIkhOqLR9FuPR6q5JX/Wo9vU+B/mj/z8IvM
	 2NYEiZoJZi/kJghkeXdg/M/ypSpnNpfUalytc8yO1Hjc/0+FQsNk33CzbvLIcFyq+a
	 yjdMuFVax/UQg==
Date: Mon, 20 Jul 2026 14:31:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-ID: <al4jGBGNG_QACaNL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rvk02afvJ5zQlhjU"
Content-Disposition: inline


--rvk02afvJ5zQlhjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  drivers/gpu/drm/ttm/ttm_backup.c

between commit:

  a3fdf74ffa596 ("drm/ttm/pool: back up at native page order")

=66rom the drm-misc-fixes tree and commit:

  c6bfdcf16f131 ("shmem: provide a shmem_write_folio wrapper")

=66rom the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/ttm/ttm_backup.c
index 3c067aadc52de,c5b813a563e7f..0000000000000
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@@ -6,10 -6,9 +6,10 @@@
  #include <drm/ttm/ttm_backup.h>
 =20
  #include <linux/export.h>
 -#include <linux/page-flags.h>
  #include <linux/swap.h>
 =20
 +#include "ttm_pool_internal.h"
 +
  /*
   * Need to map shmem indices to handle since a handle value
   * of 0 means error, following the swp_entry_t convention.
@@@ -69,23 -68,17 +69,23 @@@ int ttm_backup_copy_page(struct file *b
  }
 =20
  /**
 - * ttm_backup_backup_page() - Backup a page
 + * ttm_backup_backup_folio() - Backup a folio
   * @backup: The struct backup pointer to use.
 - * @page: The page to back up.
 - * @writeback: Whether to perform immediate writeback of the page.
 + * @folio: The folio to back up.
 + * @order: The allocation order of @folio.  Since TTM allocates higher-or=
der
 + *         pages without __GFP_COMP, folio_nr_pages(@folio) would always
 + *         return 1; the caller must pass the true order explicitly.
 + * @writeback: Whether to perform immediate writeback of the folio's page=
s.
   * This may have performance implications.
 - * @idx: A unique integer for each page and each struct backup.
 + * @idx: A unique integer for the first page of the folio and each struct=
 backup.
   * This allows the backup implementation to avoid managing
   * its address space separately.
 - * @page_gfp: The gfp value used when the page was allocated.
 - * This is used for accounting purposes.
 + * @folio_gfp: The gfp value used when the folio was allocated.
 + * Currently unused.
   * @alloc_gfp: The gfp to be used when allocating memory.
 + * @nr_pages_backed: Output. On a successful return, set to the number of
 + * pages actually backed up, which may be less than (1 << @order)
 + * if an -ENOMEM was encountered mid-folio.
   *
   * Context: If called from reclaim context, the caller needs to
   * assert that the shrinker gfp has __GFP_FS set, to avoid
@@@ -94,87 -87,53 +94,87 @@@
   * that the shrinker gfp has __GFP_IO set, since without it,
   * we're not allowed to start backup IO.
   *
 - * Return: A handle on success. Negative error code on failure.
 - *
 - * Note: This function could be extended to back up a folio and
 - * implementations would then split the folio internally if needed.
 - * Drawback is that the caller would then have to keep track of
 - * the folio size- and usage.
 + * Return: A handle for the first backed-up page on success (handles for
 + * subsequent pages follow sequentially). -ENOMEM if no pages could be ba=
cked
 + * up. Any other negative error code if a non-ENOMEM failure occurred; in=
 that
 + * case any pages backed up so far are truncated before returning.
   */
  s64
 -ttm_backup_backup_page(struct file *backup, struct page *page,
 -		       bool writeback, pgoff_t idx, gfp_t page_gfp,
 -		       gfp_t alloc_gfp)
 +ttm_backup_backup_folio(struct file *backup, struct folio *folio,
 +			unsigned int order, bool writeback, pgoff_t idx,
 +			gfp_t folio_gfp, gfp_t alloc_gfp,
 +			pgoff_t *nr_pages_backed)
  {
  	struct address_space *mapping =3D backup->f_mapping;
 -	unsigned long handle =3D 0;
 +	int nr_pages =3D 1 << order;
  	struct folio *to_folio;
 -	int ret;
 +	int ret, i;
 =20
 -	to_folio =3D shmem_read_folio_gfp(mapping, idx, alloc_gfp);
 -	if (IS_ERR(to_folio))
 -		return PTR_ERR(to_folio);
 +	*nr_pages_backed =3D 0;
 =20
 -	folio_mark_accessed(to_folio);
 -	folio_lock(to_folio);
 -	folio_mark_dirty(to_folio);
 -	copy_highpage(folio_file_page(to_folio, idx), page);
 -	handle =3D ttm_backup_shmem_idx_to_handle(idx);
 +	for (i =3D 0; i < nr_pages; ) {
 +		int to_nr, j;
 =20
 -	if (writeback && !folio_mapped(to_folio) &&
 -	    folio_clear_dirty_for_io(to_folio)) {
 -		folio_set_reclaim(to_folio);
 -		ret =3D shmem_write_folio(to_folio);
 -		if (!folio_test_writeback(to_folio))
 -			folio_clear_reclaim(to_folio);
  		/*
 -		 * If writeout succeeds, it unlocks the folio.	errors
 -		 * are otherwise dropped, since writeout is only best
 -		 * effort here.
 +		 * Only inject past the first subpage so *nr_pages_backed is
 +		 * always > 0 here, matching a genuine mid-compound -ENOMEM
 +		 * and driving the caller's reactive split fallback instead
 +		 * of an early, no-progress failure.
  		 */
 -		if (ret)
 +		if (IS_ENABLED(CONFIG_FAULT_INJECTION) && i &&
 +		    ttm_backup_fault_inject_folio())
 +			to_folio =3D ERR_PTR(-ENOMEM);
 +		else
 +			to_folio =3D shmem_read_folio_gfp(mapping, idx + i, alloc_gfp);
 +		if (IS_ERR(to_folio)) {
 +			int err =3D PTR_ERR(to_folio);
 +
 +			if (err =3D=3D -ENOMEM && *nr_pages_backed)
 +				return ttm_backup_shmem_idx_to_handle(idx);
 +
 +			if (*nr_pages_backed) {
 +				shmem_truncate_range(file_inode(backup),
 +						     (loff_t)idx << PAGE_SHIFT,
 +						     ((loff_t)(idx + i) << PAGE_SHIFT) - 1);
 +				/*
 +				 * The pages just truncated are no longer
 +				 * backed up; don't let the caller mistake
 +				 * them for valid handles.
 +				 */
 +				*nr_pages_backed =3D 0;
 +			}
 +			return err;
 +		}
 +
 +		to_nr =3D min_t(int, nr_pages - i,
 +			      folio_next_index(to_folio) - (idx + i));
 +
 +		folio_mark_accessed(to_folio);
 +		folio_lock(to_folio);
 +		folio_mark_dirty(to_folio);
 +
 +		for (j =3D 0; j < to_nr; j++)
 +			copy_highpage(folio_file_page(to_folio, idx + i + j),
 +				      folio_page(folio, i + j));
 +
 +		if (writeback && !folio_mapped(to_folio) &&
 +		    folio_clear_dirty_for_io(to_folio)) {
 +			folio_set_reclaim(to_folio);
++			ret =3D shmem_write_folio(to_folio);
 +			if (!folio_test_writeback(to_folio))
 +				folio_clear_reclaim(to_folio);
 +			if (ret =3D=3D AOP_WRITEPAGE_ACTIVATE)
 +				folio_unlock(to_folio);
 +		} else {
  			folio_unlock(to_folio);
 -	} else {
 -		folio_unlock(to_folio);
 +		}
 +
 +		folio_put(to_folio);
 +		i +=3D to_nr;
 +		*nr_pages_backed =3D i;
  	}
 =20
 -	folio_put(to_folio);
 -
 -	return handle;
 +	return ttm_backup_shmem_idx_to_handle(idx);
  }
 =20
  /**

--rvk02afvJ5zQlhjU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeIxgACgkQJNaLcl1U
h9B/ogf/QDrd7WPt4eEHzf+SJdXRDeczu4v8b6oues5ot2nfWJvLL67bfVzuVEuL
1k9L3a5Y74PjeJBenCjCMiMSITcItQzgQLoGargftIlW/WMZSrWBBcvHP5nJZF82
L8muL5XuJ0d189e9NLC2rdigJJwX+LbQPtsfs4gE+pUkd2yV+iqhtETS7JGoziZL
DJxWOB10oYAeXxU1focBcpI+P1RKn0DaeUv9uWp43awqWUPb8QwSpF4fORl/Dtvx
1+NAd0VjtUlLFoWdG/ELOXFjjyBv77jDkRfY8eX0pVVMmem81EAN8/AkXvk2tVs9
sV8SnV33LHiD7JMAhPQgwgV/ojdycA==
=v3KR
-----END PGP SIGNATURE-----

--rvk02afvJ5zQlhjU--
