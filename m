Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DE3FA5FA;
	Mon, 10 Aug 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374213; cv=none; b=IPZagxNUklYnhMaqmF76IzNMGJddwkx+f8/NR74QWIEdupYs9WKyOUql8RgsD3IBrvgB41WE8HZlsfiViB8sbFvW/SipmMAHh27hKX+NciLwcqIFnzLvrQu/ozKKtHJlb9HJYCinFmUbmIY4VyOR6p8AMMr6nM+78zty/4kb4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374213; c=relaxed/simple;
	bh=IFjyMo5P8Y0alrHCl//wCbtwsv1Hykb+fP+fVVIxRM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Urh+TezPGkWUH0t3b1DB0GK+eO7cWwAK1mAtTf/FwV8ItUnKjLlFmzxttSPEBKqoWpClm28/cOfLspWyGza1LaH8d0xHnjetTLpjKESk3Eg7fdA5zyRxeJxWawiOFoL8T1DRUfB/uUZ0+sbEV7V7ounq3ER8DX1nO43p/WG6xbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWDWac8i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWDWac8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9A11F000E9;
	Mon, 10 Aug 2026 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374208;
	bh=b6kBSWCplxQGLWrtceh74uwXpFbK1ls84Ij2a6DqG8w=;
	h=Date:From:To:Cc:Subject;
	b=VWDWac8i/RuVrEp4k3XWNW8iccTJ9k5HrB00K5/LkFMps9Gic2GJiaKjzDDajg/9+
	 u1ymfkhOd1oiBGHKtxT5XYu+Z6C5+ehEl15gbCuokIVHZh6HLP9B8N7w1UJOd7ttS3
	 ARydFBouNXgTyJJV1qkqU91jlYSwmHCMahyq9lDJJw0Wd4lJ57+QeVSswen0I/Djdv
	 oc4MwM0P4g+GLwBpz2cRDkluePd54BwUkQD0QV8p/N/NIls1MRcleAv/0PhPT+DZcu
	 OZjlPKtOqagg4aZU7wCU8E99D1a/NhtOWXIQE4iuUB339Pe1O/4zHgsejQ2Cf8HtVH
	 KQk629THzAzhQ==
Date: Mon, 10 Aug 2026 16:03:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <annoPJ_kdzJylWIz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jAd1A7MIYgrcv0VI"
Content-Disposition: inline


--jAd1A7MIYgrcv0VI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:11:13: error: stack frame size (2400) exceeds limit (2048) in 'dcn5_mode_programming' [-Werror,-Wframe-larger-than]
   11 | static bool dcn5_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
      |             ^

Caused by a previously reported issue in the amdgpu tree.  I have used
the tree from next-20260807 instead.

--jAd1A7MIYgrcv0VI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp56DwACgkQJNaLcl1U
h9BcRwf9Hzx7NfMLht4eE0IYxBGSgvqrZQ1azFb/SonV90y9Ub1FlVhTtzzbHEQ3
bsG1pdSYB6PfNPhT2XTdVE9ScK79XJkAIdzlsL6tfq6sfVOQ/d6saM6qT35ey1B+
8ScHGfrvoxY5ZO0+Dje2LLTB2SVAIA/18UUC53VLVbXgpbXRPv/fJB1WuIWsn7lA
pmbxzF1TG1AwU6xAvZijtDImaNjHRJx0f5vUgYpol6xHaBVBC6/kAP5bx8Afp44n
jUCRs86s+LaBBZy3OZZIUMJtb4HviltSrp5XkNWLbENTreUHdSFZsqvmSRCmGOkc
5Tl7w1Pit0dKZNvnM2Vor90V6jVadw==
=y3N+
-----END PGP SIGNATURE-----

--jAd1A7MIYgrcv0VI--
