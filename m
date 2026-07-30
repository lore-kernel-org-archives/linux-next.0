Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751E3ACF0E;
	Thu, 30 Jul 2026 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412912; cv=none; b=eB9gxM1UQcRmHFUD8mrqq1AKQcwSfJSJux20ddtgDUAQMeujN79+V2VjMAckhV7LsgMIkS0rrAaf0lNJWq/t2jF2qdoHSoMj61qGDCpsnvIoheKWvl69ygPSHdnJYH7HPs4b1iTHxJs1lmi3o6xJNrm2EAu0/rCCYYW19riEdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412912; c=relaxed/simple;
	bh=VSI+DPLAXXbWvxKel3pMlwtGMbyX6R6dpFjCkWZHyyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qm+o3XeyOyqePHoG18rlQhodAnhT1qSpnUop24Rbd6Ps/6iKTtF2mhvoZe2uiG2jHvR3qw/51KSFvJCr2b/hl1LYTQisS1yVW+Ym86bGB7FwWGlIu2EWi+CfwnGiYp6h3KUiWzs7L3lG9jqs3RxsU1k0Q+Iqfh670tMctEhiheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYRrJxDU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYRrJxDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DCE1F000E9;
	Thu, 30 Jul 2026 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412911;
	bh=vZxr0hlMhB93W+15vqgU/DoNCMHjZ80TBNJeUgAuWic=;
	h=Date:From:To:Cc:Subject;
	b=YYRrJxDUaikL//9qKeCBkeefHvP/esWyv8AWaK1uj8dbyZJa5ab3k/EZRlUmRzDDT
	 GV7rX6zAwMBsslngUAhV0OgO82XYippGw+MZn95BuuHJGpAM/UvmiyHX7QLsi2XQPg
	 4Z/QFhGY6HAWE9P34J6bY7OC5tuylQwW+z+c+C2KWuUGXlPSN9s/TZCGY2ei1Ndya1
	 /3UeUUl1iyA6CC4I5XNvP1P07GyHmVg+IY1V7o0ZCfKRl97jwieRkgiK7TjddXIHa2
	 5UkuWeUGVIMKo9wGZh67q3fk18WK28G78dlcQKfzO8i2JTB2T7Ign1y7bmgVXz2RX7
	 QK5QOivY0q/Vg==
Date: Thu, 30 Jul 2026 13:01:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <ams9K7q5NMj9ifmm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvZiZ9avHEAmPWU8"
Content-Disposition: inline


--IvZiZ9avHEAmPWU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext2/xattr.c

between commit:

  6abf69e2e7f91 ("ext2: Simplify error handling of IO error when adding xat=
tr")

=66rom the ext3 tree and commit:

  356984d1a5c32 ("ext2: Fix lost inode updates for IS_SYNC inodes")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext2/xattr.c
index 5f49ec4afc36f,be63f89402a38..0000000000000
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@@ -777,16 -777,20 +777,16 @@@ ext2_xattr_set2(struct inode *inode, st
  	/* Update the inode. */
  	EXT2_I(inode)->i_file_acl =3D new_bh ? new_bh->b_blocknr : 0;
  	inode_set_ctime_current(inode);
+ 	mark_inode_dirty(inode);
  	if (IS_SYNC(inode)) {
  		error =3D sync_inode_metadata(inode, 1);
 -		/* In case sync failed due to ENOSPC the inode was actually
 -		 * written (only some dirty data were not) so we just proceed
 -		 * as if nothing happened and cleanup the unused block */
 -		if (error && error !=3D -ENOSPC) {
 -			if (new_bh && new_bh !=3D old_bh) {
 -				dquot_free_block_nodirty(inode, 1);
 -				mark_inode_dirty(inode);
 -			}
 +		/*
 +		 * Inode writeout failed. Backing everything out is complex so
 +		 * let's just leave it for e2fsck to cleanup the mess.
 +		 */
 +		if (error)
  			goto cleanup;
- 	} else
- 		mark_inode_dirty(inode);
 -		}
+ 	}
 =20
  	error =3D 0;
  	if (old_bh && old_bh !=3D new_bh) {

--IvZiZ9avHEAmPWU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprPSoACgkQJNaLcl1U
h9D28gf+O8g908WmOC+2vMvufXOWdcH7koTA4cTCNpiUpZOS0zrkHAezCAunytEg
BI8+z9jcEX6jbTyKbnWlEfQrhG5LKXQOd3Vl1ikn3+x/Nb1KBSw9JKGf1PBMKBf1
ZglomQaGUp+lnBsj6d+OI/viLLEvVCY50UDnaJWUkX6pz2rw4H9rIDTdsEubpXsK
ZxiTz+pJlQkZN18qDnLrbgwBTa5/O5r3mXYtOCfvTdT5sH1PMhkM5LPDv0sJ0c+f
o5W/yMurK+yR7ReAPLQMNqginTW1PYYU7lqiDr7CeOmsVz2+pUNat8Zoxx1tPmii
hSk676lVFdXXUPvHT3OSvrDN+UV/eQ==
=PEgK
-----END PGP SIGNATURE-----

--IvZiZ9avHEAmPWU8--
