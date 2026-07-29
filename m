Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC9B484256;
	Wed, 29 Jul 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328231; cv=none; b=uXNf2dDA1cV/xPemeoXreYQijr6AmaKZTPf4mR7ZLBuvBXkdouwm+sWVIE5gYCGZiPzvb9Gzggrao47dw+i3gDdE3J4IkDLDii3W5Pr+2feZoKdVDWDTPh55QkGMqIgA2CD0TtgcrYBTtjPK9Ujk0eVSuT6wyiSxMNh32jE1w7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328231; c=relaxed/simple;
	bh=MbR6UDESSLtGBLb4sb9Q8zR6IQ44xac7oeKBVF/rxmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bq6nNifn3UNvqvoHeJUsz4HudpJPLVjE++00xBs7ega+Vl+l7UJbqxqXKecgfA+ycjCjW4HUD+Yi5kljoIq7K3wgMc1QJS5ekD8XNSg+3O3zeJv69Ie86tW1qeCIg+2jVTZYDj50U9Yde7cz58rmLOAQ3Px2ZCWjpCR8Z6m4f38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYnKBtW3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYnKBtW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357671F00A3E;
	Wed, 29 Jul 2026 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785328224;
	bh=XY2FM6F3XZVcM7QCy/UUnX9/oZ1eptOu47KmKrok/LM=;
	h=Date:From:To:Cc:Subject;
	b=mYnKBtW3L8B8QsLZXuZ7iQfovsTU8lPVhNl2WDA5VTps0SPuZ2KcpTxu0iK8jjgkZ
	 ZEWaExh3eepJzCkhN5/81GSqwI5ow5crnVSNqPxdUsqAGbJ3AjTVXh8j4gk0M3jZHI
	 xkw2Tzz61qtNFLPPszz/Q7h5RcI5wUuun1GT/qM2iF6MSbouZN6gskrFc13gL02OHb
	 qTmFjkzHPqzaLUSD56lgziqDgUSDvrjqFcLYofUdt5hr9F9S1nF/bc3JcmKR7PlQ/K
	 04r2fRreFflcVaW5U5xkzYZoAvB8kUIIjXU0iVEvTIaZM1b+xmkszMzYnrkQTbes+m
	 T2W4siSGfv+xg==
Date: Wed, 29 Jul 2026 13:30:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the gfs2 tree
Message-ID: <amnyXEARrAoFoPAj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SrBFfthJ5cmtR3XP"
Content-Disposition: inline


--SrBFfthJ5cmtR3XP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/gfs2/glock.c

between commit:

  da26828b82a45 ("gfs2: Remove the glock lru list and shrinker")

=66rom the gfs2 tree and commit:

  21a8e80682781 ("lockref: tidy up dead count handling")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/gfs2/glock.c
index 558c8c660a3d4,eaa2980051ed5..0000000000000
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@@ -66,6 -66,9 +66,6 @@@ static void request_demote(struct gfs2_
  			   unsigned long delay, bool remote);
 =20
  static struct dentry *gfs2_root;
 -static LIST_HEAD(lru_list);
 -static atomic_t lru_count =3D ATOMIC_INIT(0);
 -static DEFINE_SPINLOCK(lru_lock);
 =20
  #define GFS2_GL_HASH_SHIFT      15
  #define GFS2_GL_HASH_SIZE       BIT(GFS2_GL_HASH_SHIFT)
@@@ -75,7 -78,6 +75,7 @@@ static const struct rhashtable_params h
  	.key_len =3D offsetofend(struct lm_lockname, ln_type),
  	.key_offset =3D offsetof(struct gfs2_glock, gl_name),
  	.head_offset =3D offsetof(struct gfs2_glock, gl_node),
 +	.automatic_shrinking =3D true,
  };
 =20
  static struct rhashtable gl_hash_table;
