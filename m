Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB43D9029;
	Wed, 11 Mar 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227071; cv=none; b=s4/j7WHtLcNPVB2YKeHCzyH5vm/+j0FKvYJTkyegvHzzJF4nEpESYwFgJiumn51+CdbJMk/NI4zdDxzIC3hoy0RvG7J8aBcqSiy9Q1k9KgTvHFeLoUmSOA76lHngIPnF53S1BOcuZwb2vTZCbd20xVwNGrWRrnq5KrI0eNZaFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227071; c=relaxed/simple;
	bh=kLAtQRbjqBAn3zFhzja1/BhAN6Ng78ssdQRGWh26Bro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/9yehgt3scpnVnWtayzbOVZUtjIo5iiJ2BDyDIPzVUXHVJsvb1XCxyvr8fAISQWJeEZIz7a9TdOOS5TfY+wQC6uGMYHGPSOoZ2vFj65FbdCcvMc7k4e47h0lKNG0tovRCJguvzQWbMaOcTz1gu2IVs3QcJmffWij8yi3dPANUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEc3T4vi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEc3T4vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99448C4CEF7;
	Wed, 11 Mar 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773227071;
	bh=kLAtQRbjqBAn3zFhzja1/BhAN6Ng78ssdQRGWh26Bro=;
	h=Date:From:To:Cc:Subject:From;
	b=CEc3T4vi9E1arcruEBNTygaMwXAeoNQyNdotEKSSv1LpYG0iaKlE3RPTkGdD/trcM
	 8YH7F/DzuE20orRHFojw/QdzQQkhG4syap9R2dWbVdnC/Z9MOsXAk6hbC5Fksz0jRd
	 KFoon/mWXFy+479M2ntvwO4rnowMTB/r5m3cA8M/B5gGdQ30dF+eW2ih6kQHWigJLB
	 YPo+N1QDWViauanZB+bKYW6c65v5+5NUj49JXoy8C2ilo+IFNoREEY3A023tigfAwU
	 qASBe4nAR0TKL2H0qSw63tM9JfGt7jEDcnc57RUzOZRuZrxybjgs092C6OoMNcqe8M
	 rENOVOQXA/UtA==
Date: Wed, 11 Mar 2026 11:04:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 10
Message-ID: <abFMOxVnsvvP8WTC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H2mgfeklJ2IsXcwb"
Content-Disposition: inline


--H2mgfeklJ2IsXcwb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260309:

The vfs-brauner tree acquired a semantic conflict with the ntfs tree for
which I applied a patch.

The drm-intel tree acquired a conflict with the drm-intel-fixes tree.

The drm tree acquired a semantic conflict with the rdma treee for which
I applied a fix.

The tip tree acquired a KUnit hang/crash, I used the version from
20260309 instead.

The efi tree acquired a build failure, I used the version from 20260309
instead.

Non-merge commits (relative to Linus' tree): 4777
 4973 files changed, 320400 insertions(+), 82564 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 409 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--H2mgfeklJ2IsXcwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxTDsACgkQJNaLcl1U
h9CMeQf9EDVq7qsgqPZQcNHQsU4V+BBV5341WjFGsJA873bmfKdhOoDpVP5p0RP4
rAFFBWxxk+Z8y6NYHNFV0Y/XB1qt/eYNoHQaEDCjN8r3OprNB0nvqdgrt0scsIuw
XObXPDrZiKNcCVBrbjmqK9tCbmlH5EDL4dUA+atq5eKm+/4v8SgSjQ93lqBamFAG
fJNG8fBGSCrQT2cREN6EdcR8UAYzxwIs70H+KEbpMEXr1oCaxLAAGtL58sG+hH9d
h0rOuHihBLt8w6Xr4Y6QRs60iehYz8q6GUqyiwdmtcEsQJkD0Xhd98nVIOvmURUj
AcQVZdXQG42qghRJQgBhXCALSHhQwQ==
=lcGk
-----END PGP SIGNATURE-----

--H2mgfeklJ2IsXcwb--
