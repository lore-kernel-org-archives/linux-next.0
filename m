Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526555;
	b=LGegQ/Of2E9k/CfReX8ZAj5Gw0HY0DQiwDtYBherHcVPsUZupXvGNaZtD/sCfOLno6sR
	 qGrSilsIndy28DsoxDvHpgoGDw+6ZAI+g2xHyJIhgSsr2EaIFkx9NjyUMBuhAm17K5LuT
	 mDkPv2noU1bZZhjBOxo62j1iXGNv4BILHXVnbJHWVJXHzPtBH+Ro3csUDnsfCzuNoek7M
	 vYhXmMUjVZOy/+mFhdLD634ZpLmloZyxILRgiPxhZbRtqlATUBXK9zVWi/FtLHkaakxM1
	 veCRSoOYqwOWmg6hC6h4zSA64/7HFtbVUIdmbtO4fcQ/ArQH0XRZUqVnvN99CnN7EBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526555;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=U7T0S/zSnHw0AiIgcNjbTiMnKLishIj+Ufyy+y3cviA=;
	b=sPiszaxP43iDofRy8xc77VXbe4o6kpTH/W7IhW5mXzvdrseJO2Jnixp6p9PwI5mKAtnh
	 BvEYtWqaev85mf2rOZUkuykC+CW2xOsx4V5Xz+lh03uJ8NpiNimL59h86aKyg7SNSLB2c
	 Qin3VnA6rmElSmj7KFSALPCmjBVbUXdnqhvYnz/FOiJ2DXoTRH8u45CSXbCUBkllpuH1y
	 EwWYCG7oTzIrNBvNca4Mytcw8nyNjWGBSMQfPSeWgLOJY+sYxOKt7CIWGbf5UagqpV2jI
	 fYCRnQw7fuQKcqqGibXb5p4s2r2u1vcGTkRGwqFhRmcG+eO1gDkyI+rjxatqXUxbOPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTGqKfmD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F8606A31E;
	Tue, 24 Nov 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTGqKfmD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E291F000C6;
	Tue, 24 Nov 2026 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526555;
	bh=U7T0S/zSnHw0AiIgcNjbTiMnKLishIj+Ufyy+y3cviA=;
	h=Date:From:To:Cc:Subject;
	b=BTGqKfmD4dWqfi5mhLB1k6yDvP59Iioolz0BYIqmaX4ETXLZ9APy0l9dPiCwSNkFD
	 YJHWoQXnN89NVePoddaLqSFQAh16BNDVhx8tRktyV0Me0PA2XvaF545d4w5yI/5l1k
	 H1+t4JYqQNvGjPu5dwV2AAJ8k9lTaTJ/6bTJWKpXEKwtTMLi7amF3tYjqNM68cwsAE
	 WwRCamKGxBQhQIX8zZD2ZvBSkRVaG8XuQsTSRGXfr6QcyEsx/A1QgFa2hTrq1PQzDo
	 /7xeyLx7UYxwUmoxfW2st/iWtKvD4Li3T1pfxKP9XePq+S8F1zpUIgJ7w72gln5e7t
	 2P0Xa1mleSkaw==
Date: Tue, 24 Nov 2026 13:22:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with the origin tree
Message-ID: <awWPl-g8O7lOErwL@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="Z7hV9Kl1koG5X2Qa"
Content-Disposition: inline


--Z7hV9Kl1koG5X2Qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/inode.c

