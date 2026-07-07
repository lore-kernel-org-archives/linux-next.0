Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC240A92C;
	Tue,  7 Jul 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429269; cv=none; b=T5OiCUPZis2p8bf+yw2Yaq+niNb6lCPA6BckQHCa6M+POEKR6BRG2dx59thZfzIMW7DCYvemTQ+/pe5T8jiIhRPq7Huf0tNJCEM1qWHDZItRG7XlHKscsNyfl8/UiLU6GT9vuCw2Rkxg3D6nPqwMkiZOJSNZEIcidT/7lzdOPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429269; c=relaxed/simple;
	bh=IKo8yWpLIBOWVn10Lrh8JWyduqo/8kSF4QYt168Kvj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eknwUHodGjlaqT5r8a6Etu/Da8WEW7aWmFyGXIyGBGQnfk3yA9D83Noc36edtV+gJb9GuehQVFORziL82GC5drwYwUMfIoib/ga6fChlutT+OEDWHH3kvA48sBmR+3zrFeWyXr60TQtW1buv1WNSPQHdMK+2p7xb5AarQ8dM2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/nRfiUx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/nRfiUx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2479D1F00A3F;
	Tue,  7 Jul 2026 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429267;
	bh=Cht8wjKKjdOPllLidnwAoAIG5NxYdDcVq3OxDQryxoQ=;
	h=Date:From:To:Cc:Subject;
	b=Y/nRfiUxAVgnqzLubH1l4hNXo+uhdg5lkDcTKy5KKuJ8xD1l0B1oQihoEJATDRlU4
	 BWrer+NHEz+x/LteVv0pj+SARIrEmKTQJqniKZ0IfeKWdzH5Mr/8JLBaxVev5/OYeK
	 9RloRe5Gc9tG8pdpwV2Q/bJIH/1tSG79viGSxg+A0jShXrvnVCy3KDbpB0NPQM7jGU
	 lHV9kuyb2mTt90Buo5l4L2OzZ9IOM4hzJh/Z/vgrCi2aAjaVzTII5b2qOaQQyDYZnB
	 e6FslxrtRZVptOYq8Hb7Cn6isbo4MrvOQzo6Ef6fYl+gCvoVIPnsdocN7/jJsW/rBn
	 4djutCZTrY5BQ==
Date: Tue, 7 Jul 2026 14:01:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 7
Message-ID: <akz4kAO7vxiZI9v4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e8cD3NllUa+k5Wwe"
Content-Disposition: inline


--e8cD3NllUa+k5Wwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260706:

The risc-v tree acquired a conflict with the mm-unstable tree.

The kvm-arm-fixes tree acquired a build failure in the final build.

Non-merge commits (relative to Linus' tree): 3756
 3863 files changed, 138425 insertions(+), 72637 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--e8cD3NllUa+k5Wwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM+I8ACgkQJNaLcl1U
h9AKSwf+JCHXFQx15aUkdEmcUrihUmeGqQFYYqWUdzcTMfqmVrIbDAi0dxaOQiVw
jdgYvgMpHveTBf/PC2n11vCcoj3uOGzVrCc9W07bidTAURJ1+iedb7oPsxeSivze
pFzVWNrGHwOiXKieH3BwXRCJDCbfOVFgy25IIQVb/LSRHCABOBZRopzVgE+eU8JI
wKzuBZFpA1920wW8UDWMSL9iDtD1G/XsTbtYnpVMdOjAyR228f3xIms4oDqpYvIO
ESuclqnO3jK9bLIKtYpC0xwFgfUZryP63+B9tTbLEe6K8IRJJoi7R8GCoV7j8OVr
I2YG0E6EWIrw0i0tXroxkk8ETd2Erw==
=FqcY
-----END PGP SIGNATURE-----

--e8cD3NllUa+k5Wwe--
