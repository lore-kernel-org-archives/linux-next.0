Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A421927E1D7;
	Mon, 27 Apr 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301529; cv=none; b=IJywhTj+3iNua9qD10MA2qgRUOpWfcvLAlOr6KexE3VNjaMOETBso5okPwnJr/6f7dD2pxs6o0V9djud4mSPCmbVNeuSRu8aHwnbiZekVfFKJbaljaAu4X6sM8BKnR8UHNLWMWXB1q6D17VK9gypqwvhaEFGzmDeaD8md5JfBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301529; c=relaxed/simple;
	bh=6ICHrqrp/ScvtGmM9ptvRTp4nTwegm/gQVG2LVJqEoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnRE8mBNXb5vUcEGRAMDxOmhFsxzyTb40Fe6ybF46J1SJKY44TIfhXoePp9729BhalG2QpgZCTKp/4p9/A6vfEqbZ8iZNvbLUVqoETbc7PvAaMm98sr8SXeLAQFFCm5CchTeeDJ0uA40lL7UjQLHgjU+P9FTgu8Siuapcgm5eJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAJEyDqU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAJEyDqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F023DC19425;
	Mon, 27 Apr 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301529;
	bh=6ICHrqrp/ScvtGmM9ptvRTp4nTwegm/gQVG2LVJqEoo=;
	h=Date:From:To:Cc:Subject:From;
	b=QAJEyDqUfmlgsy+cdb0/YyKxjoSTu36OLNKK89HfjK4cvIO1zuDjDCe0m7Vwh/LxU
	 uAPlaVaNP4B11Bx/9vVjxYFUzuZmX8Nov8DwMVOt6ku4rWndLANoEA+tOKX4En1+DX
	 Kshl2kYAUZXlSgaa2o/05ZuC8NcTClAXyE9f7GiVFIY2RGIehfYoNi0pDXmfaqz9oC
	 say4gLr3JPAqsBwZSv098RH08VDtkAN3wKB0zhREcApCX6sibky4vCdfv1YKs2UrXN
	 L/16HTqM0tDSjQlCmllMwgYnFCtU4UgbfVC3ou/HWPStd2AcUfvlCYjJ3NEbzo4YuD
	 mQfsVqO13XXSw==
Date: Mon, 27 Apr 2026 16:52:06 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status at v7.1-rc1
Message-ID: <ae91tYSmPir2cFaG@orome>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tafrefue33gyyhas"
Content-Disposition: inline


--tafrefue33gyyhas
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: -next status at v7.1-rc1
MIME-Version: 1.0

Hi Linus,

Mark predicted that linux-next was going to be relatively easy right
after v7.1-rc1. Not too much going on at the moment, just some fallout
=66rom various changes in bpf-next that I reported (and were already
known, judging by the feedback I got) and that will hopefully get fixed
soon.

I got through the merge pretty quickly, but I'm still finding my way
around the scripts and had to rewrite some of them to match my build
infrastructure. The builds should roughly cover what Mark and Stephen
do. I'm sure various builders like KernelCI will complete the results.

Trees being held at old versions:

  bpf-next       	next-20260424

No trees have signoff problems

Non-merge commits relative to Linus' tree: 775
 998 files changed, 91327 insertions(+), 10126 deletions(-)

Top trees adding commits to -next:

  98	amdgpu
  96	drm-xe
  54	mm-nonmm-unstable
  40	stm32
  38	sched-ext

--tafrefue33gyyhas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnveBMACgkQ3SOs138+
s6FzCQ/6Ai93euC1ZyNYnJQY/A9SequrVTLPoupLLu6fcI8p8V+1dq5QT04AQnHW
YJC0MzeggM5AqExw+bCTYJ1eQkSEAF9DToODQpqJzdv6DvQ8zkE0k6Ar/AGxKiAB
cgx/S6TpkOfhytl3EKp/T4DLtT8B/F5wvjRbaJctlSensUUblfMNd4l0VtPM5IlU
zYxq6KuM9TNl2cYXpYCCSzvt+p4bk5Z70OJ5qqzxH6O0QxGL60wJA9cfHoNdfmoM
r1wSw2zW+JiTQbHxECmhcETTyvLUtRQw0HNdPQn8W+ZZP7jPPU9cLYQL5OhcG5Sx
P6Y3o0yhcgPkqPLrU/tNDFQJ7Ro+FBI29J7iyhNJ/Ne685M8gVnImfLbOHRIPDIJ
rx6T39YdCQv4s4TdDLm491xcXuKPeuedyDV6UKirtKo5gLNbDgJsoQQaCKdnN1rB
Dt6WTux14L904+IKUa7NVHw0Bt5f/pHY1zc3Fev8O6wbII2F9s+YpOSSzZUGNb7g
ZPqu0VIlGTSYJZFS/M9itiLB1pkGSU9BsvHDFmrgeztvNsA/dcp2JjvJJxhrzZLb
+OYr/6ozuJwlt36LaBnZqSRO0bKrSx0Patbw0ps33iSNVFbudaipoqkevVhXucZO
Nt5DTwauK3My1A30sxZoqdYFQ341TSVUyJ9GkhHHj5Yi0ZnALqM=
=W02Z
-----END PGP SIGNATURE-----

--tafrefue33gyyhas--
