Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F13EFD34;
	Mon, 15 Jun 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528418; cv=none; b=nas9MKwPED1WjTi4nHJZ9wD4yADdkxchxp1ZUfyoZujXzkhh3yi6IOChOAAWpwz3vGYEAiNDvZwIV7Xl2/Wa9YrYP43FKGYC25TAQwiUliyGZ2wjlQfr/nf6fgt29vstmKqFCLoCdXjx/MHJexlPtVbGNIiIWd+Go+KHSXQbrWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528418; c=relaxed/simple;
	bh=n8396GpASOd4o49um3YkOh2FjI5RXtyhfM0bZBMLH0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtARXDdv6kmHsjGtPvAv+V4/PWvF4e9xU/BV5nMEndTDjnoh4TpSOvCtmvkJAtdXKnLUZMFLCnm8AryiQYb5NnF8FoKOqeiR03ZiFxkih8Li4+Wx1M50yfRqTQe9ek3TDmtM6Kz0Lwys58ImtdiCZF7MXBtmWwBKuze4LHGZUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xod9SckR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xod9SckR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34401F000E9;
	Mon, 15 Jun 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528417;
	bh=wauqR9ZTu/i0jmZhKKQdVMIHVWyPoTGwxphBRw35gGU=;
	h=Date:From:To:Cc:Subject;
	b=Xod9SckRVV+KtePK6y6kGxa9t+MSTPXlVObb0STK2ORXIaTl3vijjxuMhxUeferP3
	 Q1cSsXytKp3vnzZ3QPzIFsz2Uyo0yBlG4wbSnU3jgqc/nyNGPm9VGr05JnJQ5AXstP
	 VGHwTqI5pzLv788JMN7pIrn7tihhZXx4Gvp0Y6z9KR5M2ZfxdCZGU1/HEBFlt5wi/2
	 urt+rdUOh3rtcWY598y3JYLqGDahBFI5GfL8Rx/S1XlCIKlxenHDU/Xq8erct2Qp3g
	 9hKH5BLnsLWlC5vkrIZ0sSR8qBroMv8ZowwZkT74PwnDtTXzLvRKplIitY/IvVlUUW
	 zGoKAT76mXEpg==
Date: Mon, 15 Jun 2026 14:00:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: linux-next: manual merge of the sparc tree with the
 mm-nonmm-unstable tree
Message-ID: <ai_3Xf5aR0936CyG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KOmf+Lt+U5Q26TpH"
Content-Disposition: inline


--KOmf+Lt+U5Q26TpH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sparc tree got a conflict in:

  arch/sparc/include/asm/asm-prototypes.h

between commit:

  4fc4802c9d563 ("sparc: add _mcount() prototype")

=66rom the mm-nonmm-unstable tree and commits:

  1919c0e50000e ("sparc: add _mcount() prototype")
  2416b30ec23fd ("sparc: Export mcount for Clang-built modules")

=66rom the sparc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/sparc/include/asm/asm-prototypes.h
index 270c51017212a,a39a24c53216b..0000000000000
--- a/arch/sparc/include/asm/asm-prototypes.h
+++ b/arch/sparc/include/asm/asm-prototypes.h
@@@ -26,6 -26,7 +26,7 @@@ void *memset(void *s, int c, size_t n)
  typedef int TItype __attribute__((mode(TI)));
  TItype __multi3(TItype a, TItype b);
  void _mcount(void);
+ void mcount(void);
 =20
  s64 __ashldi3(s64, int);
  s64 __lshrdi3(s64, int);

--KOmf+Lt+U5Q26TpH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmov91wACgkQJNaLcl1U
h9BTPQf/eqLIvkm6f8LmuM22MnZcQOvH3HlnYgiJY1GAVJEsnltwm5gj3BiRtKW3
AVsP8IauI7Pzvoyfg+GrYVWdOWtrFoHbtduqVRA71gtZdToFyiPe69m2wetMp6Ol
jI/IRh5pA0VpjigGiz05cLttunmbkWiXpuFkFUhI78x+SgYCpPgZuuP19gAFYzg3
qPkp0vljeaI0B+ABBglA+OaJdbUz+ysrnRtDZXly7XR1xLRsk4Lv3mlqFgNmMAzg
noZR3zschXb9ab18JP31edWTlLBXVnUPTC0jP/0WfuffDVlJkXFvLwp8unZC8rKV
GJIxndDMBtEvhqSOvirtLIgo8UDIbg==
=qCMr
-----END PGP SIGNATURE-----

--KOmf+Lt+U5Q26TpH--