between commit:

  9e8fc16dc6b47 ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")
  d25c14b2d79e4 ("ext4: use sb_find_get_block_nonatomic() in ext4_get_inode=
_loc_noio()")

=66rom the origin tree and commit:

  3ca8192f79504 ("ext4: expand KUnit tests for fs/ext4/inode.c")

=66rom the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/inode.c
index e3129353d4edb,9368a68db2894..0000000000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -1091,6 -1117,29 +1112,37 @@@ EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_get_bl
  /* Maximum number of blocks we map for direct IO at once. */
  #define DIO_MAX_BLOCKS 4096
 =20
+ struct buffer_head *ext4_sb_getblk(struct super_block *sb, ext4_fsblk_t b=
lock)
+ {
+ 	KUNIT_STATIC_STUB_REDIRECT(ext4_sb_getblk, sb, block);
+ 	return sb_getblk(sb, block);
+ }
+ EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_sb_getblk);
+=20
+ struct buffer_head *ext4_sb_find_get_block(struct super_block *sb,
+ 					   ext4_fsblk_t block)
+ {
+ 	KUNIT_STATIC_STUB_REDIRECT(ext4_sb_find_get_block, sb, block);
+ 	return sb_find_get_block(sb, block);
+ }
+ EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_sb_find_get_block);
+=20
++struct buffer_head *ext4_sb_find_get_block_nonatomic(struct super_block *=
sb,
++						  ext4_fsblk_t block)
++{
++	KUNIT_STATIC_STUB_REDIRECT(ext4_sb_find_get_block_nonatomic, sb, block);
++	return sb_find_get_block_nonatomic(sb, block);
++}
++EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_sb_find_get_block_nonatomic);
++
+ struct buffer_head *ext4_sb_getblk_unmovable(struct super_block *sb,
+ 					     ext4_fsblk_t block)
+ {
+ 	KUNIT_STATIC_STUB_REDIRECT(ext4_sb_getblk_unmovable, sb, block);
+ 	return getblk_unmovable(sb->s_bdev, block, sb->s_blocksize);
+ }
+ EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_sb_getblk_unmovable);
+=20
  /*
   * `handle' can be NULL if create is zero
   */
@@@ -3988,8 -4088,14 +4091,10 @@@ out
 =20
  	return 0;
  }
+ EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_iomap_begin);
 =20
 -static DEFINE_IOMAP_ITER_NEXT(ext4_iomap_next, ext4_iomap_begin);
 -
 -const struct iomap_ops ext4_iomap_ops =3D {
 -	.iomap_next		=3D ext4_iomap_next,
 -};
 -EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_iomap_ops);
 +DEFINE_IOMAP_ITER_NEXT(ext4_iomap_next, ext4_iomap_begin);
++EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_iomap_next);
 =20
  static int ext4_iomap_begin_report(struct inode *inode, loff_t offset,
  				   loff_t length, unsigned int flags,
@@@ -4042,7 -4148,12 +4147,8 @@@ set_iomap
  	return 0;
  }
 =20
 -static DEFINE_IOMAP_ITER_NEXT(ext4_iomap_next_report, ext4_iomap_begin_re=
port);
 -
 -const struct iomap_ops ext4_iomap_report_ops =3D {
 -	.iomap_next =3D ext4_iomap_next_report,
 -};
 -EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_iomap_report_ops);
 +DEFINE_IOMAP_ITER_NEXT(ext4_iomap_next_report, ext4_iomap_begin_report);
