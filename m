Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B41E4BE;
	Mon,  9 Feb 2026 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655945; cv=none; b=pEQy4CwTvEJ2cDhUHl/LzM4ckpSFgFXGAd91hQ3rJFgTq7p5YdOVePWK2BI9/Uxc4xdlkkuWEuq3Jit1nEz28vQlJQnTt/Lq9iXNS2R68KBn/YfSVs7Be+17nQgvm1gOMIpajrs2oGz7R7YQCKy/0A+o82G4YGSZNKXqz8ttkPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655945; c=relaxed/simple;
	bh=/DBijn+5mAwXwHnS+QRk1HWeb3KL9HS1jQZmiLeVEXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6CmmXj/UTj608FUGzWGPUTiNiw8Z3J1A5I5WUqKVnVUTToVW9EmwJFNK0eGtIIwi6N9O2ZsPWv01ZHRjy5lhw6/l5z+nZw8348PqMS3eLXHfWgOwtIaZUfl+qpqw5TPcJ+XmNYurYRCilReJ2K3fszzU+nbsiBGjDFID4o/R8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8wmTvhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8wmTvhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDC3C116C6;
	Mon,  9 Feb 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770655945;
	bh=/DBijn+5mAwXwHnS+QRk1HWeb3KL9HS1jQZmiLeVEXs=;
	h=Date:From:To:Cc:Subject:From;
	b=i8wmTvhppjrxTAwsULgPQ+wA1Do3z92HAe/hkegiNppdvZ8UQfUNXcBVEm2V+2GCL
	 hEiKy7AZUld3FWxZpYEmKK9jaREX5HY6/8BaOxPgyyUQ8FocRhlUyFMBeTOJqdB7hK
	 A6R0EiiWS7NbLzjBWxYZ0OYeahf7kneKCO3Pj8l2pumwJaJy2F6HlGLGjfR6naWNHc
	 E2gOK49oILC9nuVMXMsAIWG7Q3Cg09AW70AyTjk3DR72lGbQQ12CiUYxsparo1nlSj
	 ohPvae0YCxQ1wpkXWSEFRgxBc3lhpEW54Uo63i38cob323GRQVubddKrtuczuNi8/2
	 DNgYtOumraCZA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BBDD71AC57F0; Mon, 09 Feb 2026 16:52:22 +0000 (GMT)
Date: Mon, 9 Feb 2026 16:52:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 9
Message-ID: <aYoQxsbVV-4ELZOJ@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ap6DzkSVeU338t5B"
Content-Disposition: inline


--Ap6DzkSVeU338t5B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260205:

The drm tree acquired multiple conflicts with the origin tree.

The fbdev tree acquired a build failure, I used the version from
20260205 instead.

The iommu tree acquired a conflict with the pci tree.

The mailbox lost it's build failure.

The ftrace tree acquired a conflict with the mm-nonmm-stable tree.

Non-merge commits (relative to Linus' tree): 11263
 10808 files changed, 621615 insertions(+), 234618 deletions(-)

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

--Ap6DzkSVeU338t5B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKEMUACgkQJNaLcl1U
h9A7rAf/RxgDCfhHuK07Z1B8EOpTH52/WGWS8RZ4J55zpEfJ96JggMx9452zlMgs
WNrvx7f3xwN9wMy498PasAnkB5NhR0J5a8A+5Wh3gZhCD3AbfFPeuylGIRXGWW6t
5b1rktL9EfYsBlltVbmsM2VG3xD9EpZef2wIfHqVYQb3WqM08CKTZBBZNBcd1tLJ
VRBD5RvzePAr9sonIl6nScWdbjfStGou7Js2NIIENlHWFRSOQQh3z38IuE4KxgCi
uR3BI+lShvB5XU+wH92oREuksDvw0I9HE2o8EGwVwBXD/k8xCAg9/2tth3yFPRpI
kyAv3x4MMk2sEaZWnRw8knvLkvgZxw==
=Fzba
-----END PGP SIGNATURE-----

--Ap6DzkSVeU338t5B--
