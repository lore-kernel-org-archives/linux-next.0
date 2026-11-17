Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959183;
	b=bKyYy9l5+EHnY1gmvRD7fgTDv8lXM227UcmsgtJAg7GZiEq5ENfXszmJ9qhDQJWIavaA
	 2auxRtxpersxK/mqKbLn9xTJY33YdEKBMKOHzgN0LcO4hmOoijY/VAlJ5O6R9YyFGV3tT
	 8lSW114OKds7vrzir20Xr3psFztdHx120gv9dutsSCkShWrK/YFn+dlCt1U05CPbjHjDx
	 9SskO2h70Xiq+67mGVqtv6UJRUcHSgn1eHkuTTm3lJxA/ro802OkJMcUxuOCS2+SnhxAA
	 78HNcrWzSq1eGoWG64yNG8+ziOrm5PkuPuAcjM35SHjYZ7mqWWtrnpxPvAPK03W5MkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=1on2HmPE7BPmM3SJfRQgKYqdlw18X4/r5fVaJpdOL7g=;
	b=CyonWZCnKrqda4Pj+aHnOAOSv0vqypJ6vgd8togBPI3yn14BzE2xpBiuXSYDPmNyf96i
	 37RRx3t11Z7Yk7+6Pwie7ZZg8PY6BxZwESNMHdwcqZfFtx9X8xP0bOhY65h5OEEOdoM/n
	 Wv4kFcQJKuzkbgXewEmY9fIqdE+mDMs7BQSwLOIfPNCkWA+W5EP2PQuz2w210DjJPGnvC
	 nhNCWTCpUz6oH1A/2OqXoQFl0+XNe9eDKzv+4D04cemCtdJ5Hgilmpx+mEUVjcysmSXNI
	 u2PoGMTGM0YCMHOOM0QT+SyVTrVTSS82dA9Mlq2pBqzKTKYW0QhDmxxiD9Prhqd9nkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B3BAvo/9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B675606A32F;
	Tue, 17 Nov 2026 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3BAvo/9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00351F000C4;
	Tue, 17 Nov 2026 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959182;
	bh=1on2HmPE7BPmM3SJfRQgKYqdlw18X4/r5fVaJpdOL7g=;
	h=Date:From:To:Cc:Subject;
	b=B3BAvo/98WMksaUT/wJt/bqw7J6tNAez5W4VxHebjo1kz9N8LeOn0x0DCAStuqGfC
	 o0dLi+Kko69GDNzRhUD/2YOR04kdfqUbXEVJb/54RoR99JooPQqMqGuTT9p5RsXXKU
	 hyn5iwKzhr8dXolct/c07pvN8UqeOyWuAPPAUk1Fhd0wRxdVf8/PrSQFNjTji1NX7H
	 Y7F2aHlwJYdmuhkAC8R0zGPXmlrLH6AKHN+E64YYf2oBVyM8TBMgnpiWtauFsFW30M
	 ImDeWTurciAM5z62lDPI/jQl7nf1cyV06HikyDhbF8vKM3l1wHe1JA3ap1n38oJL+k
	 qs/C91EdtIycw==
Date: Tue, 17 Nov 2026 23:46:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 17
Message-ID: <avznS8QYfxJ4uRN-@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ERyDawtLxbRCd1XO"
Content-Disposition: inline


--ERyDawtLxbRCd1XO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261116:

The hexagon and blum trees were added.

The gfs2 tree acquired a conflict with the origin tree.

The xfs tree acquired a conflict with the origin tree.

The vfs-brauner tree acquired a conflict with the origin tree.

The vfs-brauner tree acquired a conflict with the exfat tree.

The mm-fixes tree acquired a conflict with the origin tree.

The drm-misc tree acquired a conflict with the origin tree.

The vfs-brauner tree acquired a conflict with the mm-nonmm-unstable tree.

The bpf-next tree acquired multiple conflicts with the bpf tree.

The battery tree lost it's build failure.

The paulmck tree acquired a conflict with the rcu tree.

The scsi-mkp tree acquired a conflict with the vfs-brauner tree.

The pagemap-headers tree acquired a conflict with the vfs-brauner tree.

Non-merge commits (relative to Linus' tree): 7474


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

I am currently merging 438 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--ERyDawtLxbRCd1XO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr850oACgkQJNaLcl1U
h9CwcAf+PyQQVJWUs+lY9/1BjLzaU2k72FG7T37iJXwKJGrKjJBJgVC1l6tXz587
zO1R/kwvCMW4yTAlWT2bMLY2Cjz1dF/sqBgqgonMbBDzbUilDndsB5h9XKLf1Buk
MNpHDEm1MGff8UNIlpwkPNXLlNF9Q6uNnNqWMClaYInFgBF4dakJ7UsN1WteTugb
AdLothLzDJNR9/FZBpXGIcJrTMhZfZf3ZzSbhh9KkPh9leqSofBrTNUBw/nkzksk
3+z+5T+zqJzUl46W/42JHhJdge/DRkssE1fiSSaXoZ1e0rAh4TgMXLA9Rm5e1aXD
RZiY7kF9GaZcecuNQm4al3+iXR4rRQ==
=Ew57
-----END PGP SIGNATURE-----

--ERyDawtLxbRCd1XO--
