Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D314A4F0;
	Sun, 26 Jul 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087296; cv=none; b=ntofmbKPgxDwGPFm0UJGk4Lcma97Nx/QQCNeqaAW5VvKdrh4sdAPYKcg6v79DEWJGei1NaM6icXNB7lhV7SIUoGJGf1az1f12jUN6p4IqPav0fEsG2P7Kzuku1TSdKeyMP9hO6WMWyh+r13pV99Yobv6yEgWCcNtLfQObGzGv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087296; c=relaxed/simple;
	bh=RFnSYcWMKLeB+MzHLKLi47xb/nMZNHBxvoznpBhhDfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXTgq+6mtQYMeJ1PwMAN+ktErS5xs/ffg58Dd+XjDgXW2QsfmNcKvQkM8dc40h360cDKVmtutELVEdjm6pknoTcb/ONYNSjrbsnIT5nozsBd8yuj9LPFoCi4bTsfpFuwtJMginql5KCt/sZjDvy7yO3bcwhu05pwGxMhTQrvl08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYshM3l8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYshM3l8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24641F000E9;
	Sun, 26 Jul 2026 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785087295;
	bh=jEU1NacOxO2W7FgRGd27sl8SGdgN3JN5eqmHpu1Jzr8=;
	h=Date:From:To:Cc:Subject;
	b=hYshM3l8dRUdTYbYrlx5DNzedZARDFEF77/oplafmK8B90ob++DQ3v9DMGejF2u/L
	 F6/kvMefjm7E8625ghd5OH+/DASK71TjXJn+L4L9k1TjxyAcRIMGuKmdEo9L/UcuH3
	 eQdbknPRhhQ52QvfXuEZoSIo1L2oF87lwyKCOG54z6j1JBtGOdUYucqJdJBAMhO4d0
	 Z3RbOFVdNkL6JekhQVFTzTN2QD4rFtOWhU9uG+yoRwqq1j4IJCDjQlxAzohc2u+sBW
	 O4X4CiHvTlzOt6418jKUxLDPdEmJTuxMGd6VIPtIG4CZc30t+2SUVwvtNyYqf6sQLh
	 sQbEwxnHaoFaQ==
Date: Sun, 26 Jul 2026 18:34:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the driver-core tree
Message-ID: <amZFO8eUhS9xhfCs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="luvkLv54j6pJ/nYG"
Content-Disposition: inline


--luvkLv54j6pJ/nYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  4e63c0582e2ae ("base: Remove unused DMA_FENCE_TRACE Kconfig symbol")
  45dfa004893df ("driver core: soc: Unregister bus on early device registration failure")
  ba3dedcf3bd47 ("software node: Fix software_node_get_reference_args() with index -1")
  c3a280ff728a9 ("debugfs: warn if file creation failed due to uninitialized debugfs")
  06553566a841c ("kernfs: Replace strcpy(s, "../") with memcpy(s, "../", 4)")
  d996995a0ffb8 ("kernfs: simplify kernfs_name_hash()")
  32e21e9509915 ("docs: ABI: sysfs-uevent: add missing bracket")
  38f5745f49e44 ("arch_numa: remove redundant nodemask clears in numa_init()")
  8cfe7ad274bb4 ("driver core: attribute_container: Unwind device_add() on attr failure")
  6e328b4a208f7 ("drivers: base: Remove statistics group if encryption group not created")
  c37ab60d55e34 ("device property: Refactor to use RAII approach")
  1900692555826 ("device property: fix infinite loop in fwnode_for_each_child_node()")
  10864921212fc ("driver core: avoid repeatedly printing the same 'Fixed dependency' log")

are missing a Signed-off-by from their committers

--luvkLv54j6pJ/nYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmRToACgkQJNaLcl1U
h9ClxAf+Jpsc2NS/hyZHb0a390uJR9FEqXWwil98mHG2RQjX2UFnS7qCpAjCpWM0
F0lVUFoFIzSbV4nto9FZWdx5Vw267iQlS6q8D67Md3pFsT5pv+IQLTwGAv3H6ZUx
gXiUxirQYPEehsbgL+0VwZ2SwynEpyFq2UFFBEkKMkwkrY5MJNOcd9jfj0rTCh61
BpLzgxqBy8RzBDaA0u643jHg+iAFJZG7gaxUplNieKpKtxOldbDtEtK5vkfAFcyQ
GIJE5vNq62Z6NprBxTsc0xcGwPRWbxMBvbaO+UqgeaQq2m7wLmb5Xk1EEFgibL/O
Uuxd36iezQuPNEs0M20lBv5cbXTGAA==
=HiaC
-----END PGP SIGNATURE-----

--luvkLv54j6pJ/nYG--
