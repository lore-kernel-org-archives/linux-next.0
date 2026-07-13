Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8716E344D9D;
	Mon, 13 Jul 2026 18:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966179; cv=none; b=T/ReapcJqCb2pTLahq6fnRB4tkU4g9iolqJ1wWbjpsvWtEdd3MBadg7ed3LnWWDk8G/DEXZDIjeI0saJV56YP2IVF3HJ7mCSDaDuyyuzwgn8gYNJU4JNWgNUNsNrocJDCg/lzCSO/3ulHus/CBlsmca9oJJykZ0GZppkp2WrpSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966179; c=relaxed/simple;
	bh=R6sZYelnZVOxqPUGhOkRXKA7gWtY+jnMY09732ZI1SU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZmhxoxXQsXtGg8leDsTjciTM4Tyvepu4DLIFA1KQtqusaxcV+BuD8ulXM0sq5BvFVx9ZCYgG0FCLF4O7xMupn449ymKlKxLeaUh+AQtWkxXWN+srlzPisRz8aV+r1TWDqjDq6DMpoL4HT5F40yjb0ySfdE7pLIneZvUxP7AE9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAYR5y2j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAYR5y2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0D21F000E9;
	Mon, 13 Jul 2026 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783966171;
	bh=0i2rvNbQE1AGcfzWzXmZvcqBTJ1C05A30Z2LBUNaQno=;
	h=Date:From:To:Cc:Subject;
	b=LAYR5y2jOoBdQhtlvx5ChpIOOftgOM3e/7sqgnyF4nCNHFpOofxXPJ1PGySBDlNF4
	 cwYBewxd3Ny+G+J3Coem8vcwr+FUn7yWtby862tiaAvx3NnbxuEEvoQakhXMSb3D0v
	 Y+W5SlHIHTPWdsig4ZH0KuqK5yeaK52NV4Ogxh1mCrrKU+fLkvgxEt3jHQAXJdgeuT
	 aH6gkQB946Xu/vkqSgGI4uZ8y1vFOmz/HR41vgwyy848vaoLp9VUkFWekqC6QNAi73
	 G7fgvL6TI2fti1yHXQbQ9N5teICej8DADz+gmH22lcPiVdsZjsOhJ8jPJJ5ajJXXIN
	 GCA5Mzr9g4L1A==
Date: Mon, 13 Jul 2026 19:09:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc3
Message-ID: <85eb4424-19b7-48bb-b53f-14c8f089051a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxclRkjrivjItRj+"
Content-Disposition: inline
X-Cookie: Your lucky color has faded.


--nxclRkjrivjItRj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Things are starting to pick up a bit with a bunch of fun new breaks
and fun conflicts today but still relatively normal apart from the fact
that we're seeing an unusual number of breaks in the final build.

Trees being held at old versions:

  scsi-mkp       	next-20260710 (powerpc driver badly broken)
  tty            	next-20260710 (goto interactions)=20

plus a USB build break in the final build that I didn't investigate
properly yet and may be due to some other tree.

No trees have signoff problems (arm-soc will tomorrow due to a rebase
unless they fix it overnight).

Non-merge commits relative to Linus' tree: 5209
 5201 files changed, 210814 insertions(+), 86997 deletions(-)

Top trees adding commits to -next:

  1081	drm
  340	mm-unstable
  312	qcom
  184	net-next
  183	tip
  159	sound-asoc
  133	iio
  124	staging
  120	nfsd
  117	vfs-brauner

Thanks,
Mark

--nxclRkjrivjItRj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVKdcACgkQJNaLcl1U
h9CjSgf/U2UO8YMDrAKJrDcaPMfSeF8MbBQtu//Pz3Rl/JinEBSOGdYONP+vPQrp
zT/P/gh6aRet86SgTMQxrnqLxx/bKe0vpAuyqjIoh3o/L6rIZOW2IibdTrsBNxIy
ZV5VFnAnU1dRP/Nn3SFTIufzYs0HIw71/oen8xteQgtrOxC8cTKnHfekRfY6VBuD
03fByRAwJXoIrpVggtzLvCvXX3kMOL7X2MSCAOa3Nmt4UpDpFdolZO8u9E+CwcTA
bkMWx0qGhOFs4Jd5C+ds0m19m+W12WPPmLjZXOUFnbt/mjLIQlw0bsAlgE3NUWTM
JWQvDEyi4aRAmSgw0UI/BfEldHGWsA==
=IFRQ
-----END PGP SIGNATURE-----

--nxclRkjrivjItRj+--
