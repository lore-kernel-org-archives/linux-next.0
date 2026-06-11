Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD420DD51;
	Thu, 11 Jun 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185548; cv=none; b=FkZUVjP/7bo9o680DQLWhEif2+GX8xJhrANNWVkILgqh5mCeYGe/DRGKYfqBxCd6DpKRPbF4/oXPF8gV/Plhip6/BLOgrDVfb02rB7qOwRgKfW7HXlY4OTbKxEU6e75W8+3YbtFv6D55WcMAgBmn0kQfjBLrFxTJBPWOBWi1vsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185548; c=relaxed/simple;
	bh=G5wvPEZxUfNxCL4ohWNj6/ssQTwHcEcRdtB9UsE1qtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o41EXs9jott3XS5exS5DtfBaPAX91pxpnJGRnCTWnh3g1QG6aSSDJohvbitrWyakmrjxeYkHqxrX7+1XsFxxlWfQrCHbSevGYFLtDj3/UiyPmexW8qnAIqFfx8+9MTapytUGOsDg162guxb2/pk65dxRGXNPjt9xTEaMYZGgv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhzV4avR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhzV4avR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E0E1F00893;
	Thu, 11 Jun 2026 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781185546;
	bh=2jcTH1lC9/Cx9Nz9TdQH3MkqzYKsz7lx5Y9x4loH0DE=;
	h=Date:From:To:Cc:Subject;
	b=nhzV4avREjyjj73Og8xgrjbpuaW0zWUszJ5aGEcJQ3TjBqfDdLkJUcpK0lmu3RsDV
	 Gl/Rmfo7O75ou/dl2CjT1mKriKo38VXvne+7RoXChGL/noOK5ruY6QsT9wteaDAudX
	 V2FHX1hOr6qICojWuoRvFjWw1UlOdHVMhkB/FFp3dTmehvarLTfWShP7rQRFN6VHbO
	 PyLheftpuY+Y1Y0YHw6ECRhRucrIAj31BwYiPyw/4kG0/gEXQjYer3Ky14nxGlDxar
	 fB4GsXXYx7B7eFJpxPMCRBLgBvMjkSgkc5mMyczFLNJYYWvxlisshLKvrLaU1XxzYh
	 9wiNH3A7P5mBA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 765A71AC56C6; Thu, 11 Jun 2026 14:45:44 +0100 (BST)
Date: Thu, 11 Jun 2026 14:45:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext4 tree
Message-ID: <aiq8CByJNMlXo6Be@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8l/b2wyGpCK1mrzd"
Content-Disposition: inline


--8l/b2wyGpCK1mrzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/jbd2/journal.c

between commit:

  bbe9015f23432b ("jbd2: remove special jbd2 slabs")

=66rom the ext4 tree and commit:

  2f6702dc6fdcf0 ("jbd2: replace __get_free_pages() with kmalloc()")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/jbd2/journal.c
