Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3338344DA8;
	Tue,  2 Jun 2026 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404118; cv=none; b=h6LCp1y12L1QWU5h9Nq0eba3X9uO/RaLjOqCM+8/O4nL8RCMm4vNquIHhjXXsVgW4hm/3huLNU7yc9xa9Hdf6SUqa/aq15NkRoABYxviuCtZJfNY6afRFj5QNFRBy+Y7SPZKa5FbE3J3VX/xW+VvjghNXSuWawQ+PAQ9PFSZX84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404118; c=relaxed/simple;
	bh=cSVW1bKDmbZz8FQTR/w/impbzSBn7sF9Ilsb2hhr+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCfsZQ/zh8hNMHiTUPRUVOb9/1y1QH9g7w+w2VprOploVWiRb7/kxAaZmwFf5b2d3bjdkGbCiofwy+LPoQKWwyCuMbG1chTaMVF/OScrpF2+uBqiVYeGyP++1/cxsWMPtr3+ZdR6rTg1i6XHySNchdgzlcCqZ/osE3Ac5tDZC6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv93hJgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv93hJgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D241F00893;
	Tue,  2 Jun 2026 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404117;
	bh=ledEAKyZfBj5MA332vqazcOcw4KSvNCWiLIenF6npeM=;
	h=Date:From:To:Cc:Subject;
	b=Yv93hJgIB4ImlKN0Z05a9EPFuk4PVUHVB5HjlO8FYXvTRnWpOZB+U+PtaDqdIwDZB
	 rQYChy+7AVojNpZl96Pzq8k/vI5v1MUshim1ZeDAF6TkBNPbZzUMdNz7JCpD2kD504
	 AdoQleh32klDgtddPpVvxLp0U1aBisAG9TZE/+3k8a9vaNhwTpudkR/P7vK5fXdr7m
	 AYC+R5fAnxVaRTDBGo1gSD8n7ln+TSy0D5HOdLFZJCeOZ6e5WRtEQI654KXfcMNh54
	 Xy/Kr1avquBfTC9nBhqpTXyVzV8HLNYHzJQWDXYKYMT9KmOFyVH0I/zPS4K+00I3i4
	 5G1jAWwp36YEw==
Date: Tue, 2 Jun 2026 13:41:52 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	KangNing Liao <lkangn.kernel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <ah7PkPBnQ9jOkBQS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnMxQ7gQrRc/JoTd"
Content-Disposition: inline


--MnMxQ7gQrRc/JoTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/zoned.c

