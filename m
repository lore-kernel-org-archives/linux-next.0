Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008060;
	b=wmJLhfc0XC/ulDX15CfiXMNtIZBVA++/l7Hax1/H3TzWEPw6hUznay5qITN+PYS/3pwN
	 ig6eYjmnoAgwAJjkQwlzI/TC4vSTj6T0qXvB+EJUPCbb+adnMzut7Y9u45XHR1BwpW7Dq
	 IT3I7mfrVjU/x3+HXkuIfRyIO2O9uPDrBW+MZhGInezPEvQxpVCUqdNOvSpkcw3BAuyG8
	 tN3WRRyjDSvx6MXWHqXyxq9Xq++2OY6wu04roPAGkYes3OgM8BEya4V7npZqJOIgsOHxo
	 JY+AJ1VgamC2pb3aEekTkWJYvkIm1LozXWjlDR/v1flqnXYkQ7l7bm6j57VB/QRIC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008060;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=eCD6KYxE7KafmDUvT/CJJctFxELiwnm2j6W6mM8f0nk=;
	b=NbPx3HuDoFu/6opPFMGoSlcxIPHJebAMkIc6UzVKdWxrRjazx4da5CVxLk7gryM3ArP3
	 pHBpJpTRzAoT+DM9Ftip5tS/tXd+Z/ZYEYfZTasVYQsETYJsG0oJhCrt/Jy6KE1wZaPqz
	 gtgsm05aF8z96OvB7FCdi8OxKFUlpmAKf/u8DziXTxaXllmZk9wSZlGVg9khofzgwpbne
	 yeV1i/uKjiLIMYh+m7UmM+H9CCCd7CaEsI5yUBA7g3kNenOKh+gICNr1SQoU2qxgM/793
	 RH0vMX2S0Q/q6e15WDX/Xc2KE9GBA08zM1nuMCjTwcLjxSwghxZAkWi4Q8U8BSxeS4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QwXk27I/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B8606A320;
	Wed, 18 Nov 2026 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwXk27I/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CEC1F000C4;
	Wed, 18 Nov 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008060;
	bh=eCD6KYxE7KafmDUvT/CJJctFxELiwnm2j6W6mM8f0nk=;
	h=Date:From:To:Cc:Subject;
	b=QwXk27I/cC+svgn8mDcDxcSofs2mRqkgeKA2MJMTjKTbzzmAAT+tNx4TaYzJFS3yd
	 kySgMzHC5pihsF1tQWhwabWxkG9uJETBudH2KhSaK8w/+VvR81TsVoQ1UwBHGwsKX/
	 cVUL9LK6uABpCbGwGJlyaM66TZvPWK0gOYJzjiho4RAbIA6OODBr1RKk1h75RAYXCR
	 O4xwLh85VV92u0eiIUH6zQB1pZo/Egs99vBqEqiH+/y/zsqSkWmBChwVZlr10SfUpX
	 V+8yZVIObjBZjtQpNxhuzaMmy+T7csxVf3M+cAQg3E7o4HTKuTPv5ctA5YuS4/iNN2
	 GMMOxyBumSYQw==
Date: Wed, 18 Nov 2026 13:20:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat tree
Message-ID: <av2mOPyANz3H59F5@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RvYcReLTk4/oCryJ"
Content-Disposition: inline


--RvYcReLTk4/oCryJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/file.c

between commits:

  cfdee4e5f5764 ("exfat: coordinate direct writes with mmap faults")
  b900c61a3f21b ("exfat: drain dirty pages after forced shutdown")
  e70ec3eaac957 ("exfat: increase VDL before unlocking initialized folios")

=66rom the exfat tree (plus my earlier merges) and commit:

  788f21d1f1923 ("exfat: don't set SB_RDONLY after filesystem errors")

