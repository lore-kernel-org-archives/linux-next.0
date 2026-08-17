Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29B41CB3F;
	Mon, 17 Aug 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970462; cv=none; b=JgYfk9l0VhVdRVvloUaSkl101wz250jZkR/aoORc5Dy59rmnSjoSve0G7W2fQwJNVC8hHXMY7zPBkOfSN8+0eyrjvSma9rTm7rmH8Zzg5tjY/WWdokIp8oNQ8Kspq/uCeN8XB88VYynCGMfuTgJcE596HzH3vlh2CR/c/vppc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970462; c=relaxed/simple;
	bh=pf+b/MqkdSuNPhcAfKOmRQQI+dvoMTwj4wDUHSu78wY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOVI/VPfLMUUL1MYdOLVNcoOpQp0/Ega+L28iRItwnNbjegNhObdj6sKcD6tFKPpyV+n+IP8J8Lk6KmcnklP7rdy35DVfwCKihenC1ASEZm8TOp3o9S2EJp3zScnggybH2jPuLcghOb62gTzOXYtFM+UHJPnZtp0QoU3cHmlAII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ttm0+toC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ttm0+toC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5B51F000E9;
	Mon, 17 Aug 2026 12:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970461;
	bh=eH83PQ/S3XfvAIkkBoh45qJIhxQLC0PQeBufYfOkFAw=;
	h=Date:From:To:Cc:Subject;
	b=Ttm0+toCjEII2CI16lzNdoaKs82roh1SvVYHPxT+JPqQjZfseDK24RcI5VZ4UdD81
	 eKnmTKjgTjQGjNN1RMG/L614hGSLfmDzQrU0ptDAIGhGec0zQbE2iO31mcje7fE+2/
	 Zem74hkLMNXzTeQ6ckoh1ceWb0Wzd+OOKkXwcXQKLu0VFt3PXFqfMfmdnmIa9iTVWR
	 QTzZmKLshusrybYorwBA9Pk5d5zWQcV2A+Ui73QLpI45LZuhUzlI1x8EjiCRSbljYA
	 x3Z4t2mJ1eqHzhedDzQRrM+HU6IjJe7IuDp2i3eEAM/q/Omeh8ylOKLxyhdNlHml1c
	 ovCCUvqWY1ZKg==
Date: Mon, 17 Aug 2026 13:40:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the block tree
Message-ID: <aoMBWuoLh1bAEUYU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h1WwR5FNWKV/4T7+"
Content-Disposition: inline


--h1WwR5FNWKV/4T7+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  8ce883fd068b7 ("nvme-apple: Drop the PRP null check chicken bit")
  ea2160c7b7818 ("nvme-apple: Require page aligned buffers on the admin queue")
  69d22a6b2f698 ("nvme: Add a quirk for page aligned admin queue buffers")
  cc0fec9b42cfb ("nvme-apple: Never set the opcode in the NVMMU TCB")
  94dd5804938d6 ("nvme-apple: Don't set a DMA direction for commands without a data transfer")
  87d5b9864c811 ("nvme-apple: Destroy the admin queue on removal")

are missing a Signed-off-by from their committers

--h1WwR5FNWKV/4T7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDAVkACgkQJNaLcl1U
h9B/EAf+KoAw1bEVvbr8S9jtqVJqBSOQaugc6NMwrE/XdcMTIfHyR6wsJpEnOZgz
Um6RJRzudErUzDHj/sSRfgcbFueeSpZTfkGnYm+u1RsMtb3EuOQt9uYnzuSWWX58
FmxUCg9BLWcJNG/kVP7yQyReuT/TC+giXnqWz7t0bahNSlHz+9fCe6QSNkQlBah4
rZPLHkKn7js2iC7qPJE8Y4xFSZYRdyLKjuXLz+pbJy+hUbBxsf9QjhiizTyP1OVS
7G3XqYPp7GNZljluHzJ3brWffYXMfduLaktlnXKC18CLDPLbo1h4zz7G2/XqbxtV
ALhTOPvlFHdpc9QiSm4MYgGhOI7+zA==
=b6rs
-----END PGP SIGNATURE-----

--h1WwR5FNWKV/4T7+--