@@@ -155,9 -157,9 +155,9 @@@ void gfs2_glock_free(struct gfs2_glock=20
  void gfs2_glock_free_later(struct gfs2_glock *gl) {
  	struct gfs2_sbd *sdp =3D glock_sbd(gl);
 =20
 -	spin_lock(&lru_lock);
 -	list_add(&gl->gl_lru, &sdp->sd_dead_glocks);
 -	spin_unlock(&lru_lock);
 +	spin_lock(&sdp->sd_dead_lock);
 +	list_add(&gl->gl_dead, &sdp->sd_dead_glocks);
 +	spin_unlock(&sdp->sd_dead_lock);
  	if (atomic_dec_and_test(&sdp->sd_glock_disposal))
  		wake_up(&sdp->sd_kill_wait);
  }
@@@ -169,8 -171,8 +169,8 @@@ static void gfs2_free_dead_glocks(struc
  	while(!list_empty(list)) {
  		struct gfs2_glock *gl;
 =20
 -		gl =3D list_first_entry(list, struct gfs2_glock, gl_lru);
 -		list_del_init(&gl->gl_lru);
 +		gl =3D list_first_entry(list, struct gfs2_glock, gl_dead);
 +		list_del(&gl->gl_dead);
  		__gfs2_glock_free(gl);
  	}
  }
@@@ -188,6 -190,30 +188,6 @@@ struct gfs2_glock *gfs2_glock_hold(stru
  	return gl;
  }
 =20
 -static void gfs2_glock_add_to_lru(struct gfs2_glock *gl)
 -{
 -	spin_lock(&lru_lock);
 -	list_move_tail(&gl->gl_lru, &lru_list);
 -
 -	if (!test_bit(GLF_LRU, &gl->gl_flags)) {
 -		set_bit(GLF_LRU, &gl->gl_flags);
 -		atomic_inc(&lru_count);
 -	}
 -
 -	spin_unlock(&lru_lock);
 -}
 -
 -static void gfs2_glock_remove_from_lru(struct gfs2_glock *gl)
 -{
 -	spin_lock(&lru_lock);
 -	if (test_bit(GLF_LRU, &gl->gl_flags)) {
 -		list_del_init(&gl->gl_lru);
 -		atomic_dec(&lru_count);
 -		clear_bit(GLF_LRU, &gl->gl_flags);
 -	}
 -	spin_unlock(&lru_lock);
 -}
 -
  /*
   * Enqueue the glock on the work queue.  Passes one glock reference on to=
 the
   * work queue.
@@@ -214,6 -240,7 +214,6 @@@ static void __gfs2_glock_put(struct gfs
 =20
  	lockref_mark_dead(&gl->gl_lockref);
  	spin_unlock(&gl->gl_lockref.lock);
 -	gfs2_glock_remove_from_lru(gl);
  	GLOCK_BUG_ON(gl, !list_empty(&gl->gl_holders));
  	if (mapping) {
  		truncate_inode_pages_final(mapping);
@@@ -230,8 -257,8 +230,8 @@@ static bool __gfs2_glock_put_or_lock(st
  		return true;
  	GLOCK_BUG_ON(gl, gl->gl_lockref.count !=3D 1);
  	if (gl->gl_state !=3D LM_ST_UNLOCKED) {
 -		gl->gl_lockref.count--;
 -		gfs2_glock_add_to_lru(gl);
 +		request_demote(gl, LM_ST_UNLOCKED, 0, false);
 +		gfs2_glock_queue_work(gl, 0);
  		spin_unlock(&gl->gl_lockref.lock);
  		return true;
  	}
@@@ -955,19 -982,16 +955,19 @@@ static void delete_work_func(struct wor
 =20
  static void glock_work_func(struct work_struct *work)
  {
 -	unsigned long delay =3D 0;
  	struct gfs2_glock *gl =3D container_of(work, struct gfs2_glock, gl_work.=
work);
 -	unsigned int drop_refs =3D 1;
 +	unsigned int drop_refs;
 +	unsigned long delay;
 =20
  	spin_lock(&gl->gl_lockref.lock);
 +again:
 +	drop_refs =3D 1;
  	if (test_bit(GLF_HAVE_REPLY, &gl->gl_flags)) {
  		clear_bit(GLF_HAVE_REPLY, &gl->gl_flags);
  		finish_xmote(gl, gl->gl_reply);
  		drop_refs++;
  	}
 +	delay =3D 0;
  	if (test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
  	    gl->gl_state !=3D LM_ST_UNLOCKED &&
  	    gl->gl_demote_state !=3D LM_ST_EXCLUSIVE) {
@@@ -995,13 -1019,11 +995,13 @@@
  	GLOCK_BUG_ON(gl, gl->gl_lockref.count < drop_refs);
  	gl->gl_lockref.count -=3D drop_refs;
  	if (!gl->gl_lockref.count) {
 -		if (gl->gl_state =3D=3D LM_ST_UNLOCKED) {
 -			__gfs2_glock_put(gl);
 -			return;
 +		if (gl->gl_state !=3D LM_ST_UNLOCKED) {
 +			gl->gl_lockref.count++;
 +			request_demote(gl, LM_ST_UNLOCKED, 0, false);
 +			goto again;
  		}
 -		gfs2_glock_add_to_lru(gl);
 +		__gfs2_glock_put(gl);
 +		return;
  	}
  	spin_unlock(&gl->gl_lockref.lock);
  }
@@@ -1037,6 -1059,8 +1037,6 @@@ again
  out:
  	rcu_read_unlock();
  	finish_wait(wq, &wait.wait);
 -	if (gl)
 -		gfs2_glock_remove_from_lru(gl);
  	return gl;
  }
 =20
@@@ -1849,6 -1873,125 +1849,6 @@@ void gfs2_glock_complete(struct gfs2_gl
  	spin_unlock(&gl->gl_lockref.lock);
  }
 =20
 -static int glock_cmp(void *priv, const struct list_head *a,
 -		     const struct list_head *b)
 -{
 -	struct gfs2_glock *gla, *glb;
 -
 -	gla =3D list_entry(a, struct gfs2_glock, gl_lru);
 -	glb =3D list_entry(b, struct gfs2_glock, gl_lru);
 -
 -	if (glock_number(gla) > glock_number(glb))
 -		return 1;
 -	if (glock_number(gla) < glock_number(glb))
 -		return -1;
 -
 -	return 0;
 -}
 -
 -static bool can_free_glock(struct gfs2_glock *gl)
 -{
 -	struct gfs2_sbd *sdp =3D glock_sbd(gl);
 -
 -	return !test_bit(GLF_LOCK, &gl->gl_flags) &&
 -	       !gl->gl_lockref.count &&
 -	       (!test_bit(GLF_LFLUSH, &gl->gl_flags) ||
 -		test_bit(SDF_KILL, &sdp->sd_flags));
 -}
 -
 -/**
 - * gfs2_dispose_glock_lru - Demote a list of glocks
 - * @list: The list to dispose of
 - *
 - * Disposing of glocks may involve disk accesses, so that here we sort
 - * the glocks by number (i.e. disk location of the inodes) so that if
 - * there are any such accesses, they'll be sent in order (mostly).
 - *
 - * Must be called under the lru_lock, but may drop and retake this
 - * lock. While the lru_lock is dropped, entries may vanish from the
 - * list, but no new entries will appear on the list (since it is
 - * private)
 - */
 -
 -static unsigned long gfs2_dispose_glock_lru(struct list_head *list)
 -__releases(&lru_lock)
 -__acquires(&lru_lock)
 -{
 -	struct gfs2_glock *gl;
 -	unsigned long freed =3D 0;
 -
 -	list_sort(NULL, list, glock_cmp);
 -
 -	while(!list_empty(list)) {
 -		gl =3D list_first_entry(list, struct gfs2_glock, gl_lru);
 -		if (!spin_trylock(&gl->gl_lockref.lock)) {
 -add_back_to_lru:
 -			list_move(&gl->gl_lru, &lru_list);
 -			continue;
 -		}
 -		if (!can_free_glock(gl)) {
 -			spin_unlock(&gl->gl_lockref.lock);
 -			goto add_back_to_lru;
 -		}
 -		list_del_init(&gl->gl_lru);
 -		atomic_dec(&lru_count);
 -		clear_bit(GLF_LRU, &gl->gl_flags);
 -		freed++;
 -		gl->gl_lockref.count++;
 -		if (gl->gl_state !=3D LM_ST_UNLOCKED)
 -			request_demote(gl, LM_ST_UNLOCKED, 0, false);
 -		gfs2_glock_queue_work(gl, 0);
 -		spin_unlock(&gl->gl_lockref.lock);
 -		cond_resched_lock(&lru_lock);
 -	}
 -	return freed;
 -}
 -
 -/**
 - * gfs2_scan_glock_lru - Scan the LRU looking for locks to demote
 - * @nr: The number of entries to scan
 - *
 - * This function selects the entries on the LRU which are able to
 - * be demoted, and then kicks off the process by calling
 - * gfs2_dispose_glock_lru() above.
 - */
 -
 -static unsigned long gfs2_scan_glock_lru(unsigned long nr)
 -{
 -	struct gfs2_glock *gl, *next;
 -	LIST_HEAD(dispose);
 -	unsigned long freed =3D 0;
 -
 -	spin_lock(&lru_lock);
 -	list_for_each_entry_safe(gl, next, &lru_list, gl_lru) {
 -		if (!nr--)
 -			break;
 -		if (can_free_glock(gl))
 -			list_move(&gl->gl_lru, &dispose);
 -	}
 -	if (!list_empty(&dispose))
 -		freed =3D gfs2_dispose_glock_lru(&dispose);
 -	spin_unlock(&lru_lock);
 -
 -	return freed;
 -}
 -
 -static unsigned long gfs2_glock_shrink_scan(struct shrinker *shrink,
 -					    struct shrink_control *sc)
 -{
 -	if (!(sc->gfp_mask & __GFP_FS))
 -		return SHRINK_STOP;
 -	return gfs2_scan_glock_lru(sc->nr_to_scan);
 -}
 -
 -static unsigned long gfs2_glock_shrink_count(struct shrinker *shrink,
 -					     struct shrink_control *sc)
 -{
 -	return vfs_pressure_ratio(atomic_read(&lru_count));
 -}
 -
 -static struct shrinker *glock_shrinker;
 -
  /**
   * glock_hash_walk - Call a function for glock in a hash bucket
   * @examiner: the function
@@@ -1919,12 -2062,33 +1919,12 @@@ static void thaw_glock(struct gfs2_gloc
  	if (!lockref_get_not_dead(&gl->gl_lockref))
  		return;
 =20
 -	gfs2_glock_remove_from_lru(gl);
  	spin_lock(&gl->gl_lockref.lock);
  	set_bit(GLF_HAVE_REPLY, &gl->gl_flags);
  	gfs2_glock_queue_work(gl, 0);
  	spin_unlock(&gl->gl_lockref.lock);
  }
 =20
 -/**
 - * clear_glock - look at a glock and see if we can free it from glock cac=
he
 - * @gl: the glock to look at
 - *
 - */
 -
 -static void clear_glock(struct gfs2_glock *gl)
 -{
 -	gfs2_glock_remove_from_lru(gl);
 -
 -	spin_lock(&gl->gl_lockref.lock);
 -	if (!lockref_is_dead(&gl->gl_lockref)) {
 -		gl->gl_lockref.count++;
 -		if (gl->gl_state !=3D LM_ST_UNLOCKED)
 -			request_demote(gl, LM_ST_UNLOCKED, 0, false);
 -		gfs2_glock_queue_work(gl, 0);
 -	}
 -	spin_unlock(&gl->gl_lockref.lock);
 -}
 -
  /**
   * gfs2_glock_thaw - Thaw any frozen glocks
   * @sdp: The super block
@@@ -1951,7 -2115,7 +1951,7 @@@ static void dump_glock_func(struct gfs2
  static void withdraw_glock(struct gfs2_glock *gl)
  {
  	spin_lock(&gl->gl_lockref.lock);
- 	if (!__lockref_is_dead(&gl->gl_lockref)) {
+ 	if (!lockref_is_dead(&gl->gl_lockref)) {
  		/*
  		 * We don't want to write back any more dirty data.  Unlock the
  		 * remaining inode and resource group glocks; this will cause
@@@ -1971,17 -2135,22 +1971,17 @@@ void gfs2_withdraw_glocks(struct gfs2_s
  }
 =20
  /**
 - * gfs2_gl_hash_clear - Empty out the glock hash table
 + * gfs2_wait_glocks - Wait for the remaining glocks to go away
   * @sdp: the filesystem
   *
   * Called when unmounting the filesystem.
   */
 =20
 -void gfs2_gl_hash_clear(struct gfs2_sbd *sdp)
 +void gfs2_wait_glocks(struct gfs2_sbd *sdp)
  {
  	unsigned long start =3D jiffies;
  	bool timed_out =3D false;
 =20
 -	set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
 -	flush_workqueue(sdp->sd_glock_wq);
 -	glock_hash_walk(clear_glock, sdp);
 -	flush_workqueue(sdp->sd_glock_wq);
 -
  	while (!timed_out) {
  		wait_event_timeout(sdp->sd_kill_wait,
  				   !atomic_read(&sdp->sd_glock_disposal),
@@@ -2104,6 -2273,8 +2104,6 @@@ static const char *gflags2str(char *buf
  		*p++ =3D 'F';
  	if (!list_empty(&gl->gl_holders))
  		*p++ =3D 'q';
 -	if (test_bit(GLF_LRU, gflags))
 -		*p++ =3D 'L';
  	if (gl->gl_object)
  		*p++ =3D 'o';
  	if (test_bit(GLF_BLOCKING, gflags))
@@@ -2263,6 -2434,17 +2263,6 @@@ int __init gfs2_glock_init(void
  	if (ret < 0)
  		return ret;
 =20
 -	glock_shrinker =3D shrinker_alloc(0, "gfs2-glock");
 -	if (!glock_shrinker) {
 -		rhashtable_destroy(&gl_hash_table);
 -		return -ENOMEM;
 -	}
 -
 -	glock_shrinker->count_objects =3D gfs2_glock_shrink_count;
 -	glock_shrinker->scan_objects =3D gfs2_glock_shrink_scan;
 -
 -	shrinker_register(glock_shrinker);
 -
  	for (i =3D 0; i < GLOCK_WAIT_TABLE_SIZE; i++)
  		init_waitqueue_head(glock_wait_table + i);
 =20
@@@ -2271,6 -2453,7 +2271,6 @@@
 =20
  void gfs2_glock_exit(void)
  {
 -	shrinker_free(glock_shrinker);
  	rhashtable_destroy(&gl_hash_table);
  }
 =20
@@@ -2300,7 -2483,7 +2300,7 @@@ static void gfs2_glock_iter_next(struc
  				continue;
  			break;
  		} else {
- 			if (__lockref_is_dead(&gl->gl_lockref))
+ 			if (lockref_is_dead(&gl->gl_lockref))
  				continue;
  			n--;
  		}

--SrBFfthJ5cmtR3XP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpp8lsACgkQJNaLcl1U
h9AW6gf/TZikhR0+PBuBk/rZMDR2c9K6x++ndkQyG1BxvW5o7WqiuOGtCu0hyy/j
1XSSuNVkRKsjQwxTlj81Hj/SV8pBPFACp0H1UXYnLn6Q1NEeEqwCjwcuOpA5SrJx
u8cvfDFd/lZmyzpC48LIt8CB9f98BXQavuwXwkCBrLpGQ9fRVWVgEXgnYrxxWies
tKS1MmM39ohH1xWl7y9UC4xvfFwV4mJ5v1DstDGTln64/PnXjz3nDWu7joFbh6p5
VZgx5AEZal3kt94C8z95yVEvUOQFWPCVwaau9JVZ/XKQqUOlJWTfWBNlhnHQhPKf
l3y4UBQOq93bjCDy4tHmwHn2GWuQQg==
=vuZu
-----END PGP SIGNATURE-----

--SrBFfthJ5cmtR3XP--
