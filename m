Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD443AB27D;
	Tue,  7 Apr 2026 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559248; cv=none; b=rOspQoev+L8VQVbn800a5sN3Lk/UU8GSBZx8v9h3uG43qbIbTk/vLqFsGepq3NH0Mia3U2GBWqIeVZ0X8wtSjyLH2G2vTUcNCqCpBQUiejXjOw/tRhmtRa9RCAAOrA9Komv9T3yC1jVf4F2HKQ4+fwbRntroJDzDTM6LA0GcQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559248; c=relaxed/simple;
	bh=UFqm9nCu8QZGdNa01y5fxO8OeFnClMun2Kb4QEBQWvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MW3exX2Dq6+z6nZxSwo+5dIDX+UNQTXOHPN+jgyjxrit9ZnQsNpsglX+otaI8035mzU+4IdwQSfi1T4K36Us/YDTnd/78/YHw/Qq6S/IkpehSoppb5BB9PJ+PprpC3zmOQc+53WseG29kKe6xpj8R6WHZYP7NVyfUEMTSjDtMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b82Vmt6e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b82Vmt6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48FCC2BCAF;
	Tue,  7 Apr 2026 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559248;
	bh=UFqm9nCu8QZGdNa01y5fxO8OeFnClMun2Kb4QEBQWvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b82Vmt6eslxjr/zYHImtuLoJwTBTZygjCfUfLBFORykmk6MBicJ1qiYZTveC787aa
	 lKXTVHfiSVNQBk8TOV7EijGb7Uo3qdXQwbSRuWjljB+w947zB4GGPlydWhSFs2YjCK
	 1sinY9/078eFVh2bwhX7X1nPtw+4DY7DkUSHUiHK+hg/8CAfZqNTQFHIkOKxnnKIzd
	 PFVoNXJJTCPgaDn2G4vdbcfGR365M+GFOyuwG0opIGc9C5rUr8lTZ64kF16a82n2dv
	 P1st4cXBqSSAsk1Lb2zoCruxlqfKRoxuWoQbAuP6xQp/tlJ0vAmXacXfdvObzqXwdk
	 Fs+nZ7MkxNewg==
Date: Tue, 7 Apr 2026 11:54:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <63bc0d9b-c2e5-49e5-940d-53b3260fbed3@sirena.org.uk>
References: <adOxjbi2byrIet3y@sirena.org.uk>
 <20260406092553.8737d1e3834fe6fdeeaaa8fb@linux-foundation.org>
 <b96ce2ef-cf9c-4f21-9058-d1791305d5b5@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EGWj7lQjr2V8bweh"
Content-Disposition: inline
In-Reply-To: <b96ce2ef-cf9c-4f21-9058-d1791305d5b5@linux.alibaba.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--EGWj7lQjr2V8bweh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2026 at 10:19:59AM +0800, Joseph Qi wrote:
> On 4/7/26 12:25 AM, Andrew Morton wrote:

> > Thanks.  That's a nasty-looking conflict due to the applying order.  The
> > 0b2600f81cefc change is actually small, below.

> > Hopefully Linus can figure it out ;)

> Should I resend the series base on the latest linux-next?

Definitely don't do that, things sent to Linus should be based on his
tree only - basing on -next will pull in far too much stuff.

--EGWj7lQjr2V8bweh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU4ksACgkQJNaLcl1U
h9BFEAf/eOad0IQb7xT+OLnRR4SlCuvL2AXAs2RSTlmgdR0BXVd7qgm9iSH0jA4X
M3xFDZ8TysMWmVqHxvqB6polXvHIXKwq3ABJ5PezmUvBbo6L4jzfIXErwencIA3q
9VyaQ9/dGdOYQEdDE+c+9zJDIh3ig557ajUM+y2C/JdmGCSySaX6IHjV9bB1fLOp
AtqijGunY6U2rRdZryvSVVJcGKKDnVmWjH+c6YSRC3YXt24UD52R7xeuV8y/YIYI
AqARKDh823YSAHFiBjqGF192b992M42uEIZAV1JW3uQOaafV8wM6g5Z3YZun6teB
kzDsLEmHul+1Hg3W5QuAqhAQJ0aEFA==
=sy2e
-----END PGP SIGNATURE-----

--EGWj7lQjr2V8bweh--
