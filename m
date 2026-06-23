Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B203D5244;
	Tue, 23 Jun 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218649; cv=none; b=r6AbrZRtvAKqr3z4rYlPPVH4tPKAyowAos3WWC9Lxav1pFSwZo4EVU9pDsJAd8doTsktY+8h2ii5u6YzGeGE/bbvKnVc1u+HEODRK7Kh5UEyvvp8BpTTpHJcnXLAz26BrEL6nulBSR4eN/mtJkDOVyWE1g0fH3miCYN3Q5eTD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218649; c=relaxed/simple;
	bh=mLWTkFw2ZrlJpPE5xuOl/l/K+ebIXrh0n2Dhq36ZmWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqMbMt1gZGnDw/SQYuRKVbWvuBwCdXp0KnJbWgdKJeOwyY3NpoZytA2Rw5tIAE+TkTCSjSvQ57lBzNRyBmuN/KSC8eGlIdwbr8v1oxY/AAJdu/GA4J3l7gnghKl924VT14zZW8I9PHyQfpWp2Hheg9VPhf+GLvLadbUXLe2U840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJR1LAef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJR1LAef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4471F00A3A;
	Tue, 23 Jun 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782218647;
	bh=vSQvpiWhxKW9YHX6wz1S8q13XdmO99URDUdHwDidZ84=;
	h=Date:From:To:Cc:Subject;
	b=WJR1LAefSAeMp2DU3/MNtS83jgPzw97MhhXvlRGwn/Qt2DmzefKymjM80isYKliAO
	 ROKbGtwMPTMMVE76BRe6OwqfpT9MbE6H3tSmN1nEuOX1mOyRRrzG2Y7FD3LaPqt0xY
	 F02KQwHTfpHQ6Wh+SbV//vbiyFqAqWqs/1vkBFEXb+kO0TKDF98h9XB76tYIdkFt+w
	 hqifd44tlzg0G9PdZfofqwOMVDBhy53Ij+OV6f1A4obJhx1uQflFHkdcvcGExTbP2N
	 mrbbXV8jkXHJerkqQl4Ma4EzTDlkaViPfy9o3M6BJ24T4qyD2kYD3ttyl1so9FGQzS
	 B3D6pFe/a3HZg==
Date: Tue, 23 Jun 2026 13:44:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 23
Message-ID: <ajp_lCkH2_xBSVHz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcDlMtmz53Q+Edki"
Content-Disposition: inline


--ZcDlMtmz53Q+Edki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260622:

The device-id tree was added.

Non-merge commits (relative to Linus' tree): 2343
 2167 files changed, 117241 insertions(+), 38315 deletions(-)

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

I am currently merging 426 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--ZcDlMtmz53Q+Edki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo6f5QACgkQJNaLcl1U
h9AGiQf+KyiEe8CJtd/rx3Rw+fVL9F0ODiyw3/BTpjHGtMkZspGnV2GWmdMxJcFM
3JEuKSgaecpUpxj4MPLeIftQm5yh6Qiv5qUPbA3XSjh2h1PGA6VOwZpzGJN8pf28
xzt94nvguxOF1JYmVyP26DEm9chunWXyLLQmJ9Xm2GwB3A3gy6XCTERL4Lp+v2ES
3TftTp57MW4ci8PyRVJOz93OgzjcQTx30wyPiD/QFa2T3O5NMnJBQw2r1yrmhVn2
YWyQZDV5jc7M3C0K4gR1TBInSZ2DVcEIEYANtBp8e7ZRu2Quz+0e8DP/yVWfXXSc
gtM+FowegjQrJVt9XdvNZ7rlksvXzA==
=dXAw
-----END PGP SIGNATURE-----

--ZcDlMtmz53Q+Edki--
