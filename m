Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0603F99ED;
	Fri, 27 Mar 2026 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633113; cv=none; b=WRYrZ9b4/gfS/2NvpgTKlHF6qWUKi7kmqntiDsm7UaHYHrdk2+nLaOZnH1sgJkyd0gDHmPaYEYLL7A2d0PO5Kbx+oEt5fTotPckzp0VXKoNWCGF9+IItuL+d+pTtVuoeZzq40Rok38NizcHccpchxwwPvxErpsOjkvAedFJRKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633113; c=relaxed/simple;
	bh=RPNcis2Nesbuv0Mt/zXQT+e71zAK/UGLk9uIIDEcFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBW2TRFPk7cAYUxN4/CrsWEEj3wL/zkwLtWbzLpJAzzE0nNJ7v5iKjeAl1UorH4pI/6gAZtBEl+oYwkCafLd+8jzOF0Cb+p+SPXUW8MCl5HgilE1yLYOiO1uz2hyb/3UF4n9vIoo+sPPhKr/gEaeYskp+I/ebF6irPTLPE2HyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRNW5F2k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRNW5F2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFA5C19423;
	Fri, 27 Mar 2026 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774633113;
	bh=RPNcis2Nesbuv0Mt/zXQT+e71zAK/UGLk9uIIDEcFoA=;
	h=Date:From:To:Cc:Subject:From;
	b=pRNW5F2kUPfp7DpJ+KCjMuUXe5Y2t75Wnj9BnGvOSpYyaDnq2rdWBVYLyF0/Etvzd
	 E/YCTVw67wolXuHRQLsAAKjrm+lbovfhxAjycRrHxfAZhAtijLRbdUhBTjesJHUlBF
	 5pRi/LRS04p//zWcCI/3xEQsO9sy5YQhUv0VvFSctVlohQiio/VLPHn1QGDrFQeyR7
	 iZy3vuS9HAZdpTCWnUjHMd8ZfeGpv44G7MfjV2/sLruu4oB/eos7n39CQWbeJFyAaR
	 gpRCa/9iZ3nvB74RKHJGFpoN04ndZIhrI3U2ZEPao5iNzndU3flIzkByjHc+gM0PhZ
	 BryjB4css26xQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B0B6B1AC5847; Fri, 27 Mar 2026 17:38:30 +0000 (GMT)
Date: Fri, 27 Mar 2026 17:38:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext4 tree
Message-ID: <acbAlnfUcjBSLNpt@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SIVREdc0OHm/lu5J"
Content-Disposition: inline


--SIVREdc0OHm/lu5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext4/fsync.c

between commit:

  3a0fb9e5017077 ("ext4: fix fsync(2) for nojournal mode")

=66rom the ext4 tree and commit:

  41189b49bcf1c2 ("ext4: Track metadata bhs in fs-private inode part")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/fsync.c
index bd8f230fa507e7,aa80af2b4eea28..00000000000000
--- a/fs/ext4/fsync.c
+++ b/fs/ext4/fsync.c
@@@ -83,23 -83,12 +83,24 @@@ static int ext4_fsync_nojournal(struct=20
  				int datasync, bool *needs_barrier)
  {
  	struct inode *inode =3D file->f_inode;
 +	struct writeback_control wbc =3D {
 +		.sync_mode =3D WB_SYNC_ALL,
 +		.nr_to_write =3D 0,
 +	};
  	int ret;
 =20
- 	ret =3D generic_buffers_fsync_noflush(file, start, end, datasync);
+ 	ret =3D mmb_fsync_noflush(file, &EXT4_I(inode)->i_metadata_bhs,
+ 				start, end, datasync);
 -	if (!ret)
 -		ret =3D ext4_sync_parent(inode);
 +	if (ret)
 +		return ret;
 +
 +	/* Force writeout of inode table buffer to disk */
 +	ret =3D ext4_write_inode(inode, &wbc);
 +	if (ret)
 +		return ret;
 +
 +	ret =3D ext4_sync_parent(inode);
 +
  	if (test_opt(inode->i_sb, BARRIER))
  		*needs_barrier =3D true;
 =20

--SIVREdc0OHm/lu5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGwJUACgkQJNaLcl1U
h9DriAf+Nw7e4cVVnV+Ak3RslBddSWefr1xdx6WHAyt6AyQCQy5aPMjPzaqdsKeb
ARyYP3NqoM9+nV/owwbnGk6V2VUEP12Dh7NQBCg3X/0MtQ0mpmWm2zl605xnjQyj
76T2UU2YF54dckGpPUIqD5ZbNiNoOJ0i7hi+mUCAVdq1OJysyiPAfPZS7+S3ivUC
mU8Nn1NZxuqVYu8ZPobVsq/ZIyY2KizzUNOsnG+Heuim4vHaz8Dq6zsC033QlLkF
D49e+nfZxve2jB8JAWj4XAzLYBr/5ek862cm4Qk9XLbO7vBpuRGYVBYZJ6AoCu81
i4gGvewh4t6z47uHHvQgBanO02rcPg==
=opnB
-----END PGP SIGNATURE-----

--SIVREdc0OHm/lu5J--