++EXPORT_SYMBOL_FOR_EXT4_TEST(ext4_iomap_next_report);
 =20
  static int ext4_iomap_map_blocks(struct inode *inode, loff_t offset,
  				 loff_t length, struct ext4_map_blocks *map,
@@@ -5884,7 -6032,7 +6012,7 @@@ int ext4_get_inode_loc_noio(struct inod
  	}
  	block +=3D inode_offset / inodes_per_block;
 =20
- 	bh =3D sb_find_get_block_nonatomic(sb, block);
 -	bh =3D ext4_sb_find_get_block(sb, block);
++	bh =3D ext4_sb_find_get_block_nonatomic(sb, block);
  	if (!bh)
  		return -EAGAIN;
  	if (!ext4_buffer_uptodate(bh)) {
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bda50753b1236..5f1d452604ce2 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3335,6 +3335,8 @@ extern int ext4_issue_zeroout(handle_t *handle, struc=
t inode *inode,
 struct buffer_head *ext4_sb_getblk(struct super_block *sb, ext4_fsblk_t bl=
ock);
 struct buffer_head *ext4_sb_find_get_block(struct super_block *sb,
 					   ext4_fsblk_t block);
+struct buffer_head *ext4_sb_find_get_block_nonatomic(struct super_block *s=
b,
+						  ext4_fsblk_t block);
 struct buffer_head *ext4_sb_getblk_unmovable(struct super_block *sb,
 					     ext4_fsblk_t block);
 #if IS_ENABLED(CONFIG_EXT4_KUNIT_TESTS)
diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index 8a3d753b7079b..18e4595b032c7 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -1149,6 +1149,8 @@ static struct inode_test_ctx *inode_test_setup(struct=
 kunit *test)
 				   inode_test_sb_getblk_stub);
 	kunit_activate_static_stub(test, ext4_sb_find_get_block,
 				   inode_test_sb_find_get_block_stub);
+	kunit_activate_static_stub(test, ext4_sb_find_get_block_nonatomic,
+				   inode_test_sb_find_get_block_stub);
 	kunit_activate_static_stub(test, ext4_sb_getblk_unmovable,
 				   inode_test_sb_getblk_unmovable_stub);
 	kunit_activate_static_stub(test, ext4_ext_getblk,
@@ -2893,7 +2895,7 @@ static void inode_test_get_block_bread_and_walk_buffe=
rs(struct kunit *test)
 }
=20
 /* -----------------------------------------------------------------------=
--
- * 17. ext4_iomap_begin, ext4_iomap_report_ops, and Atomic Writes Tests
+ * 17. ext4_iomap_begin, ext4_iomap_next_report, and Atomic Writes Tests
  * -----------------------------------------------------------------------=
--
  */
=20
@@ -2928,16 +2930,14 @@ static void inode_test_iomap_and_atomic_writes(stru=
ct kunit *test)
 	iter =3D (struct iomap_iter){
 		.inode =3D inode, .pos =3D 0, .len =3D 24, .flags =3D IOMAP_REPORT,
 	};
-	err =3D ext4_iomap_report_ops.iomap_next(&iter, &iter.iomap,
-					       &iter.srcmap);
+	err =3D ext4_iomap_next_report(&iter, &iter.iomap, &iter.srcmap);
 	KUNIT_EXPECT_GT(test, err, 0);
 	KUNIT_EXPECT_EQ(test, iter.iomap.type, (u16)IOMAP_INLINE);
=20
 	iter =3D (struct iomap_iter){
 		.inode =3D inode, .pos =3D 60, .len =3D 24, .flags =3D IOMAP_REPORT,
 	};
-	err =3D ext4_iomap_report_ops.iomap_next(&iter, &iter.iomap,
-					       &iter.srcmap);
+	err =3D ext4_iomap_next_report(&iter, &iter.iomap, &iter.srcmap);
 	KUNIT_EXPECT_EQ(test, err, -ENOENT);
=20
 	/* 3. Indirect report past s_bitmap_maxbytes returns IOMAP_HOLE */
@@ -2950,8 +2950,7 @@ static void inode_test_iomap_and_atomic_writes(struct=
 kunit *test)
 		.len =3D 4096,
 		.flags =3D IOMAP_REPORT,
 	};
-	err =3D ext4_iomap_report_ops.iomap_next(&iter, &iter.iomap,
-					       &iter.srcmap);
+	err =3D ext4_iomap_next_report(&iter, &iter.iomap, &iter.srcmap);
 	KUNIT_EXPECT_GT(test, err, 0);
 	KUNIT_EXPECT_EQ(test, iter.iomap.type, (u16)IOMAP_HOLE);
=20
@@ -3001,7 +3000,7 @@ static void inode_test_iomap_and_atomic_writes(struct=
 kunit *test)
 	iter =3D (struct iomap_iter){
 		.inode =3D inode, .pos =3D 0, .len =3D 4096, .flags =3D 0,
 	};
-	err =3D ext4_iomap_ops.iomap_next(&iter, &iter.iomap, &iter.srcmap);
+	err =3D ext4_iomap_next(&iter, &iter.iomap, &iter.srcmap);
 	KUNIT_EXPECT_GT(test, err, 0);
 	KUNIT_EXPECT_EQ(test, iter.iomap.type, (u16)IOMAP_MAPPED);
 	KUNIT_EXPECT_EQ(test, iter.iomap.addr,

--Z7hV9Kl1koG5X2Qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFj5YACgkQJNaLcl1U
h9DnkQf/R7/LJkoWW/0O2sr4pmI7ciNIrdi+XlKo5nRXeGf/gUdqjeHBuqVTgVc0
LgpxI95PC7qsxZsW8sVK6UsL7dZX3H5XkEehEJp6RKQNc6JX+CAIDhpEheZOFKOa
uamyhYTr7o5V3iOKORGiF+4a/I2CASMgCJ93zreIP7kvYtr578KWGBaMdhBXrjKH
WipSsRm3ngCw2idgZUQxHMih8ONDn8jcFm25MpMDxThKmq3Agn+ExiQ8HvLH5Md/
QHef+39Dz6NLPW1GFr9V2Lqx5sszOSfNdAzV/7CeSp4aMjenXrEOoiecoLkFOaRd
MYNtUiYfJBtg4TDMjyJfypCWXMe5Vg==
=OtDY
-----END PGP SIGNATURE-----

--Z7hV9Kl1koG5X2Qa--
