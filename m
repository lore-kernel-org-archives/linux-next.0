Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71B2E88BD;
	Mon,  3 Aug 2026 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779287; cv=none; b=N/+pb8ULUZFPkbHGlgDggCdQ5iAyo+cFK/2vgrDKVZ5tfAGYy800yBfZqHumFqhinaxkzLrYBAdSQm/huPM+zypHR75vZOTS/850lP5BrGu3AxdlYV4x/6u3UD9iCOtvhXHZdwcvs2vkzleRa5Q9/TZ1GWZz91wS0G/WWDhW7+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779287; c=relaxed/simple;
	bh=MPsFJJcmUggzsjVHs1b1ZGJ0VhaUnmfN2IPAyx6NDbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4FKtOJ7Oc0xJEwHhO1lSXZI6g8PD7XXVXYZqsp40SVt4wOd/GJPiQSfIS7enfamx7aNq3iP91TZKIwyNu5IA2qBCnU9p63EbwItYyTIzknRZwYenqM31Nd7TYMrn/iu7EDuCjVpqeiitk4SSPJSPDNI4t3MC3YZhKW7oaAkM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHEkCP7/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHEkCP7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75151F000E9;
	Mon,  3 Aug 2026 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779285;
	bh=R9qZ7Rxw9k/NDGcr7pAeJaMWCn9RoH4B372Oy4ZchOA=;
	h=Date:From:To:Cc:Subject;
	b=eHEkCP7/Aie04PQhicFaChJM6i7SO1G6fJ+PjowkHGY+rP0aD5YqlCN4HLtYyd3DP
	 O5+fDNgTjuUbDdmo8FQkSHylzQiSiwGz5lPw0/ShSaOreItFEEvnKQ9aGV6MAsauzJ
	 z5Y2Mv3qUuzwjE7oSzyAbnMB1heV9QQusEOZF06xpuO2AZr+YcSuIVDS7G/jke7AU+
	 pJebrR1WK1TggKtSPxPlyZuCtKiW3GtYJ327ime54IcakcCV6Cg3SJEzxGsNlBQBxZ
	 Du03dfQnA1SsCut17j+michtSrwFH/Q1+gffOu3WWAws0CT68MpcgJHRuUFKL+0Vqm
	 oyI1bMoson7vA==
Date: Mon, 3 Aug 2026 18:48:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc6
Message-ID: <466090d6-bca5-4ff5-a442-c13d16c6e1a1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybxAHsTy9OA7C4KL"
Content-Disposition: inline
X-Cookie: Do not flush.


--ybxAHsTy9OA7C4KL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Pretty much business as usual at the minute, quite a few conflits but
not a surprising number for this point in the cycle.  I've added a
report for trees with duplicate commits, not sure how useful that one is
TBH.

No trees are held at old versions, but I do have one revert for an
allyesconfig build issue (a fix is on the list for that).

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  driver-core	(missing committer)

The same as last week, both rebases gone wrong (the arm-soc one
particularly impressively).

Non-merge commits relative to Linus' tree: 11141
 10005 files changed, 530279 insertions(+), 161609 deletions(-)

Top trees adding commits to -next:

  1722	drm
  505	net-next
  484	qcom
  433	sound-asoc
  380	mm-unstable
  377	wireless-next
  299	tip
  297	v4l-dvb
  258	vfs-brauner
  219	mm-stable

Trees adding duplicate commits to -next (this includes duplicates with
respect to Linus' tree and with respect to other trees in -next):

  95 drm
  62 bluetooth
  17 nfc
   8 hyperv-fixes
   5 btrfs
   3 iommu
   2 pinctrl
   2 mediatek
   2 char-misc

Thanks,
Mark

--ybxAHsTy9OA7C4KL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpw1FEACgkQJNaLcl1U
h9A7DQf+LH1thQV6yB3Tu5aq404vaggOKN3d3qjFzNhfX5iCO2h7FgjV+PFo7KFD
QAMKbbrR0WcZg3O4OOs6VsU6lrtuM9+n4SrTj5TFuXakTv/ajVudeS6KG7R0I1XZ
0C6xPNfQf7pe46aWv4qLIo49bmQ2Pf4Iy7uiSwnWYwsNy3P3T7eIrMNu4OSFb9Cx
JhKeIT4uaDtp2XpY59ECRbWMwNwp2WabkI8/q50l8TqjdC8v/5kGdZjL5Uch8KQQ
A5xjmyAfHoa4ocRX/aACD8Sj8ErcA5Hq533Yn6X/vbLQr574tG7wJc07m1FMpQeo
OHlyF9rexMabUn2RaHsb9rgDr11btA==
=d2Ni
-----END PGP SIGNATURE-----

--ybxAHsTy9OA7C4KL--
