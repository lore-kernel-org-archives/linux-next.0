Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C93E0253;
	Wed, 22 Apr 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864106; cv=none; b=Ni7x7x7HOZGtSPSlafNS4YB5HNwIveiUab7Kf19xo1Aw7BHVM0XSg+ThKOa/M8UmllX+jipepl0F/SS3U6fMVypvg5GNWlnfJZ0vuEu7cykH2eD27ZHNdbsKjavBXMyKvcUF0QmA2Wm7/LEzD0fqZbjd/0Z1x7JS1Eq2Wp1h5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864106; c=relaxed/simple;
	bh=ovyCN4LnlfEecty+RIxu/oRKPkn6iDUjZRbF0RBcksU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bp75XbdU66NCgAUJw601evR3pYCPibzio3gPjf5OZ2CGZFzLzCtRDLt0AzT1/s5pDTXKFlBP0CZFWz2GY42sGRO6quvYD6ajZkF3qHPG2oWCiaLWeWEjxZ+wlPDNMcr/JMTRUvri/wL3LW9Kx3E2zOvufF0rJRu+ku/S2569Cyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcd6WBC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcd6WBC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41643C19425;
	Wed, 22 Apr 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776864105;
	bh=ovyCN4LnlfEecty+RIxu/oRKPkn6iDUjZRbF0RBcksU=;
	h=Date:From:To:Cc:Subject:From;
	b=Lcd6WBC5FQS1TdITnQXOt2oLeSGIA4fwTi3MZXo3ero3jVoTP+qJVo1rDssI9SZ6T
	 eVOtXs8Udb2j4k/U7ampvqwH7P0E3UtaEBba3lZvwXmBPChjKSorGfuoogjYaid2/y
	 gNrTjD6vUeUR66QdBoNe6XDd9jZ/MrK90JU/B0nWHj+HtLaOg7hQjOE5PrfD7vOOhA
	 gNhn+p0gvEGdiSUvxV7MW+Kk+gUSQm121kOz6YACfKBh0f5yviUkID9pr/AYxeGYl7
	 kwPOZgE6Knt7rZM7djolhB6OrPPK0R3r+EtR4XUU1FLnLv5b/N9uxCcZ3R44jpfTeo
	 S7JufEC3rM/sA==
Date: Wed, 22 Apr 2026 14:21:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 22
Message-ID: <aejLZgHmIrOR4vQK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TEe4eRahHz3qiPFN"
Content-Disposition: inline


--TEe4eRahHz3qiPFN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1) material
to your linux-next included branches until after the merge window closes.

I will be on holiday from 25th April to 15th May, Thierry Reding has
generously volunteered to provide some cover from 25th April to 8th May.

Changes since 20260421:

The mm-hotfixes tree lost it's build failure.

The mm-unstable tree lost it's build failure.

The mm-nonmm-unstable tree lost it's build failure.

The loongson tree acquired a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 1597
 1882 files changed, 48035 insertions(+), 24436 deletions(-)

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

I am currently merging 420 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--TEe4eRahHz3qiPFN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnoy2UACgkQJNaLcl1U
h9C0/Qf+KdC9n8K3YhPSeDx9VB9UoaaCfYXgQJERYcRltgeGltvJ22rqVQkCCtZ0
UFu4ABzu1s7A4L4RE+oQl1WaOkJ/CY3o8lX9f+e75MDaobUWdpUpHO+M2x5hm1H2
PmSHCOgGM/dHPsQzQn7ObVU2eDeJfPlbnIUdKFZ7T1OJ0ohvWA6FolpV+QCC26vg
SaZIZdFR49/AWcAezQEpiq/BVYbkrmuzdNrpL2gMpUKfxQA8gv1/bij4jYZ76+dC
SRYUWoSa4Tcsi53m4RzV1pVW0cqUPaHMshKGYg1Mxmf04RFuyhpw0E+5X2T87rNR
jRVXlQjC60lASxOL58thlsuq+wv7yQ==
=jRdc
-----END PGP SIGNATURE-----

--TEe4eRahHz3qiPFN--
