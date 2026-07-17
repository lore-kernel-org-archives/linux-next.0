Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD03FFAD5;
	Fri, 17 Jul 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295041; cv=none; b=CUudswr15YEmGCRb3Se1pNlDkNIQCWkJwEUXMRp6SYSMssRogiWqge3nrAGR66qemKwP+B6eFHE/ld9CtnbLQE/h/knCMqA+90X6yXP0eRSlnDs7yG7uPmv3LcrrW2SIAwuGjyz1His/sF6MgzH+0hj+oz8KL/iB8e5AUcvGHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295041; c=relaxed/simple;
	bh=3LAbIa3xlcRdmKf3MOQvaR7DvYvsf7r7nqF48Hy9hKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n53uJuTO8xfSVhVvegWYOIEIJu+a4+G9Wv7ftMV7TfFh0xFCIm2Jc4DKytv2tqifnWI1vEqIkGL8vOqEIYNG8QlGKen5ow0sn1Hz/byhg6HYOo6SyLRfy/0CM7xhF2e1Iu7AgKBuR4RMCWT4htcwgr954wLJ9b9OtaiVfa+Rkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErTklTbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErTklTbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C611F000E9;
	Fri, 17 Jul 2026 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295038;
	bh=sbScsv3HatQygLvAZdRCGrKVfWUPrlut7hs5yhmp9I0=;
	h=Date:From:To:Cc:Subject;
	b=ErTklTbQ78KnFnnLTFG6aTIrgDPExbwpe45YpXDBdK44O4MwRidKrF4oPuJhIUE/C
	 H8iYw0CZm3uPjnQKfjlAUcpBJWhKsG10TVhG9EuoFhgb+QpJnHr7BRgzTOZhgDHpMY
	 VFbqzVjx5OB0QNA/Vl/8K6SvRQY7x6cxWYeVLScb5tsSx/1b9xWHwltGP3V+0Veelj
	 Dw/JTTLTZuTZ4kG0ki5rNefOlrooVWrlONZE9Jb/z2khmwIWyIYUIkH2rBt4o/gsOF
	 rPXnQn0Z/2SFWiDvmPkUtHIX/vMo2eY905g3e28yUn6SU0Ge3eJ2YY8FwQz0vW4S9L
	 +TEi7TRkiVnZg==
Date: Fri, 17 Jul 2026 14:30:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 16
Message-ID: <aloue6ihv29fS4lo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RKi/DjPlF/270v/M"
Content-Disposition: inline


--RKi/DjPlF/270v/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260715:

None.

Non-merge commits (relative to Linus' tree): 6313
 6142 files changed, 255877 insertions(+), 101466 deletions(-)

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

--RKi/DjPlF/270v/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLnoACgkQJNaLcl1U
h9AQMAf/bPXuH9ulmhWBQP9gMFWUzcSblCMlZdlF8TyNdAkrXbZZJ23UOjmDxU86
+aNXem1lqc+6hG3ifd6yA8QMEDuAB18ywkYtlENWYXv/1UYH/ZwwuNRb7SotAQnj
HMBFF6WifsSRszsh7QDqnCAOthguTTuf+0UpNy5bocLvsQojcuU0XfQsh9BUAV5A
b7T8N+VXVJKrmcq3FAmsPo/m+zxkWGKN56fG9KsGOMEUepjh2LcOZH9ufxKH7pZJ
4I8KyiNBrhhlIAah4/OOdoYz1Fc+ILO2aG3EpyzO/lU0UKh71aAIsXa6QD1JpOkl
WDy9fu7HBQciobttU6OMDUQCvKUTtA==
=XVsR
-----END PGP SIGNATURE-----

--RKi/DjPlF/270v/M--
