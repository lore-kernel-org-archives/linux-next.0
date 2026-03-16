Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AD33E377;
	Mon, 16 Mar 2026 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773689238; cv=none; b=ZzVbY3qW5gMxRGDDhlh49qcqs/ppj65ceZ4Yn3eAdjqpGX2JPtlqQ9y3F7+wmqO9KV3zJuAC8CC/1lU9JLHAESwUTA8mtZ01y26NTqgkHj4UlcjP6eZgXWXEbIPxdUBmuV3XCUfNCPaoUXe+Mo7jLkVVkRQZaUF8wERumkJwF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773689238; c=relaxed/simple;
	bh=qCiAHwPhGVC5GG91d54VWBe2UMlpFsQI8Yd8u5ZD2rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAFRz6Hi5GBB3BNIAY7uCptZfG+5gKHVNuKqukz1EdjKtYn9jF+AjK9E7IE/73UghocrNKZgpJnQul87ISiZ89IP3sqoasYc1Azq1TiZUz+FraYc1EUItYV2ZPzc01DBVphWPjud9l84pYVLT9lGy4z4FZp+nGcRQGJLtW+/yC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXeOt0wH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXeOt0wH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3964DC19421;
	Mon, 16 Mar 2026 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773689238;
	bh=qCiAHwPhGVC5GG91d54VWBe2UMlpFsQI8Yd8u5ZD2rQ=;
	h=Date:From:To:Cc:Subject:From;
	b=gXeOt0wH6CGd1FLXDLewPaNEXKbB3ZdQMfudIiwhpm/BO86ETEX7iPiNHenhyHc4K
	 iCQsuJT2NTwlAelSE3s/s/wuJF/z1brVG2iCBMRnaMQxGq054ffD11S8GsR3uIkFiG
	 H1AbPhQDrTaiv+NfgUk8+KeeIt2RVG2T4aeQyvkiFtbsVaA+W7yNyZRU3i8hFGjMPI
	 Uxv6U7GJs35uKB2xU/oFi5OsA1R35nPCpVv4FqcxUodmEfjFjQ/YrT5X+zSapWrzey
	 PQvXBnp0T7G3IkEwwpaYhAO+38y+y6P+Ku7Jibxvyc0PETH1eRUhCtE/JqqLt5YrfT
	 G14mW+sKiLBiw==
Date: Mon, 16 Mar 2026 19:27:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc4
Message-ID: <6e1591bb-a134-4c4e-9501-a045e6672b0c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7qN3jQeaY8WgeRr9"
Content-Disposition: inline
X-Cookie: Not a flying toy.


--7qN3jQeaY8WgeRr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Trees being held at old versions:

  kbuild         	next-20260313 (looks like a merge issue with
				       something, maintainer investigating)
  mtd            	next-20260311 (saw a fix go in during the day)
  sound-asoc     	next-20260312 (kunit issue that was masked by
				       the issues in -rc1, expecting a
				       fix soon)
  vfs-brauner    	next-20260312 (simple kselftest build break)

Trees with signoff problems:

  imx-mxs	(missing committer)
  iommufd	(missing committer)
  rdma		(missing committer)
  rpmsg		(missing committer)

Non-merge commits relative to Linus' tree: 5901
 6084 files changed, 417387 insertions(+), 125394 deletions(-)

Top trees adding commits to -next:

  630	drm
  486	net-next
  358	mm-unstable
  275	drm-intel
  230	tip
  147	ksmbd
  143	iio
  131	imx-mxs
  123	kvm-x86
  104	mm-nonmm-unstable

Thanks,
Mark

--7qN3jQeaY8WgeRr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4WZEACgkQJNaLcl1U
h9DDTAf/YB+YV7WLv4HCK4ofMW6JtAQfjwavDdRUNt/RJjS1zpVR2HQlXPiDNerj
utOqmbpJlY4RE703qbOxefEm0L6ul0McEkxYSfLRVzUai0Om4dY3ULqzMr6KGyul
8LVTT3Dict1cc8oVRjjdnhl/YgUk47qfxrSi2nAQzB42DlsGkh1ca2sk28oRcgCq
Y62DRCfn1G2Mq7srsnONbSqxcdjoxADcsNYWWk+rAZXbnK1BFxDlNJ+SRetdlbA/
HRfRbPY8bPfrvHaNnAkXE3t9WSKrqvQsCRt3xp25RQF3ExT+FT+qAaawj+q5Zx2G
57Aufaqkkw9J1rF4pMv/Ch5R/PkeBQ==
=wsxB
-----END PGP SIGNATURE-----

--7qN3jQeaY8WgeRr9--
