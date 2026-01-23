Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E01D3EBF3B;
	Fri, 23 Jan 2026 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211499; cv=none; b=NjnsncnQ8UCQJjsOu2gMw34Cz79qU2sqZVDa3OLijj6FyBUxRDwK9HT6dCZ3kxLLXZxcUo8qRGVVr5m5e4F+xGqEAild7wNGKMVMzNFT8thpWXWSgAEqr94TleD0sqe9ZcInyF7gmJM+evajwZmv/I4L9N+M73XkZNLdWmm5T58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211499; c=relaxed/simple;
	bh=KfvsAELXE4sqliyMi/reWA/rqizM/AnsEgYroG7kGy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/7p1GpSYC6rKoZOZ/mll0U8jo+gdhV9RiuiEu6Wkm0aK9zCWiWRk0ZK2mab5SVcGsCRnY+ncETZsgvAwvXHCZMwbMFUMqFu3s6IZsYq5cy8zNplJBB8ar50miOCQJu0dmowwc1Jwj39fDfNgW/+zBs60hsOREuOPnLCfsfn9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6DLO6i3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6DLO6i3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21922C4CEF1;
	Fri, 23 Jan 2026 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769211498;
	bh=KfvsAELXE4sqliyMi/reWA/rqizM/AnsEgYroG7kGy4=;
	h=Date:From:To:Cc:Subject:From;
	b=k6DLO6i3XwublK5tAcknS3lOtvqmu11BgLwakI9Tjx8oDSA3lFaQ/sHbn6whIOXfQ
	 nSMTc0NuyqxvnBb4uVgRYQ5f1phkBmtUmFncmYMM+knwWh5G2JALiN4QxX5LORe48j
	 yQyFI9fvkxdGVrzN8OHK95zSqT6z2152LrwkWdSS4xO+DoVu8vS27lVRyMQG54hvH7
	 UgSfu2cwOBfsvyE0nc5RdTeYxgtxvDJ3e531OpJHhPM5ZSq8Ii3HliwzfUYCYkQFpz
	 n0Rfero9xzYLwBWTclszfkhEXTo+C95QM6l2Vw2ubIq7m4Wvw7ofFV2l5tOP1qmkDm
	 Pk/N22eB22yZg==
Date: Fri, 23 Jan 2026 23:38:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 23
Message-ID: <aXQGZ99IJLq-r4cX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3yz3c3jmzdZKRbM"
Content-Disposition: inline


--h3yz3c3jmzdZKRbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260122:

The drm-misc tree gained multiple conflcits with the drm-fixes tree.

The drm-xe tree gained a conflict with the drm-fixes tree.

The block tree gained a build failure, I used the version from 20260122
instead.

The random tree gained a build failure, I used the version from 20260122
instead.

The drm-rust tree lost its build failure.

Non-merge commits (relative to Linus' tree): 8405
 8215 files changed, 488720 insertions(+), 168749 deletions(-)

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
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--h3yz3c3jmzdZKRbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml0BmYACgkQJNaLcl1U
h9Aanwf+Pb5GIepo7r9mwcK9PqM6YdTNlY0Be32pCE3/vxqQeGG97l2OhFEva8u9
BSYM99DQD0BvTD2v3mHbdnxNNmEiond3rrid3+AR9RHpGq/zgOXKZ9pZk1lRNZwh
vrvp2PgFKdqRUnq9je61iXYl7JeiVUAGPYNo2fs4ixqmWusUl98umIdc1GD3gmUO
zqFq1hmLVVGIiJKRkzM27WLjcB0KmUcYHf2SWVA6ZflPrMcGVv5I/zfFox/1y04g
bZcZhsX2WmcXijJQPAslxB1gdKUU9Q6kgnxC38/tfCA9zu2KdK/fTz4ud8EqT4dn
BTnbSDQ4Eh2m13wdAIShZxKwlUJcbQ==
=byjt
-----END PGP SIGNATURE-----

--h3yz3c3jmzdZKRbM--
