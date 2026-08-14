Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4448C8DC;
	Fri, 14 Aug 2026 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723994; cv=none; b=UThDN62vDZvuifGKk9nLTo1fl5dCzxSMqxLu46ZSDQn8uiJcjIJw61x0wSOpDomdxCAFiQ2fCPHPS6+AW6QlGsgvxcMLWh/Q9ctPbkbLdGCE++utKELXcKeWzlSiE4nrYrNbXpx4y+WFWgeh5/lxAj50XIMAYTESMd6ajuo5Zt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723994; c=relaxed/simple;
	bh=cOLZ1vs29Wg5DvmttKcMegSrb6MRXWe55Q/DFtpfDvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKtPSstQGyGYnk+KWxQ3V6PSbwwqec+lLHBi9fRrc9WB0wIYPLteUQhZWMv39vQTnfIj+xgyCtV3xyTSYjFNbP0kJ0odvHLp9dd0YaHQAmQHARWgQzji1JxP9TDWjvyWOQAbhxVZlLNTHeneWPSC7giaFMo8bunQ6OX66v73FlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0NA1Shi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0NA1Shi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4E21F00A3A;
	Fri, 14 Aug 2026 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723988;
	bh=Wt2jGEmy/CePDPbgFSlTdU5gxhpcN7zful8HHBrXzrg=;
	h=Date:From:To:Cc:Subject;
	b=C0NA1Shirt4742/nNOUSf28bKsCEzYoJ3A5070SSUy90jwBtMPyjcI7MCXqGLtz6N
	 w3JVz+xX/qHOvdYS2xUMpTRJf4ceDdv0vQspIupAUC+zjQxsNAUQ9w8eh9LXnfiGO5
	 P/RfMArxg95mb6aJwgCifIAtdahjJqgH0Ap7Y3kH+CgB+lSpeU8OY8WK1gCwvQyrA2
	 OaQM8cXuskFkotzi6gvJKzipwUlaYySbnl4EariscCrN1Aq1XsqTROHWqa054sJNKC
	 8PkQVMsty3TbA/PrMV9RUTp2YRMi4r8oeRnclGZKcRCHaX8M5h9JQWm7QYKWPBj5Vb
	 ounmKtgM8JPYw==
Date: Fri, 14 Aug 2026 17:13:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 14
Message-ID: <an8-kASiXVgQCAMj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pb0ucql5CCzjvO+y"
Content-Disposition: inline


--pb0ucql5CCzjvO+y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260813:

The drm tree acquired a conflict with the origin tree.

The drm tree acquired multiple conflicts with the origin tree.

The drm tree acquired a conflict with the mm-unstable tree.

The drm-xe tree acquired a conflict with the drm-fixes tree.

The fbdev tree acquired a build failure, I used the version from
next-20260813 instead.

Non-merge commits (relative to Linus' tree): 14006
 12365 files changed, 837765 insertions(+), 254639 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--pb0ucql5CCzjvO+y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/Po8ACgkQJNaLcl1U
h9Ctbwf+NwA8NT4AbmT6/5AwttQ/UY7wP5iJKVAkTQ+MbqPWNyGOH7oAJA6/gB4O
EntewoiRTaZRCWSkkTIeaXOLfOuwAa14TnjYupDyhoHZSCVK6y9QThNGLx2D5dDg
o1oeUcrMNtR+hRaiAFPKus6G0ckzmhJQTSGL9SZkZ4ryh8td76r6I06oKxVK4B44
Z8oB0P0GXP/z84MgVIJLPqfTOWI4g5dQ4Fp13hEtwCW7zdQDulPpMrmsAkmBH8mx
w8OI/JOLlTqoycpy5hmS7pehceMiRB5nfBVxA35iJijUEnsOKTu6sIoVgqGMtd9Q
Q4AkErdcnEs3GwaAMO5OWrddQj44zQ==
=sSyM
-----END PGP SIGNATURE-----

--pb0ucql5CCzjvO+y--