between commits:

  c4dbdc9e2c61b ("btrfs: protect sb_write_pointer() with invalidate lock")
  e67ae2bce5703 ("btrfs: use mapping shared locking for reading super block=
")

=66rom the btrfs tree and commit:

  6cfd0b77103ae ("btrfs: protect sb_write_pointer() with invalidate lock")

=66rom the btrfs-fixes tree - there's a commit that's been duplicated in
the two trees there.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/zoned.c
index 5f75cf0e14b95,0f87701e38e34..0000000000000
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@@ -131,10 -131,10 +131,10 @@@ static int sb_write_pointer(struct bloc
  			u64 bytenr =3D ALIGN_DOWN(zone_end, BTRFS_SUPER_INFO_SIZE) -
  						BTRFS_SUPER_INFO_SIZE;
 =20
- 			filemap_invalidate_lock(mapping);
+ 			filemap_invalidate_lock_shared(mapping);
  			page[i] =3D read_cache_page_gfp(mapping,
  					bytenr >> PAGE_SHIFT, GFP_NOFS);
- 			filemap_invalidate_unlock(mapping);
+ 			filemap_invalidate_unlock_shared(mapping);
  			if (IS_ERR(page[i])) {
  				if (i =3D=3D 1)
  					btrfs_release_disk_super(super[0]);
@@@ -356,12 -356,33 +356,33 @@@ int btrfs_get_dev_zone_info_all_devices
  	return ret;
  }
 =20
+ static int btrfs_get_max_active_zones(struct btrfs_device *device,
+ 				      struct btrfs_zoned_device_info *zone_info)
+ {
+ 	struct block_device *bdev =3D device->bdev;
+ 	int max_active_zones;
+=20
+ 	if (unlikely(zone_info->nr_zones < BTRFS_MIN_ACTIVE_ZONES)) {
+ 		btrfs_err(device->fs_info, "zoned: not enough zones to mount filesystem=
: %u < %d",
+ 			  zone_info->nr_zones, BTRFS_MIN_ACTIVE_ZONES);
+ 		return -EINVAL;
+ 	}
+=20
+ 	max_active_zones =3D min_not_zero(bdev_max_active_zones(bdev),
+ 					bdev_max_open_zones(bdev));
+ 	if (max_active_zones =3D=3D 0)
+ 		max_active_zones =3D min(zone_info->nr_zones / 4,
+ 				       BTRFS_DEFAULT_MAX_ACTIVE_ZONES);
+=20
+ 	zone_info->max_active_zones =3D max(max_active_zones, BTRFS_MIN_ACTIVE_Z=
ONES);
+ 	return 0;
+ }
+=20
  int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_ca=
che)
  {
  	struct btrfs_fs_info *fs_info =3D device->fs_info;
  	struct btrfs_zoned_device_info *zone_info =3D NULL;
  	struct block_device *bdev =3D device->bdev;
- 	unsigned int max_active_zones;
  	unsigned int nactive;
  	sector_t nr_sectors;
  	sector_t sector =3D 0;
@@@ -426,19 -447,9 +447,9 @@@
  	if (!IS_ALIGNED(nr_sectors, zone_sectors))
  		zone_info->nr_zones++;
 =20
- 	max_active_zones =3D min_not_zero(bdev_max_active_zones(bdev),
- 					bdev_max_open_zones(bdev));
- 	if (!max_active_zones && zone_info->nr_zones > BTRFS_DEFAULT_MAX_ACTIVE_=
ZONES)
- 		max_active_zones =3D BTRFS_DEFAULT_MAX_ACTIVE_ZONES;
- 	if (max_active_zones && max_active_zones < BTRFS_MIN_ACTIVE_ZONES) {
- 		btrfs_err(fs_info,
- "zoned: %s: max active zones %u is too small, need at least %u active zon=
es",
- 				 rcu_dereference(device->name), max_active_zones,
- 				 BTRFS_MIN_ACTIVE_ZONES);
- 		ret =3D -EINVAL;
+ 	ret =3D btrfs_get_max_active_zones(device, zone_info);
+ 	if (ret)
  		goto out;
- 	}
- 	zone_info->max_active_zones =3D max_active_zones;
 =20
  	zone_info->seq_zones =3D bitmap_zalloc(zone_info->nr_zones, GFP_KERNEL);
  	if (!zone_info->seq_zones) {
@@@ -519,26 -530,29 +530,29 @@@
  		goto out;
  	}
 =20
- 	if (max_active_zones) {
- 		if (unlikely(nactive > max_active_zones)) {
- 			if (bdev_max_active_zones(bdev) =3D=3D 0) {
- 				max_active_zones =3D 0;
- 				zone_info->max_active_zones =3D 0;
- 				goto validate;
- 			}
+ 	if (unlikely(nactive > zone_info->max_active_zones)) {
+ 		if (bdev_max_active_zones(bdev) > 0) {
  			btrfs_err(device->fs_info,
- 			"zoned: %u active zones on %s exceeds max_active_zones %u",
- 					 nactive, rcu_dereference(device->name),
- 					 max_active_zones);
+ 					"zoned: %u active zones on %s exceeds max_active_zones %u",
+ 					nactive, rcu_dereference(device->name),
+ 					zone_info->max_active_zones);
  			ret =3D -EIO;
  			goto out;
  		}
+=20
+ 		/*
+ 		 * This is for backward compatibility with old filesystems that
+ 		 * have a lot of active zones because the device doesn't report
+ 		 * a maximum number of zones and we previously didn't care for
+ 		 * the limit.
+ 		 */
+ 		zone_info->max_active_zones =3D 0;
+ 	} else {
  		atomic_set(&zone_info->active_zones_left,
- 			   max_active_zones - nactive);
+ 				zone_info->max_active_zones - nactive);
  		set_bit(BTRFS_FS_ACTIVE_ZONE_TRACKING, &fs_info->flags);
  	}
 =20
- validate:
  	/* Validate superblock log */
  	nr_zones =3D BTRFS_NR_SB_LOG_ZONES;
  	for (i =3D 0; i < BTRFS_SUPER_MIRROR_MAX; i++) {
@@@ -1313,7 -1327,7 +1327,7 @@@ static int btrfs_load_zone_info(struct=20
  {
  	struct btrfs_dev_replace *dev_replace =3D &fs_info->dev_replace;
  	struct btrfs_device *device;
- 	int dev_replace_is_ongoing =3D 0;
+ 	bool dev_replace_is_ongoing =3D false;
  	unsigned int nofs_flag;
  	struct blk_zone zone;
  	int ret;
@@@ -2765,7 -2779,6 +2779,6 @@@ void btrfs_zoned_reserve_data_reloc_bg(
  	struct btrfs_block_group *bg;
  	struct list_head *bg_list;
  	u64 alloc_flags;
- 	bool first =3D true;
  	bool did_chunk_alloc =3D false;
  	int index;
  	int ret;
@@@ -2782,18 -2795,13 +2795,13 @@@
  	alloc_flags =3D btrfs_get_alloc_profile(fs_info, space_info->flags);
  	index =3D btrfs_bg_flags_to_raid_index(alloc_flags);
 =20
- 	/* Scan the data space_info to find empty block groups. Take the second =
one. */
  again:
  	bg_list =3D &space_info->block_groups[index];
  	list_for_each_entry(bg, bg_list, list) {
+=20
  		if (bg->alloc_offset !=3D 0)
  			continue;
 =20
- 		if (first) {
- 			first =3D false;
- 			continue;
- 		}
-=20
  		if (space_info =3D=3D data_sinfo) {
  			/* Migrate the block group to the data relocation space_info. */
  			struct btrfs_space_info *reloc_sinfo =3D data_sinfo->sub_group[0];
@@@ -2851,7 -2859,6 +2859,6 @@@
  		 * We allocated a new block group in the data relocation space_info. We
  		 * can take that one.
  		 */
- 		first =3D false;
  		did_chunk_alloc =3D true;
  		goto again;
  	}

--MnMxQ7gQrRc/JoTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoez5AACgkQJNaLcl1U
h9Awiwf+PjyM5XAXHN3NLtYrB9POisBeIfBxRRoBWisgXDZlohMpzJ64HF+CPTPl
668URoYprEI+KrjkKHHrvLX+lkM5MlciVbFS2IF+9gkiAsFHZK74npt0BQ444C97
SjKOa4/qzvv2vF0khcw1fcOyELyEHv754l3TcmAO0urin7+I+ZKRuasuNSUK7INN
uDxIvBIzpdO3X+v3vDvuDWDezoFpu/FTCVJWjRkgPwgSwtdgA0xqmc01bfeXuzZZ
0lRPNTp9qKqWZhD1qA7hIkgPS7rBqrHaaouK55veZyzXxDGNFt2DIBz94TZSsAEx
HzhR5vtKCreNJm66fcKrp6MBB2WFxw==
=HI1X
-----END PGP SIGNATURE-----

--MnMxQ7gQrRc/JoTd--
