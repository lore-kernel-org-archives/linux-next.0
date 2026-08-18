Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A137D104;
	Tue, 18 Aug 2026 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086659; cv=none; b=lzctIt0Ce7oMlHRzlI1QJn/E4UQntAw6vxm28+Owc3TRzpPWW7kMzbznUtubUcok9EUXrIVxcFViSbg6vCNRNpOv5gWtPkC2gLjYRGdh9LGZQHcPPuXdrwj5vXKGUadfJm61pNAHyhBQd27qWl5d9ubxc1laRCagvpc1YlDwCGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086659; c=relaxed/simple;
	bh=pru/wwxisjsTr84bmkXI8SvFImJWTfkYBNu1Ie7/EvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dc0JJVIiEfwM+KutU71nnLLX3e25HOWuBXDwSytBuIHrIzSwVxhA2Wb6YABlkOQ/67wX2XOt37hID1WqeNZkL9PrQPSf2sj/gx8Jp+wdmeu5uy4ucOoQiBGFecqMsxi6HeBtVrmX6InubXWPVe03aqTeGj/mU3p5bpQMZODOfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZgiXo47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZgiXo47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42131F000E9;
	Tue, 18 Aug 2026 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787086657;
	bh=k9m11b8Pej2ySLL84shiRZrypM3bvFP7gqKtr1S82CA=;
	h=Date:From:To:Cc:Subject;
	b=lZgiXo47N747l7aKr7GZJofUs18jMmIs6C8GSs7LauXhEQEo8Qk1WKXJzLBarSmPE
	 am1DeBRTyxa1Lofrb+UltZjcUmAvLCNUo4e+OPJyUQPFcBjTKFRAtwBhks43wHZcFO
	 WsW536Dl21ojj3iDOWJ2nOgMVavKcQYMcd6JPKCCPmatUP9uUfFdOPTsdR5LoJEZEu
	 7oFbWZP2QTlkI8+9V931bpnfXYjdF4cK+Q/s80bI2pPNO888sKUEa1HQlvSuxRIOlh
	 rJhxpXlzJxnK8tHhkvltnWae4Ri/o8CxPdPNdjg7lX2z+iS6ym+V77ttaGRdoXODYn
	 hxSW6xph272ig==
Date: Tue, 18 Aug 2026 21:57:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 18
Message-ID: <aoTHPh0Ied7KRWs8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Vh7O4M7ZRo7wsE9"
Content-Disposition: inline


--7Vh7O4M7ZRo7wsE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260817:

The clk tree lost it's build failure.

The net-next tree acquired multiple conflicts with the net tree.

The block tree triggered a latent issue in the fuse tree for which I
applied a fix.

There was a build failure almost certainly due to the efi tree in the
final build which I ignored.

Non-merge commits (relative to Linus' tree): 14499
 12548 files changed, 856846 insertions(+), 254055 deletions(-)

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

--7Vh7O4M7ZRo7wsE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqExz0ACgkQJNaLcl1U
h9ApMwf/bZafS4GFrPZpoKP65mJcty98gYlLqi9KkG0yNBtkFPOaESKjZCMxhUj7
s123qsI8ZJ3qQ5hAmNU2Wsd6dJlY7IEjGHajw/GMoPNM8MwqRDAGi46wL5sq2qnX
AZ56w2Z8H70svjL228pxUWJdQAVq2V9a96oTh2FcKDOcOw6pMJc+2pik1zlpqAOa
aMADvTm8CTeoUYZNy8OOwxBdq8J/VkYb3D0m8frucp2G1Qi71JMFbt78/TDK+xrj
Z/bB9ISQxselp2qFE+diH8LMgkFXNmN/EhGtzn5eMe6ZyBQ3ndYGdG4TJyCm+Pfx
SOH45waaVhC0b7c90f7nbAJceKKg6Q==
=HSK6
-----END PGP SIGNATURE-----

--7Vh7O4M7ZRo7wsE9--
