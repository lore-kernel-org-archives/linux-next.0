Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E035F192;
	Fri, 29 May 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055981; cv=none; b=F2g3I63BUbz9/FVBHbooWXa3eKuVMPleBe8YV0apht4OLCwqb7b6CB+WG3q+kNcz68N0zZcrkc4qBwfIpLjbMFJ9ctOj9M7Uz0W1OGBgsAv1JTwXLHmpI8dvRWSq5KjSRtxEZ7OLw4DxN0zxUvOD9mD/DJwf5Ralpbb83eIL+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055981; c=relaxed/simple;
	bh=oS7C1r1vKAWvaZuFxLGh5vzw8M4GVIoBx0ZAWl+BUmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD6+6NQDF0de0+H3D5IwVYQGRpuXc/JdAL9B7i3regRPUDvqo7kPvzUW8Bh02HxscdNjWaW24P/yTvLpmyN/oO6nRx2dbMxs+E/kKYhklrSh3VzfxX8ySXK4kXY/HmWD4VJ2H5TgjQVJEiFFUmlkeaRDJKy4Dz+fvubyW9KbTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9jZ/ZGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9jZ/ZGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84171F00893;
	Fri, 29 May 2026 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055979;
	bh=9yhzkv4IeLLY91mhWyV+JZrCO1TwniQnZyDW1H+53z8=;
	h=Date:From:To:Cc:Subject;
	b=l9jZ/ZGH1j+80fwzNBnxpdLwGiEHhsuQHI/es7WbhpCp5QkTbErYMDqePeM++wV2t
	 ZzzxuWn2q8og2dGOMk6sHyJ+TqqmQCd1J8r1VSwJIMSu74ZT1Fp5OTi0rf6/Q49TF9
	 XzDkO7npe75JU1pfCYUq+MKsnBtLfjM3d0M1qxjf/GO1FoPx2diiUbtl4gp433Odqi
	 ZarYvM1Pz9YPCbERC/mW7h8qCgTWpXA9rARwTiHNoaPBNDvqLq2Hs39/K3fMEYJbrY
	 dFrEUUs/eoco5mtaHw563mKUwNV/XjwPYOjkaOZu1LOm+cEryB2qkWRcdFJJbHXU1p
	 npryUrJ3xGKBw==
Date: Fri, 29 May 2026 12:59:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Chen Hao Yu <edward062254@gmail.com>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ext4 tree
Message-ID: <ahl_qMDm5pI8S9xs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KIqxlNmlM57gjPHI"
Content-Disposition: inline


--KIqxlNmlM57gjPHI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ext4 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "ext4fs_dirhash" [fs/ext4/ext4-test.ko] undefined!

Caused by commit

   a4841d91a7f57 (ext4: add Kunit coverage for directory hash computation)

I have used the tree from next-20260528 instead.

--KIqxlNmlM57gjPHI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZf6cACgkQJNaLcl1U
h9ABTgf9HvrKkaadDx3d3gKXtB4IxsQQtBfNl2Mreq+tcg8znFs5thEshw4TTiNC
SjR5iB+Eucw0jKU8lQgwXvQ/KiKEASF+uWsE0zfhDc7+3qowL/elmJx3cKDboeF1
Gz0ZW0TPu5+hcc7LC3cukKuNin8Lr1zXyT2OVa89eg1Iox3pvJBBoMEt/qvNCL/G
f6Q2GUaDEZj9HkOZn5t+qApDpPtXKTqSJV0dxOGksiI2o+KnO7EKw4X4cD3Y2lD1
ieKw+CgGML+61tHOhSHlRUV5BdQL9Br0IY8MA9Io7TWO5Gqqxe+4oZMRv1r3Bfmc
V5kegeUoXDgbcGuoG661nKW340bl0g==
=69Ob
-----END PGP SIGNATURE-----

--KIqxlNmlM57gjPHI--
