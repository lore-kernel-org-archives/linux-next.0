Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BE39A07C;
	Tue, 14 Apr 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776165749; cv=none; b=XSAh/iGWwzDDHjjjWh2xAs1GtaaRBd3Mqh/PTROVIp/fQbF7DIpPpRatBmuBaug4Ul3kYW0x5Gzwx7Lth0vXZskwCMsF9a86YFVko+czADzeGMw6Metfql7Yuvv69YorzspOrLMLOnhZ+uczcessm0gGl+EGCEuh+1YVGEfICFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776165749; c=relaxed/simple;
	bh=mWMydHLIGVXNHyop4Kd97ijA7Yjbt4wYBzwnc+e0lWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwwOaM+L3WBHZi1f2m+SYUV2FYhm/6pYqxGFpXtcGnkjm4l2MDQ59poAlkL50f/M7NoIvOMEgIHKbOEvXDWM2VEDc9pCaAkp/y1QkGLg8hmk7fGklXwGLNtZvL68fj26mdZKPoDLY0hZoimFzN3TrbHooIdDS7d1QSKKu81C4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojP1zwfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojP1zwfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AF5C19425;
	Tue, 14 Apr 2026 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776165749;
	bh=mWMydHLIGVXNHyop4Kd97ijA7Yjbt4wYBzwnc+e0lWg=;
	h=Date:From:To:Cc:Subject:From;
	b=ojP1zwfFifVOR/5aGOytbzTQfnWGy5zIpjdbVDdOVdZb/AzM6Bm8cLO63Owzb1A/W
	 XBaNZUGiXYtB2MCord+gOZxC2zTC5YvgpY/LLSO5j8K2loQ4T+NyxUx9nLwT4c4p+/
	 2/5oHU7WdoF3f1OOvSDqNOZZUB60NtvC+ZVykE8a6b2sGYVPK5HE6LXKbe0l9V4qw3
	 InYxPykD4nQ7erfGq+bV4YGIGfDOdV1e1XHLt0eQrx2frbA7VxUD6sVSWMSvfhGELe
	 Y4tSctQj+6xZaEPGPWK6PHTzM2xSdLPfpt7gFFB04GWnYbDMkkvc42ox7+g86zDf6o
	 2SymzF01DhgfA==
Date: Tue, 14 Apr 2026 12:22:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <ad4jcRYVdgJZGtlj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mFNZ9J9yeq8qfF5R"
Content-Disposition: inline


--mFNZ9J9yeq8qfF5R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext4/fsync.c

between commit:

  fc825e513cd49 ("Merge tag 'vfs-7.1-rc1.bh.metadata' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/vfs/vfs")

=66rom the origin tree and commits:

  6e22726900ea5 ("Merge patch series "fs: Move metadata bh tracking from ad=
dress_space"")
  f2bab85781e80 ("Merge branch 'vfs-7.1.bh.metadata' into vfs.all")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/ext4/fsync.c
index 924726dcc85ff,abeb078a34647..0000000000000
--- a/fs/ext4/fsync.c
+++ b/fs/ext4/fsync.c
@@@ -100,7 -100,6 +100,7 @@@ static int ext4_fsync_nojournal(struct=20
  		return ret;
 =20
  	ret =3D ext4_sync_parent(inode);
 +
  	if (test_opt(inode->i_sb, BARRIER))
  		*needs_barrier =3D true;
 =20

--mFNZ9J9yeq8qfF5R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneI3AACgkQJNaLcl1U
h9Bmswf9EfykorlqU0D5tUt/9xsT9laSShZvRB03L98mP9qczDLgt7MbO9PLsu74
f2Vq2ULdawc/KdJpqGx83XFQaGEPHXh97TzupjwBpeVN/k8mPnlzMd48pQ3EudaI
xR3jd9cf/v6rNP5J4vsB2hvu5CA2FchcC1WS+hcPrcgFiSy7HthwO0poo8cfdMMP
LfxlNA5kAAS/L3g8cIVM2X96bjRiDyCdbErTSA/dgi6aXcaAAhpAv2wsB3SeOTJ7
Iu5HoJ7M0/tWdpSC+CtgDAQGPruYWIS3QmITV4LqM9Lns8ipYCICySZ+KeCJ58IF
36o6p+/IKLwMndgjTdTwnvzNgU9www==
=GqWQ
-----END PGP SIGNATURE-----

--mFNZ9J9yeq8qfF5R--
