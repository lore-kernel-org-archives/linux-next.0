Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35B57C9F
	for <linux-next@vger.kernel.org>; Fri, 28 Aug 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924993; cv=none; b=Ay76pD8ubbxYJuodpG5icIRmSiJoTgERdwj0PPnSXANnx2IbBjN5GgDZvRd58FMm4b0+sRE5lNSqllZwXByxYw9DhPE+6gjJV+hS37ChYjQK/xNoRFBXnX+hKfB9kcp/r8TMZfGPn97ZUvaKBeS6JnCYPF2SU/RwXAVWp87txSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924993; c=relaxed/simple;
	bh=qbQ4zkuSno5ipajCXWHlIPLs33nr7MpNQ+FaGqh4dR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWkI2f1kr0xJ/i2eMAa8XNMJLNCyrspmovxYHvx5djCy/jKlj+NVKNl+J5b9f6tlzx6FrPW9xpfEuc+3DWz6osdKZ7f8yPStC6Zbc0I2D/uXbT0RqfCYC5AmcDVgkIs0T45u21/xtlIcjXOjLDkwKDUATNvWSx8ZDA+zxdjb8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93B31F000E9;
	Fri, 28 Aug 2026 13:49:50 +0000 (UTC)
Date: Fri, 28 Aug 2026 14:49:48 +0100
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-next@vger.kernel.org, thierry.reding@kernel.org
Subject: Re: linux-next: add configfs-next tree in the merge
Message-ID: <5efe46d4-2e30-494d-abce-b58708d7c6dd@sirena.org.uk>
References: <apFFi-I3gJWvxeHk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="muA0DshO7HtKTntZ"
Content-Disposition: inline
In-Reply-To: <apFFi-I3gJWvxeHk@gmail.com>
X-Cookie: Subject to change without notice.


--muA0DshO7HtKTntZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2026 at 01:27:41AM -0700, Breno Leitao wrote:

> I've recently become the maintainer for configfs, and now have my own
> tree, which I would like to see included in linux-next.

> The MAINTAINERS file already has it:

> 	T:      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git configfs-next

> Is this enough, or do I need to take any additional steps to get this
> tree merged into linux-next?

Other than telling me (which you just did!) that's everything, I didn't
see this mail until the merge was in progress today so today's -next
still has Andreas' tree in it.  I've now updated the configuration so
your tree will be there from Monday.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--muA0DshO7HtKTntZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRkfsACgkQJNaLcl1U
h9A71gf9FaGzgArg+mNSEddmsQzd0s5YV6Ixy+xZHPGQAFhlQ6Rp4LPguTy04WwZ
vNxeUOM7C8QvRnmSCsa2MAdBYOnoc2hAhQhhcqZNm/9b3Pf9WimkG/JrJhhWlQFU
8QhIOf19V2/13bOyA3dmPnzdZUgmQIrnvqPa+tnMa7bqpr/X6Th5/xdDkkBEfw1l
tgj8E2hQQKC3EBtdkZ2dKXImIg6ZFB6E56W/hQMg8KMxj5mjmeTnguBJt66Fs4yW
H+NHMEMYEiavMd53E6VN3BFd61yYE61LcEy4L5Po2twKtFC5JcI2sTNUG7eXxdwI
PQaXY99DH1WO+OXI0UfY6PBnYkPEZg==
=8s5g
-----END PGP SIGNATURE-----

--muA0DshO7HtKTntZ--
