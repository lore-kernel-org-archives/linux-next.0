Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178350;
	b=36+HXAO70IJKjZBoWKTvdq9KrqECVbhHYLl9Ow+8lBZ+IntquTlBDWtLIYncxWFCItO5
	 L5ps9ohY6yKrSt1kliQnPAvmxTC0MUkvCtpJJt9TsDqyTpaH+0Kl1Av1DpYXGUu1Ehsm2
	 yByIGDWSePFTIS9TiFVja0Kute7gjbZI8cdrEJYkwT8VhEnglQEwK9xMKVrhcg7r+De5B
	 pNTHBVaphnE4QRc5qdWyE7xr/BSmZfX01+PxraFeKUT0kOYMO6j682dC736zxpoQkC2oS
	 Lg/MYXXxUhoEOvNeA9v8L9HloGFGrs6m/4j2/JPsJuhBzprEVyogrijYFxhlriErWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178350;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=bIpsHPc4LjJE2ZCP99bNG7MIo2XifzW5jcbsjZPKpLc=;
	b=N/gn9rGzZGFxRzASAUMwcyM5kyn9AIcl1v0MiTdFsTnTmV4/WgFiuCLQP5BHZleTTx+J
	 y/LrtcdC+cC/OhlO299wI4FZOjZ3/owZUSDkjYsPwxq517vaZVzUgf0CtxMkcP4+fmbjC
	 dzsJjp1M3vFemg+1vxOsLJnBALoXx2m/8p0EOUBhqIdy/l1wl19ryHd9aM6P/ysiCslCJ
	 58w5CxVgCV8FEVxUF5PHE9IM9yLx0s1nDZo98bqNEH9cZ+pZZT9N7WRGj3AohQON+GJhY
	 FjNxGmdNhhdmK+mzas8vmU4+R+EA5QLATsc/4QPIuxrVHxwPrfdxm2RNFOSXqdPxqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apm7q9UN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D760A2600;
	Fri, 20 Nov 2026 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apm7q9UN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060EC1F000C4;
	Fri, 20 Nov 2026 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178349;
	bh=bIpsHPc4LjJE2ZCP99bNG7MIo2XifzW5jcbsjZPKpLc=;
	h=Date:From:To:Cc:Subject;
	b=Apm7q9UNbnOEAlqGm9QcrZmIJpRUkQ5fcpHEPZvCkcqS7+vlcHDv93Locy6d1eZYN
	 nBWRPRX5D7UW0CU9qwXb0mVbvTZFn7f1NILH3tsloJgMiIk65uTjGUg4qtAfgcG141
	 e8ce7OqJUkXigkcnBJv8zuGrhWzqRw7EOjuzrdPj9+a3czNOYefWEkc5F5IL9PMT9b
	 AwTjg9NLhmGlBQbIjpLena9tjPTq31kAgk6Bz3BprABLdrIkWmsmI4B4kNWocf6VG7
	 /3L3GJGn+Mj9R7BZyrAvfRSAGMWIQ6SdOIJNwac0DnoOJKiCrNQV5+Yo4beJz5R4uj
	 bXTKEGHjlEiYQ==
Date: Fri, 20 Nov 2026 12:39:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fuse tree
Message-ID: <awA_aiwBB5gD_eX2@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="3TzXCcrjZ0ZMdvUO"
Content-Disposition: inline


--3TzXCcrjZ0ZMdvUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  04429e79c4a95 ("fuse: fix UBSAN warning in fuse_iomap_writeback_range()")

is missing a Signed-off-by from its committer

--3TzXCcrjZ0ZMdvUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAP2kACgkQJNaLcl1U
h9DTPgf/WIdVDSgnyknm5HNzj1RBAbZQ/GCb+J04J/r5T2WdSR0lsZuaLcDkvBXS
J8kwB+JggO27uyMevl1k5y1EJKjo/AMcW28LMZS0aWXPAB8Gey/DqzRdArtn4/b2
lI6ghWhGlwBxltFGinbgKMSSWl7lwMApY0kxM144YLicyTDxoKjLonRJOnznCrAk
3FA7fnWBm8KYfUgOXgFgF+YzsF9mpV/28rHsjTAjowCqtu4FeIHVQ51UyC62rQfC
i6u3IVKc2G8ni48r5SiLV0kA6fhfqVAYI5t7oClO+g9s4Sd7lREptx1Z0Uey3tMa
hOp+GBjvz4o59fgxdNWg1mIFbCDhHQ==
=iKZJ
-----END PGP SIGNATURE-----

--3TzXCcrjZ0ZMdvUO--
