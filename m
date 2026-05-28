Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641A2E7392;
	Thu, 28 May 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980491; cv=none; b=g77SGH0Ga3Lbm+OpXgG9dUDknmW8cDl4XRHrjTDIhRLV0WG6RWiFI40Wc0vEB9IBFkuJk1zQj8Q9dRR4oCZV4QPz/fnVaAV7y751973oxq3fO4No5BbqAg6U/vbNSP/txUqJ5OUc3jINBH/yI/9g10OfT0z7lZWC1ufrFpEjLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980491; c=relaxed/simple;
	bh=b3XI1k2gxS6Z4TpLdkmd2rqIU0HqEhbaFxWr6SjbU1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBklLH1jCifYqpqzSSo1tVEuFpY0BH36QPOs/wqH/QZ6WyB44qO83g0IYhAhaB56cM79RyXOjfEGAkFEy2w377233nFYOCwdpG68QdjezsR5cHxC69hbmXIrkmyS0TB9KmfODI/5z/5Fy48puLETAVWwM2w0VyNDc9J3s0cV82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBEBrYTr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBEBrYTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB921F00A3A;
	Thu, 28 May 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779980486;
	bh=x2Djfc0nZVD4J2o9xiVuPcPppluJ6B/rUy/yF+TokBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TBEBrYTru5h2vlb/ssZq1xABu+R6NK4dU+u8KBUfo3P43dRw2EdWJWhd97FaVVGyn
	 LlK92NQ6cXiOur80+81ax5ksw8U+HUd44dK/LJmqaYRGCHfj0KjirmcGZMUDI7AAkX
	 MkKDXnE7IvrWOuJtByHza0BXNdpGLWaxcMRemxUi6iqR0/1wAgw8/l8cM2DEiupX7U
	 XKT/9Ac4MWD8jYZWEEN5feCR9VztKxa/kf4s/suX1ro2jvLHeY4RYbHzXK7r+AhcEj
	 dy5MuQ4WkaDmmJB59bSXz3qksgzYm4AKE2U6O4zk5wbhixBjxdyO3sy/cxG/3xKqv+
	 d885idTXlbOTw==
Date: Thu, 28 May 2026 16:01:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the nfsd
 tree
Message-ID: <30d38675-a07e-4d7e-9365-f4b97a3e31ca@sirena.org.uk>
References: <ahhRHXWXMtagI5Zi@sirena.org.uk>
 <03ab0716-6b08-4e4a-8fe6-2d398fe03ac3@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iYK9ESAStJ+DmJbS"
Content-Disposition: inline
In-Reply-To: <03ab0716-6b08-4e4a-8fe6-2d398fe03ac3@oracle.com>
X-Cookie: Someone is speaking well of you.


--iYK9ESAStJ+DmJbS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 10:51:58AM -0400, Chuck Lever wrote:

> 1. I might create my own merged branch that grabs only the three vfs.
>    branches I need. Cons: I've never done this before, I'm not certain
>    my tool chain (StGit) supports git merge, and it tangles the merge
>    graph even more than it already is.

You could always create this independently of your usual tooling and use
it as a base like something that someone else had created?  I don't know
StGit but I have similar stuff with my own tooling sometimes.

--iYK9ESAStJ+DmJbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYWMEACgkQJNaLcl1U
h9D2kAf9FBOArfO3TrR4uYFqlGlWycJKAtkzhYOp1OKjxJsE04q96bO5QFRIJMt5
emiQp2aLx/E8W7wd8mDmDn+006dXoRGS8SgQLy29oe0pxv1B9mxqS2Bozosx5Aip
FFd530zISqY+q4+wtdhCU2AHM9CW1IXRwvuKq6tAYw8a4mSVTYDfbrB6fdkK1krT
SPloeAKRM5j0IihRWlTgptjxE5Z7Jq4c6I5woTxIl7w5w5MkxniTs8eChnAZbBsW
y4YcTsjYyKmxxfVo7G4NGOt1wcrPPF/SaHLIzxAljdWps6iiMLlkmsl28Uf0KRK0
kj4qhjN/p0xjd/WhZxBOm3j15vjFnA==
=inu2
-----END PGP SIGNATURE-----

--iYK9ESAStJ+DmJbS--
