Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF764BCAC5;
	Thu,  2 Jul 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001034; cv=none; b=CPf4FoDhllaz6GRspMBsQ7VFozfnP8Ydb4v/531aJBwLHIj4BIo+xNgkufObZDAEwiHgZ63O8Kvh/pe9O7HGVUkslydjayFqmWQki6G+NEQAu2pjzwSRE5CdRL7SPGt/H2vNDZmS5dYqeWm/aQL97RpFcjTEtovPGwtjJ1hqw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001034; c=relaxed/simple;
	bh=TC/5Zgm6qsXWWzW7VsR53XZG3oBRX+95eWx112Z+d8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+p7itE0QluCAjvNLbClnTomok9QZOJE63w0/I4izZUba+4dP4JSdr8Y/jNNnDlz8nNhJomjb8/ZK4tnI+U9pd+eT+MxyYBtuziSKOwwMmMBJmjPBL+XfmMbunoDaPP6HUa60ACaU7EN0f8jPnoB5qIcPdiR7CsW6aEalOB7EoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7hiU2Du; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7hiU2Du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487DD1F000E9;
	Thu,  2 Jul 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001033;
	bh=qYJ+UTncw0Vt7Vx9EsjinfZsN4+L+gCymCSDDGInHCM=;
	h=Date:From:To:Cc:Subject;
	b=T7hiU2DuiOr9rjeYwD9qAP7yXgEgs/h8vpY9v1OUFdAASTpO0W/+DHPekwAsAHRvp
	 q2YLvM6fnoDu50BdXr29EIo2mx11Ppah/d0bbyOtHcy2eqWIYIkDT+TVC3pQm2G+hV
	 wpGriqu+HTaaDVyffPHmc0d0denNnaHrz5wgcdKV7Pl3DZc8AzlYsK03HMpXv0Nb+s
	 AufTYisvGEs5GZfGB+jXS/2t/NYlonpZ02mW4KEEDDeLxOScsXIjF/VDS3rnkBj5bV
	 iU6Sb8WinLbqSDckftspP72meFxLf3evNfxjza5oFjWFfhPQpd+PuQUHUHpuCG+POn
	 nzWiIOuJdMwlw==
Date: Thu, 2 Jul 2026 15:03:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs tree
Message-ID: <akZvxeIEgr8bYu8o@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ni62y1zwpyQudZR4"
Content-Disposition: inline


--ni62y1zwpyQudZR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  ec050fc4cf17d ("ntfs: validate error codes from untrusted disk data")

Fixes tag

  Fixes: 1e9ea7e04472d ("Revert \"fs: Remove NTFS classic\"")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--ni62y1zwpyQudZR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGb8QACgkQJNaLcl1U
h9AvPwf/cKSsn9OUUXPEjy3mtQ05hUXbDnwLYExoQ97olPUJRHKLbQXz6cjIceRf
Ry5QSWLlCxavKMst+WAROZ7vTNJdW0+psnicNbYBYAw1ZNkt/QoUcoQiOTQ5FmXm
e+yRogA2hfNYk86xiFfJ1IZzwyn5rT7rEv+WkC4t37iqmcWgUHeghvvzZ4xGI/7L
w9WzJfFb/UPd6GOcvavGmcxayUBCWOylU6h14nIsUFSMtHD/8OgXPbuEqEFc2avx
YiKYb868uG6MIlj4sp3o9wqpEfX51yd2mYXPUSMFjkPsVXy6B5+U49M7SlhJ4S9O
2yNBXWRhmyzBZfUTzA7LRFbIIvn0ew==
=2sZW
-----END PGP SIGNATURE-----

--ni62y1zwpyQudZR4--