=66rom the vfs-brauner tree.  Again, this needs double checking.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/exfat/file.c
index 8078e9bccbe13,b985f4e9b314b..0000000000000
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@@ -1102,13 -899,10 +1123,14 @@@ static ssize_t exfat_file_write_iter(st
  	loff_t pos, valid_size, end;
  	int err;
 =20
- 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
- 		return -EIO;
+ 	err =3D exfat_emergency_state(inode->i_sb);
+ 	if (unlikely(err))
+ 		return err;
 =20
 +	/* Gap initialization and source faults require blocking operations. */
 +	if (iocb->ki_flags & IOCB_NOWAIT)
 +		return -EAGAIN;
 +
  	inode_lock(inode);
 =20
  	ret =3D generic_write_checks(iocb, iter);
@@@ -1207,51 -993,58 +1229,52 @@@ static ssize_t exfat_file_read_iter(str
  static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
  {
  	struct inode *inode =3D file_inode(vmf->vma->vm_file);
 +	struct address_space *mapping =3D inode->i_mapping;
  	struct exfat_inode_info *ei =3D EXFAT_I(inode);
 +	struct folio *folio =3D page_folio(vmf->page);
 +	loff_t fault_start =3D folio_pos(folio);
 +	loff_t new_valid_size, gap_start;
  	vm_fault_t ret;
 -	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 -	int err;
 +	int error;
 =20
- 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
- 		return VM_FAULT_SIGBUS;
 -	err =3D exfat_emergency_state(inode->i_sb);
 -	if (unlikely(err))
 -		return vmf_fs_error(err);
 -
 -	if (!inode_trylock(inode))
 -		return VM_FAULT_RETRY;
 -
 -	mmap_valid_size =3D ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 -	fault_page_start =3D ((loff_t)vmf->pgoff) << PAGE_SHIFT;
 -	new_valid_size =3D min(mmap_valid_size, i_size_read(inode));
 -
 -	if (exfat_get_valid_size(ei) < new_valid_size) {
 -		loff_t zeroed_size =3D exfat_get_zeroed_size(ei);
 -
 -		if (zeroed_size < fault_page_start) {
 -			/*
 -			 * Zero only the gap below the faulting page. The read
 -			 * fault populated its folio and iomap_page_mkwrite()
 -			 * will dirty it.
 -			 */
 -			err =3D exfat_prepare_valid_range(inode, zeroed_size,
 -					fault_page_start);
 -			if (err < 0) {
 -				inode_unlock(inode);
 -				return vmf_fs_error(err);
 -			}
 -		}
 -
 -		/*
 -		 * Track zeroed_size by block, not page, because writeback stops
 -		 * at i_size recording blocks wholly beyond it could skip a
 -		 * later required zeroing.
 -		 */
 -		exfat_advance_zeroed_size(ei,
 -				round_up(new_valid_size, i_blocksize(inode)));
 -		exfat_set_valid_size(ei, new_valid_size);
 -		mark_inode_dirty(inode);
 -	}
++	error =3D exfat_emergency_state(inode->i_sb);
++	if (unlikely(error))
++		return vmf_fs_error(error);
 =20
  	sb_start_pagefault(inode->i_sb);
 -	file_update_time(vmf->vma->vm_file);
 +	error =3D file_update_time(vmf->vma->vm_file);
 +	if (error) {
 +		ret =3D vmf_fs_error(error);
 +		goto out_pagefault;
 +	}
 +	filemap_invalidate_lock_shared(mapping);
 +
 +	if (folio->mapping !=3D mapping || fault_start >=3D i_size_read(inode)) {
 +		ret =3D VM_FAULT_NOPAGE;
 +		goto out_unlock;
 +	}
 +
 +	/* The faulting folio is already populated; initialize only its gap. */
 +	gap_start =3D max(exfat_get_valid_size(ei), exfat_get_zeroed_size(ei));
 +	error =3D exfat_prepare_range(inode, gap_start, fault_start, true);
 +	if (error) {
 +		ret =3D vmf_fs_error(error);
 +		goto out_unlock;
 +	}
 =20
 -	filemap_invalidate_lock_shared(inode->i_mapping);
  	ret =3D iomap_page_mkwrite(vmf, exfat_iomap_next, NULL);
 -	filemap_invalidate_unlock_shared(inode->i_mapping);
 +	if (ret =3D=3D VM_FAULT_LOCKED) {
 +		/* Buffered write may have grown EOF before we locked the folio. */
 +		new_valid_size =3D min(folio_next_pos(folio), i_size_read(inode));
 +		exfat_advance_zeroed_size(ei,
 +				round_up(new_valid_size, i_blocksize(inode)));
 +		if (exfat_advance_valid_size(ei, new_valid_size))
 +			mark_inode_dirty(inode);
 +	}
 +out_unlock:
 +	filemap_invalidate_unlock_shared(mapping);
 +out_pagefault:
  	sb_end_pagefault(inode->i_sb);
 -	inode_unlock(inode);
 =20
  	return ret;
  }

--RvYcReLTk4/oCryJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9pjcACgkQJNaLcl1U
h9CRNQf9HRwh6WivFmXClDihSkALarqzK6aq62JMV6DDbAK2m4r0X7DtC/7qOF2s
TMWyIiJzaQT61qfrjvSaQv5y+mvQesCil8vzPwz/S6q4XnH2p1ccKS9O/JfNZZNH
D5rafqw22q2PlAhnDWBX3DEIhXOCPShAt/HsB+MKuItT/Uj+RjimrESv1My3ChAL
AgbZKp4qFs+HHHCrxvkJdT+rPTCslsCk4MV4oASyMITMkzbfO7ou+aDHbls8icMa
QnCXLyYpkF7xfYGpcS+tZUFfyAxR7FctMXvONGC2FXWSA/7c4zqD1AwlSNfRBDXp
qXOb8Amf8m9FcHgLxRcuD8bD/TLLoA==
=iFxA
-----END PGP SIGNATURE-----

--RvYcReLTk4/oCryJ--
