Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9715131E85E;
	Wed,  5 Aug 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933273; cv=none; b=fdkeMVcaPfQQLTBQh1q5MwAXIV9YHPgCBSzuPVXCM7ttfP2Vhp2cZgj5xO6fogGBg1kwUK7rBRN8fXqDHTn674Ada8mRGlQSEcGlvAmgbW+A0s4zaVlJNwHFRjk6SUlMNToxnYcPbPoITIgI10EB3IKX43u+wOLzL8y2JcRR7EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933273; c=relaxed/simple;
	bh=uqc+8cO/CwoxwlZ7KqtOiK3QZEUmRRxf32c4eQSVI8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auomZNBGYWUoN5ewpTrijA2nBrgQsfwc7uvkKqajZczqB+mEHQz3/qmOlsunRobBOyG3SW3ZjrH+9IyVG105K/Dp5/36CNtXj13T2BH2/nNFr87/ws71KzYy/aU7qLsl6OndA+pJWmkjylFJy3uC8xiuogO+hz5NziZF2F5IRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2aLTjcM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2aLTjcM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEF21F00A3D;
	Wed,  5 Aug 2026 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933272;
	bh=jiih1SCe/2rvBHmMfXV2XPE0BYKFzZfQshiU3lpeK80=;
	h=Date:From:To:Cc:Subject;
	b=P2aLTjcM2FZgKTb3MOulsiPYpjMWKrTffax0la016ws1GmuH6iQ9qiw2v6979fw5n
	 P0Odl4FCNgNjqciErR9b+7g4Bp3VCaJvDljY8LzBCtcEpdYcWkG0R8Lp2JuM5DI5WM
	 96KbIzrlOH51cy2blEypmMSGb3MkfYavO9JfCSJJaJ/52tyEGh9xPPSlXqJAlft3iV
	 RyQAqcV7Ae1axtV8jIN1Dg7BQ5g+v/ItzKYChLfzzoWy19fC5yhwpo4SrAC3Dy+h47
	 kwuAuErHbnPUEa08MoIybNuZIV5zbdiHHhBVjsCfsjlLhJpVdRsHe8WtqzajV8S/bT
	 a/1pbTFswqzzg==
Date: Wed, 5 Aug 2026 13:34:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Hyeontae Lee <wonju345@naver.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ntfs tree
Message-ID: <anMt1DKhBq-9Hk7h@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wUlk8p+FZzKNpJpS"
Content-Disposition: inline


--wUlk8p+FZzKNpJpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ntfs/iomap.c

between commit:

  9cf6ac617e8e9 ("ntfs: serialize resident iomap reads with mrec_lock")

=66rom the ntfs tree and commit:

  7a7bf7551624f ("ntfs: convert iomap ops to ->iomap_next()")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ntfs/iomap.c
index 73c50171285aa,d0964ac840d9f..0000000000000
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@@ -283,22 -274,13 +283,24 @@@ static int ntfs_read_iomap_begin(struc
  		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
  {
  	return __ntfs_read_iomap_begin(inode, offset, length, flags, iomap,
 -			srcmap, true);
 +			srcmap, true, true);
  }
 =20
 -static DEFINE_IOMAP_ITER_NEXT(ntfs_read_iomap_next, ntfs_read_iomap_begin=
);
 +static int ntfs_read_iomap_end(struct inode *inode, loff_t pos, loff_t le=
ngth,
 +		ssize_t written, unsigned int flags, struct iomap *iomap)
 +{
 +	struct ntfs_inode *base_ni =3D iomap->private;
 +
 +	if (base_ni)
 +		mutex_unlock(&base_ni->mrec_lock);
 +	return written;
 +}
 +
++static DEFINE_IOMAP_ITER_NEXT_END(ntfs_read_iomap_next, ntfs_read_iomap_b=
egin,
++				  ntfs_read_iomap_end);
+=20
  const struct iomap_ops ntfs_read_iomap_ops =3D {
- 	.iomap_begin =3D ntfs_read_iomap_begin,
- 	.iomap_end =3D ntfs_read_iomap_end,
+ 	.iomap_next =3D ntfs_read_iomap_next,
  };
 =20
  /*

--wUlk8p+FZzKNpJpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzLdMACgkQJNaLcl1U
h9CRygf9HXD/H4FGyRmzSOqdD0/OK/cKEzGbKSiOKkwgzzo/vTgk7npHsL3cAuXA
NS3To0ej3+b6Bj/oa4+JhjF4WyWzeXhbcgMHFu0vnOjQ3c/vaSncTiP5qjkV8HID
v7jOvcsLXF4evx4vZJEXSENfzSQ3HB6mG3IcKNNWyxQrTy0WhqyIqO4giUq/GfCF
oCNDXCt356/ySKnsvSiW77LNKyM+aHJzKo+rpkj1Gx9u7juXX8BshlSbVA80HTU2
DQdnpC1mwMAkWxFIadtHZk4YTT1oe/b+kFF9ebmtnIS2qaSY2jX08I9mJfJMKMt3
cHo6LyaDyv16fErsvYVNs1x2wZEUuA==
=IKfn
-----END PGP SIGNATURE-----

--wUlk8p+FZzKNpJpS--
