Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4BA3803EF;
	Mon, 25 May 2026 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714528; cv=none; b=goJxgIj4i/Zx85u/K9Jfn7c+DcPmVejxf0Ka0leOBfFAvhR86n3MR0mQY1yCA4XcaO0cUVGYdfRO5iAdxqMjjizq7otj4DtrBtm+v/lchh+unLXdG5J/z4irHyBYr054D/aNKcKUcGJC578Dk+tu86/+EeEca4gDytAgGax/X4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714528; c=relaxed/simple;
	bh=JCUsq2HysQ9nA0bL4vsjBuspPoCnujB45l8RLpJzDTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVVbLgjd+tQP8bZHAowY3RfC3VR3V71xNFsY0J7PA65nq+Zhy6YJr/oHnITGbcGx2zuvnhxvFPS2aQolHTMR9ZmJgpBfI2tPLlSCKJCnuNVD+662yxcF4E5bb/ciuYB4M8MccsNMaJYfd1OcUrecWVNFKJQSGrLyBwRLxDWj8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYcf+Q8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYcf+Q8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896131F00A3A;
	Mon, 25 May 2026 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714527;
	bh=dPvd/yqXkO4Lzo0DxcCEfYs5NO1MBfxJ33QOU30wB1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kYcf+Q8Dxl8PLfVQTMMLLDGBbBsniC/2pgol0ngzJ3nVRLbDQTACwCm0I60siur+c
	 PX9G3Tgn5oO+4Bt6g40rUZDVxb6x5r9QKs4GyIKnZkMICbULvk0w4NeXx6bjbb2jK2
	 r9ee3Evmk/VXSNyNQiHY/uy/N7+NoBUqPtVPeezMO54EGkmKw7Joz0KSo1c3xq4Gnz
	 j4ILjrZdMJ3UUmOo8vE0tLpTxU7rMU/lgOqBVwHSQm75gFZKydFQ/W30lY8ymdWL9k
	 qkIo77ZZ0wPGjrOoFU8cbpr1wR3sNx4LeFcaaheeqgaGC79itOoBnGFVHoacwwDtUt
	 qeoT4ke/L49pA==
Date: Mon, 25 May 2026 14:08:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Message-ID: <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>
References: <ahRHShZFjI8AsT8G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5fYpI2g8Ff3OKbv"
Content-Disposition: inline
In-Reply-To: <ahRHShZFjI8AsT8G@sirena.org.uk>
X-Cookie: Prevent forest fires.


--g5fYpI2g8Ff3OKbv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 25, 2026 at 01:57:46PM +0100, Mark Brown wrote:

> After merging the nfsd tree, today's linux-next build (arm64 allnoconfig)
> failed like this:

> ld: Unexpected GOT/PLT entries detected!
> ld: Unexpected run-time procedure linkages detected!

> I didn't figure out exactly which commit did this but I'm guessing it's
> one of these from the vfs-brauner tree that you've pulled in:

>   1cd9d2387c05a (simple_xattr: change interface to pass struct simple_xattrs **)
>   12e9e3cd03b5a (simpe_xattr: use per-sb cache)

> I have used the version from next-20260522 instead.

Unsurprisingly the vfs-brauner tree also acquired the same build failure
so I also held it back at next-20260522.

--g5fYpI2g8Ff3OKbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUSdsACgkQJNaLcl1U
h9BSNQf/ciFw/tvpktEk7/Al0O8/3w13F9DmZPl7R+PUQjDCteecjupzMIA32wwd
8FEXmPL3jQmac0JPLy3dgB2ZgppeYjgl0iwgtfjh/ciV6DTJBEiGbUOUUgPhayoN
NTVsKd8LMiTlWXwEa/ZcpSpfNrCSvVaIrRAo416a4RuwH3Y1EfGFeaEevfS5CjVv
UJh+Kt6YvQ6hDtHHEwRUSLzUvzp6UYM6lMds7+nTdvPyshaicD2MK0GeQDjq+aGu
r0inSIRsh9xJgBI0QpCnPAh8LFhuGzJLFuH/SaPWXCC0B3AZw1ZRuydBSeX3p3K0
lMVKpkLJ9s70WBk4zFxvToY97Os5Vg==
=6U+/
-----END PGP SIGNATURE-----

--g5fYpI2g8Ff3OKbv--
