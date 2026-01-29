Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751E34165E;
	Thu, 29 Jan 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704963; cv=none; b=cJ83o2fip3QSorqkdJEd5IMu+nopLLc907w+yqOesJU0MEIvF+GiOd8YjIXFwkWqJqnjr4CJogQnWVeh2/Y5hZP+BNCKdr7e6tjgBb2WtIv7dbW1tQm0InDAs8sIjP0CGmLYCmJqjR2xeYeTF+6W3IpZWp6u4m3PzvbPInHmuqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704963; c=relaxed/simple;
	bh=/TSbtTcQnYueO6Zpl2jJDFXIqLnozHZcE35mUhnpVgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZ+mrsv/GmR2Vnzy44ad91z28z2Xcb/O6zoej82h/KEYzwATv4wi1oVJ8EzBWkdVCbN5W4wA26vH9rXui0qiBTyQgc/ebPAg/HSztNHBsWLqxaBjhuBGF0ZZzU0fsewBcAWYpU2Ni20+YExXR9ZN0LEgG/huTcfqx468m62RdsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYzQIiza; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYzQIiza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EA8C116D0;
	Thu, 29 Jan 2026 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704963;
	bh=/TSbtTcQnYueO6Zpl2jJDFXIqLnozHZcE35mUhnpVgg=;
	h=Date:From:To:Cc:Subject:From;
	b=VYzQIizaIVMR3Qe8TY+ijhpG5W9YVQ1cHWIB3J2VqPX1939gVgURCP9jTMZW+Rgmh
	 z5zucLNc2v+Y1KP6k9HgAXtmywmEqbSIz+2ZqbdLLTc+buXXbVKIeptgjZ6dAUeMQh
	 oXu5d6ED4kdMT9qeElOhco43xlM4J8cJV1xtv/+fN3abdAEce8xZbjBGCI3sHY3F3n
	 Bw+Z+WgU6gPZsNJ6tlSAktBWit4cCV2nMnhvJ1T9w5Fu3Ww2lNELjrOuJcCuCe1IPD
	 dKnkIx2Z+GT8d79SZ4j4/MqZIyyjru2hxiweI+7Gl2l0CJrspk4fJRA9qKlhY2i6gy
	 cU9b4ry5ok9kA==
Date: Thu, 29 Jan 2026 16:42:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 29
Message-ID: <aXuOAPLkDJ9XBCei@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hn754lJV8NMkGIvj"
Content-Disposition: inline


--Hn754lJV8NMkGIvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260128:

The btrfs-fixes tree gained a build failure, I used the version from
20260128 instead.

The mm-stable tree acquired a conflict with the dma-mapping-fixes tree.

The arm64 tree acquired a conflict with the arm-soc-fixes tree.

The kvm-x86 tree acquired a conflict with the kvm-riscv tree.

Non-merge commits (relative to Linus' tree): 9771
 9536 files changed, 550931 insertions(+), 204812 deletions(-)

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

--Hn754lJV8NMkGIvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7jf8ACgkQJNaLcl1U
h9BLIwf/fQna/ciszsHnN1pb6GrL0Tw4hJyNWzXyPKnkVb1+jVKtHqEedLEdKJfz
9DEPTc2/PFpBGFLbZmWTOQFWh7q9Pn772xH0s/SlMj0o1mELHG38QUN93E6zL88D
g9ZcMKEPAbpwoDG4KUntfcY/W3KXA6WjaA+FhiAERAfk88yOhlrXfCGfvdHbboXq
+31MmPMiH71+UkjXxyUzWGnMH7b4YwWC+DjMtBszAUJwyIb1T8WS6AUKHyg80+5M
I0BtIuL7RMOuCZ/OWKj84fiYTHuT6LczPar13zdkwxxQWk/l6hZT2Fi+cHwomKnA
xgWM+zECbkAC3Wfy6iJrXsG7T1OULg==
=woo1
-----END PGP SIGNATURE-----

--Hn754lJV8NMkGIvj--
