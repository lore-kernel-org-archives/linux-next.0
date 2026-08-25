Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E08481AB6;
	Tue, 25 Aug 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665499; cv=none; b=kYgzpU0Jf7H19gbRsxnaoBbKa+rUjqOytX7kmP3/GHtbOw+WGOosR95lg/VWAA/SEThh9KNpciCLdONVGdqdU2FtI5PYODsZ7IF/B3IasMzIamBqfkRScLp0VXqC1Nci/frI0jT2CG5vHESRE96BxmjrqksN7zg3OkLGHJBO0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665499; c=relaxed/simple;
	bh=Q9/KHCO8tMGxT+nzbb/AGVwGzpKuNbI+B/AuR4xsg0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbMrdEzuvnx3v840PeKLyIxE0EgxL1MWGmXSBqTcA0tX3ucerqnVlxd/c9R1Hu6QLZC6EqDo85lpC32IpzhdTeVYfsvM8drYJrLSXRjJHtvV4aERJRI2TraDbEiRmv6fqc5t4IyNu8r/+KAQjtj1Mx0vT7KK97dMREdVuJZDYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsrigULk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsrigULk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E86E1F00AC4;
	Tue, 25 Aug 2026 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787665498;
	bh=LMR1Cbr+jzN7IC6vb/aEKzb39G9KRAo3vB4pibw3X10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RsrigULkeWvs9A565yfa4vmuU5+oHxz04PMDbTIqguyQYrWj8kR81jUKqoa4BUqyu
	 zIaA0i42vGnVgGiEfZ7CTuMHVHRhxKikXnr0w+wXuwugPj0G8HPeF+8zmItn5687mB
	 ZoB0Wh7wmZ3yuyCOQIw9PLVjBXTW67ORCyvoa5Y4kGBJk+46g5D61GG7SffeUswxK7
	 nNDiwqxXJBkANHqsIwinuJK8M/K2x+UtCJWGEO/gCKBCwvotiTzop46CvomYaqwK1O
	 kMsTbaB/REiOQW0RF38tsRLSi+vJpbUuDSFE5QAv/xDF5BUMxUhTG/usLGnjVQkk3i
	 u0lKxB5UTFYcw==
Date: Tue, 25 Aug 2026 14:44:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Please include pagemap header cleanup in -next
Message-ID: <29f8f296-e49c-4960-aadb-f27d863ba773@sirena.org.uk>
References: <aox4v6paR4IbJr8j@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJ+THQADZ+9ogSvK"
Content-Disposition: inline
In-Reply-To: <aox4v6paR4IbJr8j@casper.infradead.org>
X-Cookie: Exact change only.


--VJ+THQADZ+9ogSvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 06:00:47PM +0100, Matthew Wilcox wrote:
> Hi Mark,
>=20
> As discussed on IRC, please include
>=20
> git://git.infradead.org/users/willy/pagecache.git headers
>=20
> The net effect is to reduce the number of files depending on pagemap.h
> from ~9100 to ~1400 on an x86 allmodconfig build.  The Intel test robot
> has been steadily building random configs on random architectures and
> finding new missing includes, so there may be some build breakages that
> it hasn't tested.
>=20
> My plan is to send this to Linus on Thursday or Friday.  I don't see the
> point in letting it soak longer; any problems it causes are build
> problems.

As I noted in the regular build error mail it hit a build fail on an arm
multi_v7_defconfig so I didn't merge this today.  It's pretty surprising
that the build bot didn't hit that one TBH since the file that broke
hasn't changed since v7.2 AFAICT, I would guess that there's some other
implicit include cleanup work that's interacting badly with this effort
but I haven't investigated at all.

BTW I added the -next list, please CC requests for -next there for
visibility.

--VJ+THQADZ+9ogSvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNnFYACgkQJNaLcl1U
h9BKkwf/QiL4RAh3DuJTSxFuU8OPDiuEoifdXJlV15Ooun09i4eKmUKj4PlaN4tY
VondBTfBQ/NJYm/C0uo2I5y0uwo8LZ5ZDdEMXZ5t9IYcBUXsYcVtqLpfu2f3LaTr
hEW39Eb+t6L+neCxjBf8dxLt3YCRBXowuX1vwcYqCPfH72MLxSAc8W/8n+8af9aF
27Gxyy2ItoDLGs2OIYC6h+fGSACMMfV+Cvr+WwlWu52b0B6W/0wmuklmY856kena
zDvhklJONLCedKokabSfrca8M4HxygWKX6kyaGu3AI7kNq1Wfaw3BIxLmx3/upBH
V8s+fewQ3sFN9Sfv2+t92CxTuK113g==
=ZYV8
-----END PGP SIGNATURE-----

--VJ+THQADZ+9ogSvK--
