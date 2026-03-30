Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956637C90A;
	Mon, 30 Mar 2026 19:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900602; cv=none; b=SWgg41QQcQ/rSGlifqP3rYbQ5S2Ic4fRVM9Rcpb0sZSO5MaBaCmL+iL7P8NxD/ZmSvFGZt5cITJhewjI3r3+AjDfG1jQJJjIaRp/zoWltBMZmBQQzqWrt7odq0P3MZaXYWwYTO7Z4XiwbEHKVUjjbI9EiggzNpVt+BsXA9zYf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900602; c=relaxed/simple;
	bh=Ol0//vnGlXylHOlH+hQwT4VUcn7QOOR6MuE9wzDPzbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+7t9De2MLGsGJIPPKZPQTXISks6LSS4dI4gan/iyDpnJcyhx/1P9K16+vneXDYhU0V2ORYYfkbB1vTTpKHkg6wNbysgeZI57F107h5mYkXgulZGTIbZpbgEUSU7GIB9Q5NAtBZaOyIM/QzlPA7JHQgqARAvsy4n3NjFOG6FZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltuWdkXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltuWdkXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F834C4CEF7;
	Mon, 30 Mar 2026 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774900602;
	bh=Ol0//vnGlXylHOlH+hQwT4VUcn7QOOR6MuE9wzDPzbg=;
	h=Date:From:To:Cc:Subject:From;
	b=ltuWdkXy6tosTlZuYbKRUPA9+3//hSFz2OaaZgn82lB40lPGO8fJJeF+a2+OrETmZ
	 V5cwQo+WgQ2uBeyAoYKhX7+Mx40r8VLT7BAoYoesqXcSFWT7ruLtaup+klWCAFnv6T
	 77OXsanBf6mGftotiV3hwtvqcHj/8E/eqGZoDG4XbTTEZhA5Xg8a14Of1xlflIurOv
	 /h//fj4HpZoNNgUF3Jdrf6oWPfXDK8HWDQCmT84t1uxkkgCmyhlakSFd1cCxBUYlij
	 MwBcYM8QUOEjZxH5NPsCQk1j++jawquZ6+ghlOz+daF4q2eulV8Swvbhz3FEPMRNky
	 NNWvl1KeAnNRw==
Date: Mon, 30 Mar 2026 20:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <acrVduPfV42PD2_q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udxtZIX48j4C5/7d"
Content-Disposition: inline


--udxtZIX48j4C5/7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/powercap/intel_rapl_common.c:1143:32: error:
'IOSF_CPU_POWER_BUDGET_CTL_BYT' undeclared here (not in a function)
 1143 |         .floor_freq_reg_addr = IOSF_CPU_POWER_BUDGET_CTL_BYT,
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/powercap/intel_rapl_common.c:1150:32: error:
'IOSF_CPU_POWER_BUDGET_CTL_TNG' undeclared here (not in a function)
 1150 |         .floor_freq_reg_addr = IOSF_CPU_POWER_BUDGET_CTL_TNG,
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  6cec0a0079bc1 (powercap: intel_rapl: Remove unused macro definitions)

I have used the tree from next-20260327 instead.

--udxtZIX48j4C5/7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK1XUACgkQJNaLcl1U
h9BnTAf+MerdSetbw5T+S1lrmVR2u4mQEDd7w7W73smrs7izs1XdvzX00T/x1XFr
3i9xo+ZLw228C8jwbbOpThu1oXDuHXq2iPlvFN1iJ90VHVx6R7BVcKZHAzjtLohZ
qVsOq6pmu8ePfmNc0ZQyd6oz5knospcWw7vp+iLvNO+TxQdfUVtSW+1Wukwi1sZF
UPqdiE2Y7Y7oe6GEBTYfqDMy4AER8DggYrEa1nbpB9mpLyUUTGP0E2ZPX2aGGDut
3gMclE6YN0ixmQN8GneJPbXaXMCjsjOf/lJYOa9MZDn7/beo20u7EkUeGNsRcU/r
KXgeEhuR+ovOXQbbTpZQu1n8A04a8w==
=M9CH
-----END PGP SIGNATURE-----

--udxtZIX48j4C5/7d--
