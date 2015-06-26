From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ceph tree
Date: Fri, 26 Jun 2015 11:17:55 +1000
Message-ID: <20150626111755.5f0635bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c=vfOSRAx4M/AHf.7/eR1hz"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32822 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbbFZBSE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2015 21:18:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Yan, Zheng" <zyan@redhat.com>, Ilya Dryomov <idryomov@gmail.com>

--Sig_/c=vfOSRAx4M/AHf.7/eR1hz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ceph/dir.c

between commit:

  fdd4e15838e5 ("ceph: rework dcache readdir")

from the ceph tree and commit:

  dc3f4198eac1 ("make simple_positive() public")

from the vfs tree.

I fixed it up (I think - see below) and can carry the fix as necessary (no =
action
is required).

Sage: that ceph tree commit has no Signed-off-by from its
committer :-(  The same is true for almost all the commits in the ceph
tree ... and the committer (Ilya) is not listed as a maintainer of that
tree ... and its on github :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ceph/dir.c
index 9314b4ea2375,edbb8da02a6a..000000000000
--- a/fs/ceph/dir.c
+++ b/fs/ceph/dir.c
@@@ -144,110 -123,101 +144,110 @@@ static int __dcache_readdir(struct fil
  	struct ceph_file_info *fi =3D file->private_data;
  	struct dentry *parent =3D file->f_path.dentry;
  	struct inode *dir =3D d_inode(parent);
 -	struct list_head *p;
 -	struct dentry *dentry, *last;
 +	struct dentry *dentry, *last =3D NULL;
  	struct ceph_dentry_info *di;
 +	unsigned nsize =3D PAGE_CACHE_SIZE / sizeof(struct dentry *);
  	int err =3D 0;
 +	loff_t ptr_pos =3D 0;
 +	struct ceph_readdir_cache_control cache_ctl =3D {};
 =20
 -	/* claim ref on last dentry we returned */
 -	last =3D fi->dentry;
 -	fi->dentry =3D NULL;
 -
 -	dout("__dcache_readdir %p v%u at %llu (last %p)\n",
 -	     dir, shared_gen, ctx->pos, last);
 +	dout("__dcache_readdir %p v%u at %llu\n", dir, shared_gen, ctx->pos);
 =20
 -	spin_lock(&parent->d_lock);
 -
 -	/* start at beginning? */
 -	if (ctx->pos =3D=3D 2 || last =3D=3D NULL ||
 -	    fpos_cmp(ctx->pos, ceph_dentry(last)->offset) < 0) {
 -		if (list_empty(&parent->d_subdirs))
 -			goto out_unlock;
 -		p =3D parent->d_subdirs.prev;
 -		dout(" initial p %p/%p\n", p->prev, p->next);
 -	} else {
 -		p =3D last->d_child.prev;
 +	/* we can calculate cache index for the first dirfrag */
 +	if (ceph_frag_is_leftmost(fpos_frag(ctx->pos))) {
 +		cache_ctl.index =3D fpos_off(ctx->pos) - 2;
 +		BUG_ON(cache_ctl.index < 0);
 +		ptr_pos =3D cache_ctl.index * sizeof(struct dentry *);
  	}
 =20
 -more:
 -	dentry =3D list_entry(p, struct dentry, d_child);
 -	di =3D ceph_dentry(dentry);
 -	while (1) {
 -		dout(" p %p/%p %s d_subdirs %p/%p\n", p->prev, p->next,
 -		     d_unhashed(dentry) ? "!hashed" : "hashed",
 -		     parent->d_subdirs.prev, parent->d_subdirs.next);
 -		if (p =3D=3D &parent->d_subdirs) {
 +	while (true) {
 +		pgoff_t pgoff;
 +		bool emit_dentry;
 +
 +		if (ptr_pos >=3D i_size_read(dir)) {
  			fi->flags |=3D CEPH_F_ATEND;
 -			goto out_unlock;
 +			err =3D 0;
 +			break;
 +		}
 +
 +		err =3D -EAGAIN;
 +		pgoff =3D ptr_pos >> PAGE_CACHE_SHIFT;
 +		if (!cache_ctl.page || pgoff !=3D page_index(cache_ctl.page)) {
 +			ceph_readdir_cache_release(&cache_ctl);
 +			cache_ctl.page =3D find_lock_page(&dir->i_data, pgoff);
 +			if (!cache_ctl.page) {
 +				dout(" page %lu not found\n", pgoff);
 +				break;
 +			}
 +			/* reading/filling the cache are serialized by
 +			 * i_mutex, no need to use page lock */
 +			unlock_page(cache_ctl.page);
 +			cache_ctl.dentries =3D kmap(cache_ctl.page);
  		}
 -		spin_lock_nested(&dentry->d_lock, DENTRY_D_LOCK_NESTED);
 +
 +		rcu_read_lock();
 +		spin_lock(&parent->d_lock);
 +		/* check i_size again here, because empty directory can be
 +		 * marked as complete while not holding the i_mutex. */
 +		if (ceph_dir_is_complete_ordered(dir) &&
 +		    ptr_pos < i_size_read(dir))
 +			dentry =3D cache_ctl.dentries[cache_ctl.index % nsize];
 +		else
 +			dentry =3D NULL;
 +		spin_unlock(&parent->d_lock);
 +		if (dentry && !lockref_get_not_dead(&dentry->d_lockref))
 +			dentry =3D NULL;
 +		rcu_read_unlock();
 +		if (!dentry)
 +			break;
 +
 +		emit_dentry =3D false;
 +		di =3D ceph_dentry(dentry);
 +		spin_lock(&dentry->d_lock);
  		if (di->lease_shared_gen =3D=3D shared_gen &&
- 		    d_really_is_positive(dentry) &&
+ 		    simple_positive(dentry) &&
  		    ceph_snap(d_inode(dentry)) !=3D CEPH_SNAPDIR &&
  		    ceph_ino(d_inode(dentry)) !=3D CEPH_INO_CEPH &&
 -		    fpos_cmp(ctx->pos, di->offset) <=3D 0)
 -			break;
 -		dout(" skipping %p %pd at %llu (%llu)%s%s\n", dentry,
 -		     dentry, di->offset,
 -		     ctx->pos, d_unhashed(dentry) ? " unhashed" : "",
 -		     !d_inode(dentry) ? " null" : "");
 +		    fpos_cmp(ctx->pos, di->offset) <=3D 0) {
 +			emit_dentry =3D true;
 +		}
  		spin_unlock(&dentry->d_lock);
 -		p =3D p->prev;
 -		dentry =3D list_entry(p, struct dentry, d_child);
 -		di =3D ceph_dentry(dentry);
 -	}
 -
 -	dget_dlock(dentry);
 -	spin_unlock(&dentry->d_lock);
 -	spin_unlock(&parent->d_lock);
 =20
 -	/* make sure a dentry wasn't dropped while we didn't have parent lock */
 -	if (!ceph_dir_is_complete_ordered(dir)) {
 -		dout(" lost dir complete on %p; falling back to mds\n", dir);
 -		dput(dentry);
 -		err =3D -EAGAIN;
 -		goto out;
 -	}
 +		if (emit_dentry) {
 +			dout(" %llu (%llu) dentry %p %pd %p\n", di->offset, ctx->pos,
 +			     dentry, dentry, d_inode(dentry));
 +			ctx->pos =3D di->offset;
 +			if (!dir_emit(ctx, dentry->d_name.name,
 +				      dentry->d_name.len,
 +				      ceph_translate_ino(dentry->d_sb,
 +							 d_inode(dentry)->i_ino),
 +				      d_inode(dentry)->i_mode >> 12)) {
 +				dput(dentry);
 +				err =3D 0;
 +				break;
 +			}
 +			ctx->pos++;
 =20
 -	dout(" %llu (%llu) dentry %p %pd %p\n", di->offset, ctx->pos,
 -	     dentry, dentry, d_inode(dentry));
 -	if (!dir_emit(ctx, dentry->d_name.name,
 -		      dentry->d_name.len,
 -		      ceph_translate_ino(dentry->d_sb, d_inode(dentry)->i_ino),
 -		      d_inode(dentry)->i_mode >> 12)) {
 -		if (last) {
 -			/* remember our position */
 -			fi->dentry =3D last;
 -			fi->next_offset =3D fpos_off(di->offset);
 +			if (last)
 +				dput(last);
 +			last =3D dentry;
 +		} else {
 +			dput(dentry);
  		}
 -		dput(dentry);
 -		return 0;
 -	}
 -
 -	ctx->pos =3D di->offset + 1;
 =20
 -	if (last)
 -		dput(last);
 -	last =3D dentry;
 -
 -	spin_lock(&parent->d_lock);
 -	p =3D p->prev;	/* advance to next dentry */
 -	goto more;
 -
 -out_unlock:
 -	spin_unlock(&parent->d_lock);
 -out:
 -	if (last)
 +		cache_ctl.index++;
 +		ptr_pos +=3D sizeof(struct dentry *);
 +	}
 +	ceph_readdir_cache_release(&cache_ctl);
 +	if (last) {
 +		int ret;
 +		di =3D ceph_dentry(last);
 +		ret =3D note_last_dentry(fi, last->d_name.name, last->d_name.len,
 +				       fpos_off(di->offset) + 1);
 +		if (ret < 0)
 +			err =3D ret;
  		dput(last);
 +	}
  	return err;
  }
 =20

--Sig_/c=vfOSRAx4M/AHf.7/eR1hz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjKhIAAoJEMDTa8Ir7ZwVfPoP/0SrgpaVNT1Yn8/u6sLj8LWH
Xz0rgCrvwc7lFEct2iEmup/q1nnwqU2HyWn40Lnd3xtc8YLmqc04FJDQylIfgmg/
zccG6yfzRB9N5MmLrEP17DwbdLsYr1IsXuCKnXwkk/WP1/zhJ9dfTiZ1eJbSBBrt
WTJ9b0l0n9zu0llChrM6jsYMk8PMyanT+3rzzxNYCx/hY8xypYRyVY4dDkgZ35PD
St0kDyLc8xw6etXUq+zi6rD/J64FWh6SYCGswTwGXH3/8cttiUmLe4vOuncIiDmN
BDW/XRrrRB7ARn22grkMWdsPfASRwjBccPHjr8Jkhby5sJAUOGS9ysj5+tFH6fEB
kY74PXjaSsFd5nLMVyySU5pdnhothjuLDR72YzM/cbuj0AjZGiv85PUasGhrgacA
753szl1PoOIgLSHBw4yVCyyfmcRFUEn+k9wCmpaJyiMIvyGbxfaAdZp6StKvySji
8MUM54uEd0CveGzgEcH/eLYgK3R78IVRLqz+Rh6LKsPtBKYyS9q85191fQaJ92ud
R26qc5XhrcJYqSRUt+APOV8eVsDHzl8kzFyqearFjRB+z49cqfXZ/jcI4ONxpE4j
otnhTNIGuFoBAnaYnIFWHshDkNuGSEyhG9fV4Qxn35cQTbSDSkmAlZXoFjBjrxk/
4wPUFHLkTkQxk25CdCzQ
=uP6E
-----END PGP SIGNATURE-----

--Sig_/c=vfOSRAx4M/AHf.7/eR1hz--