index 4fdf089500f618,e82798680109d3..00000000000000
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@@ -95,6 -95,8 +95,6 @@@ EXPORT_SYMBOL(jbd2_journal_release_jbd_
  EXPORT_SYMBOL(jbd2_journal_begin_ordered_truncate);
  EXPORT_SYMBOL(jbd2_inode_cache);
 =20
 -static int jbd2_journal_create_slab(size_t slab_size);
 -
  #ifdef CONFIG_JBD2_DEBUG
  void __jbd2_debug(int level, const char *file, const char *func,
  		  unsigned int line, const char *fmt, ...)
@@@ -383,10 -385,10 +383,10 @@@ int jbd2_journal_write_metadata_buffer(
  			goto escape_done;
 =20
  		spin_unlock(&jh_in->b_state_lock);
 -		tmp =3D jbd2_alloc(bh_in->b_size, GFP_NOFS | __GFP_NOFAIL);
 +		tmp =3D kmalloc(bh_in->b_size, GFP_NOFS | __GFP_NOFAIL);
  		spin_lock(&jh_in->b_state_lock);
  		if (jh_in->b_frozen_data) {
 -			jbd2_free(tmp, bh_in->b_size);
 +			kfree(tmp);
  			goto copy_done;
  		}
 =20
@@@ -1818,9 -1820,7 +1818,7 @@@ static int jbd2_write_superblock(journa
  	}
  	if (jbd2_journal_has_csum_v2or3(journal))
  		sb->s_checksum =3D jbd2_superblock_csum(sb);
- 	get_bh(bh);
- 	bh->b_end_io =3D end_buffer_write_sync;
- 	submit_bh(REQ_OP_WRITE | write_flags, bh);
+ 	bh_submit(bh, REQ_OP_WRITE | write_flags, bh_end_write);
  	wait_on_buffer(bh);
  	if (buffer_write_io_error(bh)) {
  		clear_buffer_write_io_error(bh);
@@@ -2062,6 -2062,14 +2060,6 @@@ EXPORT_SYMBOL(jbd2_journal_update_sb_er
  int jbd2_journal_load(journal_t *journal)
  {
  	int err;
 -	journal_superblock_t *sb =3D journal->j_superblock;
 -
 -	/*
 -	 * Create a slab for this blocksize
 -	 */
 -	err =3D jbd2_journal_create_slab(be32_to_cpu(sb->s_blocksize));
 -	if (err)
 -		return err;
 =20
  	/* Let the recovery code check whether it needs to recover any
  	 * data from the journal. */
@@@ -2253,8 -2261,6 +2251,8 @@@ jbd2_journal_initialize_fast_commit(jou
  	unsigned long long num_fc_blks;
 =20
  	num_fc_blks =3D jbd2_journal_get_num_fc_blks(sb);
 +	if (num_fc_blks > journal->j_last)
 +		return -EFSCORRUPTED;
  	if (journal->j_last - num_fc_blks < JBD2_MIN_JOURNAL_BLOCKS)
  		return -ENOSPC;
 =20
@@@ -2691,6 -2697,105 +2689,6 @@@ size_t journal_tag_bytes(journal_t *jou
  		return sz - sizeof(__u32);
  }
 =20
 -/*
 - * JBD memory management
 - *
 - * These functions are used to allocate block-sized chunks of memory
 - * used for making copies of buffer_head data.  Very often it will be
 - * page-sized chunks of data, but sometimes it will be in
 - * sub-page-size chunks.  (For example, 16k pages on Power systems
 - * with a 4k block file system.)  For blocks smaller than a page, we
 - * use a SLAB allocator.  There are slab caches for each block size,
 - * which are allocated at mount time, if necessary, and we only free
 - * (all of) the slab caches when/if the jbd2 module is unloaded.  For
 - * this reason we don't need to a mutex to protect access to
 - * jbd2_slab[] allocating or releasing memory; only in
 - * jbd2_journal_create_slab().
 - */
 -#define JBD2_MAX_SLABS 8
 -static struct kmem_cache *jbd2_slab[JBD2_MAX_SLABS];
 -
 -static const char *jbd2_slab_names[JBD2_MAX_SLABS] =3D {
 -	"jbd2_1k", "jbd2_2k", "jbd2_4k", "jbd2_8k",
 -	"jbd2_16k", "jbd2_32k", "jbd2_64k", "jbd2_128k"
 -};
 -
 -
 -static void jbd2_journal_destroy_slabs(void)
 -{
 -	int i;
 -
 -	for (i =3D 0; i < JBD2_MAX_SLABS; i++) {
 -		kmem_cache_destroy(jbd2_slab[i]);
 -		jbd2_slab[i] =3D NULL;
 -	}
 -}
 -
 -static int jbd2_journal_create_slab(size_t size)
 -{
 -	static DEFINE_MUTEX(jbd2_slab_create_mutex);
 -	int i =3D order_base_2(size) - 10;
 -	size_t slab_size;
 -
 -	if (size =3D=3D PAGE_SIZE)
 -		return 0;
 -
 -	if (i >=3D JBD2_MAX_SLABS)
 -		return -EINVAL;
 -
 -	if (unlikely(i < 0))
 -		i =3D 0;
 -	mutex_lock(&jbd2_slab_create_mutex);
 -	if (jbd2_slab[i]) {
 -		mutex_unlock(&jbd2_slab_create_mutex);
 -		return 0;	/* Already created */
 -	}
 -
 -	slab_size =3D 1 << (i+10);
 -	jbd2_slab[i] =3D kmem_cache_create(jbd2_slab_names[i], slab_size,
 -					 slab_size, 0, NULL);
 -	mutex_unlock(&jbd2_slab_create_mutex);
 -	if (!jbd2_slab[i]) {
 -		printk(KERN_EMERG "JBD2: no memory for jbd2_slab cache\n");
 -		return -ENOMEM;
 -	}
 -	return 0;
 -}
 -
 -static struct kmem_cache *get_slab(size_t size)
 -{
 -	int i =3D order_base_2(size) - 10;
 -
 -	BUG_ON(i >=3D JBD2_MAX_SLABS);
 -	if (unlikely(i < 0))
 -		i =3D 0;
 -	BUG_ON(jbd2_slab[i] =3D=3D NULL);
 -	return jbd2_slab[i];
 -}
 -
 -void *jbd2_alloc(size_t size, gfp_t flags)
 -{
 -	void *ptr;
 -
 -	BUG_ON(size & (size-1)); /* Must be a power of 2 */
 -
 -	if (size < PAGE_SIZE)
 -		ptr =3D kmem_cache_alloc(get_slab(size), flags);
 -	else
 -		ptr =3D kmalloc(size, flags);
 -
 -	/* Check alignment; SLUB has gotten this wrong in the past,
 -	 * and this can lead to user data corruption! */
 -	BUG_ON(((unsigned long) ptr) & (size-1));
 -
 -	return ptr;
 -}
 -
 -void jbd2_free(void *ptr, size_t size)
 -{
 -	kfree(ptr);
 -};
 -
  /*
   * Journal_head storage management
   */
@@@ -2864,15 -2969,15 +2862,15 @@@ static void __journal_remove_journal_he
  	clear_buffer_jbd(bh);
  }
 =20
 -static void journal_release_journal_head(struct journal_head *jh, size_t =
b_size)
 +static void journal_release_journal_head(struct journal_head *jh)
  {
  	if (jh->b_frozen_data) {
  		printk(KERN_WARNING "%s: freeing b_frozen_data\n", __func__);
 -		jbd2_free(jh->b_frozen_data, b_size);
 +		kfree(jh->b_frozen_data);
  	}
  	if (jh->b_committed_data) {
  		printk(KERN_WARNING "%s: freeing b_committed_data\n", __func__);
 -		jbd2_free(jh->b_committed_data, b_size);
 +		kfree(jh->b_committed_data);
  	}
  	journal_free_journal_head(jh);
  }
@@@ -2891,7 -2996,7 +2889,7 @@@ void jbd2_journal_put_journal_head(stru
  	if (!jh->b_jcount) {
  		__journal_remove_journal_head(bh);
  		jbd_unlock_bh_journal_head(bh);
 -		journal_release_journal_head(jh, bh->b_size);
 +		journal_release_journal_head(jh);
  		__brelse(bh);
  	} else {
  		jbd_unlock_bh_journal_head(bh);
@@@ -3033,6 -3138,7 +3031,6 @@@ static void jbd2_journal_destroy_caches
  	jbd2_journal_destroy_handle_cache();
  	jbd2_journal_destroy_inode_cache();
  	jbd2_journal_destroy_transaction_cache();
 -	jbd2_journal_destroy_slabs();
  }
 =20
  static int __init journal_init(void)

--8l/b2wyGpCK1mrzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqvAcACgkQJNaLcl1U
h9A9KAf/dA+LEXOVuVZnS/5fjFmEGmzVNyW8orj9R7BiwrO1axmhxKwpjfCVMaJ2
3fzcz8HeSpQysZWPaMa8Cpa+Gj0okeyEvrUsg0XgL01mmy4N8iakxOBAfvuZvaXE
uaNrSRtEKzCcNEW/2XYICm+g/W1NmHpdk7OehCH9SwAIVfZtmnSo3SLqxtDgOgLE
J2fq4HZpcUymLOIZ//znUb2JXPSE/uqddGozCNwCP9SpsisTuDYlqbIoFoxFfce0
YTdwv9labvbvlqaIA/ua4UJjE5fYg65NEb1iQlzyhJOU+Jp38bCWDh2+Tih4s/kU
4Ak2qLLdgAlupmZHXHbwWin/PqAMhw==
=mZNU
-----END PGP SIGNATURE-----

--8l/b2wyGpCK1mrzd--
