Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E11392C41;
	Mon,  9 Mar 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054617; cv=none; b=MWq+aOmZD897GM1EqudcM6QFMvMtcixrpXW+r9Amqy6lpaG5vWIhxbWTerXfLcOKFIUwS/KDb3+LQRvm+E42m9uy9Wa5uDo2TE6vHwr/EomIveySinj2D3OyFIi8M6WeI38/3+dF9hRDzstI4V57+1oqG6r6SKkccBXiETdFd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054617; c=relaxed/simple;
	bh=aO3Ha1TRYob1XazElWZ3TEHpuidXNIifVheYEMSR9eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Apz3lFDA5wtJWY4qUBSLTNMX0iocHTCx104NsOuiiYBZh+6Gw0Byo53MwadPBPXLZGHXNgYGDhNWHzbcKDDojh1klEwyE8rhjg0WJ4j471TR8YfonpQ5vhc0KfVd7IqtCHKHAGtr70/kgpkydi26eQ58q5vlBJVa8hQXk44m3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlrT1lUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlrT1lUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7961BC4CEF7;
	Mon,  9 Mar 2026 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773054617;
	bh=aO3Ha1TRYob1XazElWZ3TEHpuidXNIifVheYEMSR9eI=;
	h=Date:From:To:Cc:Subject:From;
	b=YlrT1lUTRQxu7Pdy7ASOW6QWraLeH+8+fxKPHyreB3UCxECazpTEhmXJZ5Pm/UhHV
	 8sLSGN2Y/ie3GjPfyGwx6O+zN2fTNQThadPcUWmGHcAo/imurNwatKC2c3H8eCISbu
	 k3JAtFyZRi0gvytTkxcDpb11dAIfo0Vc+F0CSgDCg9Zsl65uCV4PDm1eZpyuiakOqf
	 0Mi5tPYKoc+BR/omHH77wgfVCdXCB4qBoQturToe8jUSfE0yZDZfss/M2Hy+pbWFvS
	 qapEuwZOhBUUQaBIxty7tQShjnbcZAn2R7kzBI2NkUQTFGzLkk5Z2Q1IYXIUxfntK4
	 3mB1a/K3DoLrw==
Date: Mon, 9 Mar 2026 11:10:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 6
Message-ID: <aa6qlUAYq55H4Hdq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CyRqperCvMY/Ootc"
Content-Disposition: inline


--CyRqperCvMY/Ootc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260305:

The rust-interop tree was added.

The mm-unstable tree acquired a conflict with the char-misc.current tree.

The drm tree acquired multiple conflicts with the drm-fixes tree.

The block tree acquired a build failure and was in a questionable state,
I used the version from 20260305 instead.

The leds-lj tree acquired a build failure, I used the version from
20260305 instead.

Non-merge commits (relative to Linus' tree): 3830
 4125 files changed, 285477 insertions(+), 69625 deletions(-)

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

--CyRqperCvMY/Ootc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmuqpQACgkQJNaLcl1U
h9C3mQf/frDpUqlHzMKiS6r2pkUyOTR2mQFgyyaxpBsq8FGcRvP+eINcOz0KDszL
EjcOBKfUqQQBQrd1MSj97ro+jJWhYTgYuUiPkNHsNLNR/5e7fUWrP6r/dgDZ8pDS
1WRhvZ/prmZCiXdMYsIT9v4ONuJuGSUQDb3cdULCvy4RfSaSQXOrkJwl/xPa91x6
0cO5Bqg8uLg4xLziMJ2bxxOoDK2fqBmMJq/r8L0nZ/VRGpCxgD0H6ArcSxUox7UC
iqmHA34mdjDoNgXwSu+e7QjGU7SBAe6xwl9UVnz0P49xboSXnOCqf38YKbDSBDnD
4xWZzESg81j4xHYz10espl+ZItxbfg==
=R7tj
-----END PGP SIGNATURE-----

--CyRqperCvMY/Ootc--
