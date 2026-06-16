Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABB36C592;
	Tue, 16 Jun 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619035; cv=none; b=Nve+jXLXfqJqAInLbU50z3RriX9d69VsU6QmFZBH2KSyZ6iAp/kDxYmVtxPq1l1gYWmPI3axuXPYJ5t/5Qe93BZe8K6K4Bhz83jmpxyYqfL5JkRDmYpr2Ol8H6Ly+7Q0IqxMBUPkFyor87be/Dk0gDxOAMIDpnwzNU3IRCgf5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619035; c=relaxed/simple;
	bh=q0wGb8XDXlVV3MJxn3VfT3Sbe89sArID9awUxZGxRO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzAowu6ndAblVQj25Ny+jZpSpIKyvJeo+AQBVCB/g9px5orTpB99LlnaPEf7ChCFiVlKIjdH4mCLRK07CuTpDGAaE1D0OpuDAvmQtr/dX4zY36XznoBKFK7ENRzcVgPhs776XmoOOO0xQ+mei2UKb73Sys9nuqO9nB1W66yt6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRroog8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRroog8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DC21F000E9;
	Tue, 16 Jun 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781619034;
	bh=S7veX/Dbgo5gISTtzEQ/kuUcZrVfEPrA/1eYcxqkTtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mRroog8qhQ32rMK5Qa6977anKVEbW3bAzB9ycTc9kbc3YbZ9HGCCvZA0tPoStZzWP
	 QAn6P21Ya9aS+nlnoyQ5zeXAlQN0alt4N8tw5IAYD5C4eQj/y7qykxeQ5wXhju/8as
	 Lo7V4ZHfrrI+I1lRGUSXyorUcppBVFlN/ZsquUWjUcc+YgU3vCmVKNIhoIZw2US5fp
	 1KW1bVv2mC1CrcNf3ccUxD53dliZ6iQz7HPL9gu6QZNKdLRbogCLMpiAVbgMqln0Nc
	 5AxpiXjzPR+1Q/FMQYM6WGU0NpcJE+lNzXZyySBMD+cgcKLgV7KUsZ9T0d5bFmltq1
	 6W5CAsYt/OEOQ==
Date: Tue, 16 Jun 2026 15:10:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the origin tree
Message-ID: <4000b1cc-a747-4f4d-9716-adeab12b6ef0@sirena.org.uk>
References: <ajFXBeLQC96YuC0p@sirena.org.uk>
 <d968a9de-df62-4120-bc95-21483a15785a@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oOlVh8yt7RxM2MHT"
Content-Disposition: inline
In-Reply-To: <d968a9de-df62-4120-bc95-21483a15785a@kernel.dk>
X-Cookie: Password:


--oOlVh8yt7RxM2MHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2026 at 08:04:50AM -0600, Jens Axboe wrote:
> On 6/16/26 8:00 AM, Mark Brown wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial

> I updated my for-next a few hours ago, I think you're using an older
> one. Regardless, it's fine.

Great, thanks.  I mostly do a big block of fetches before starting the
merge (sometimes I update more through the day) rather than fetching
immediately before each merge, and the notification mails are often
delayed a bit compared to when I actually did the merge.

--oOlVh8yt7RxM2MHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxWVYACgkQJNaLcl1U
h9Btuwf/SMfCSPs7o9pSX/dzaqqMmOiS4fmuooFMZsfJw/XiwGPASL3LRbYNO/rx
+yvtHf8uXMrcy/jwb7RhwIUCzEWUw6oEGumF47X6yMbCijpDLuENSgX1ltutOPFT
+QGIPymzToFG3ljJrQfHsh9NsGQsL8WmdfiyuheUIiU3WxENk4Q8rBPyTYQwM0cl
Dc13lN4aRhzCD6i7PH/MZNjpgB+GG5PQbyRSkQFfFeEjrCsCLq5EAofxVaPBVkh2
lIDvG1gtO6TM+f4m7p1uKXfvlM/YG1lfloZDviHxMS3ufiAH7U8mtgus7AROVY7a
F4pobfzMsrgkLcaQuFWXk20peSRYVA==
=kFPA
-----END PGP SIGNATURE-----

--oOlVh8yt7RxM2MHT--
