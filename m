Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA223183B;
	Fri, 13 Feb 2026 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771005373; cv=none; b=K4n3CLJvXH3Q4wEQDXLgIhxXojuGc0lClXnRYJJrGGI2KGO0od8/UyCtE2V0cAIpphKGx1QLPJFrCzNO9j6EQkdgDE6CndSBEYl3kLrrQAdyUcQzlZ+Wqpw8HrUjaaquuS+e6SmLDivBQGvrkgzkxYRkOh07/jdRnuhJNqdC9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771005373; c=relaxed/simple;
	bh=t9pv/1Sxj6D8BZErsrSoCq6/exHTY8duTnucnZIbyU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSsOoixJ3NTKYPjos69dSz22tXz4BpF9b4zkPeX8Glpz0ZS4/YqEmRWeRmvEpGuSvyAxMltQ5vLqEpstd1eBk+EqPELqMBUt5tvM9pH3MPJKhySDfRVAZQyTgy6lNHUZ/2M7ZXnlTGMCPqLH+ZW6rmkVOUDBUyOZYFmUepAd66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWNKE69J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWNKE69J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEBDC19421;
	Fri, 13 Feb 2026 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771005372;
	bh=t9pv/1Sxj6D8BZErsrSoCq6/exHTY8duTnucnZIbyU4=;
	h=Date:From:To:Cc:Subject:From;
	b=KWNKE69J6/fcOTCkX/cZovyxf8T7ZaYN42lNY035Q0m1Rcusr45YhofyYBN48GOAN
	 e29XtqV4pCRuleGEke2lL6SNPXaLT7fM/KGOzAtq5v8FwNuv0VPzExzgMgr0caqT5B
	 tl2qKJsQYYwF4dy9gC2IPRU6mZkhdDKraIw/HtH/lne1YMyEtE9BAZvMwVYryAw7xM
	 b/5+1IgUPn8gWSgUsIH0Q4Adeeu2mXKkne/OE55mbPx1LNhHc1mwbWRr/vxBsmr3bB
	 NCkrZ3V5ZpcVeOa3fckCnJ4rKDsQGxg9zZk9+0J96VZvyoii/sKeV99WWInPBM1gwn
	 AGQqKh0XRSj8w==
Date: Fri, 13 Feb 2026 17:56:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 13
Message-ID: <aY9lueM7g6JkrqLw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4iPmUYSe0G0jr7s"
Content-Disposition: inline


--V4iPmUYSe0G0jr7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260212:

The drm-xe tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 3042
 2778 files changed, 128792 insertions(+), 46511 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--V4iPmUYSe0G0jr7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPZbgACgkQJNaLcl1U
h9D5LQf/RN9fghFEFHaf8Xf2A7SAIqjzrOgvu2QiCyuZpH8DEU0vzO68fdizngiK
KLRqP4B2LycEX86A8g33tPLqnzaeTceVM8pTBWmVbSVK2lxDucKtIBNgAZdF2tNW
HhfzEE0Tr6nVg5qKRHAYobRZrw3C4xi5x95302rzFY7+x7Uq5NLFO/fQPgPFUXOD
DtgWn/gUgKsPFi3bXpVCBVgrhw9HJZFrAOhnBznncGIe/yb7aCD07ARwV1mEC1o3
w3zfFYgfl27/o8oilk6tZV0N49iNQNG2s8bLU+LfKaJGFFScP4dSPEF7wrzfphzu
F8so9ap1vmBbJsUSgZwdbnJ95wuJtg==
=vY2W
-----END PGP SIGNATURE-----

--V4iPmUYSe0G0jr7s--
