Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65A3FE34B;
	Tue, 26 May 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806204; cv=none; b=rD2j5W7BwEl3Ebk4VGk5YopixXwcegq+ryrINMDoqcoCVvjojUwjHTDJqS9Ci2dsexZo8WwQrF2hqKNH4PCEnihrsNCXq7HsEDO+ZaUzWzZW5FtUvnHnVhzmlaxCN4MWf12NzC/x3zqWtCWWoNYX9jMhpNKdd3LwPNcg9VBGmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806204; c=relaxed/simple;
	bh=EdWsBfrdVsJsseCx5JFHLTA5qD+qQXrvVGs277ZZyv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjeGJnF7B/vg5KxZasGru8a6n4y3Ed4ub7mb5vrNMEYc7WFFsu7JC9MJMR49pmVWLVPczn7GBlk0sN2SIeuVsPdvw+Dz3wJijo6tjvruNb1kcAZuLdjKAQZc1fa4vZeNFJc4hDLJSCvIjwW+R0vlwWcUCDFCScgNONEC2grLR10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEQvv9BU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEQvv9BU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976EE1F000E9;
	Tue, 26 May 2026 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806203;
	bh=oxUIAPn1OFYsya0KTPYi0lBe7IeMDxkqxUWDA8343Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UEQvv9BUka32OR00dbqp2rSLyhVe7EAtZ2V1v+VHmMp3toa5hDHBrHCxIQaa4vmzY
	 ZrXRpqL8Z/LSdu4UELV/+yfSd3J/gtegKZq00HgcMLYeW5PsSURs7bTkPHHTwhQDqi
	 3sHuO5k3yw2/9TWpC3uL2ytOcwiJdhNyvSKZzzC8wiTPpsgbAVj0A7eHhyDmRcUPJ6
	 MwMGZ2XQlY1IfMmkuLFuMN9KR3Q+GVWkOs7aqs8Bs0Ai1WAV9EEy+AMnETvKY/ThYT
	 MoVsc8z+80pSDb+haYnfXur5zBqnCE2wcktpKGzUkSt5bj2P25v5VgWoCnQGzU0evP
	 7LQLUIOxsO9dw==
Date: Tue, 26 May 2026 15:36:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luca Boccassi <luca.boccassi@gmail.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 liveupdate-fixes tree
Message-ID: <c4b17f75-7529-4999-8d5b-f256b78f14ff@sirena.org.uk>
References: <ahWlYXNjGUbkKoHy@sirena.org.uk>
 <2vxzjysq451n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="je259bMOnJx9OgIf"
Content-Disposition: inline
In-Reply-To: <2vxzjysq451n.fsf@kernel.org>
X-Cookie: You are fairminded, just and loving.


--je259bMOnJx9OgIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 04:30:12PM +0200, Pratyush Yadav wrote:

> I suppose one option is to wait for "liveupdate: validate session type
> before performing operation" to land into v7.1-rc6 and then rebase the
> liveupdate/next branch on top of it and fix the conflict ourselves. This
> gives around 2 weeks for the rebased branch to soak into linux-next
> until we send the PR. But I am not sure if this is enough time or if we
> should just let Linus deal with this...

You could also do a merge instead of a rebase, the end result is the
same but the older commits are preserved.

> > + 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
> >  -		 struct liveupdate_session_get_name, name),
> > ++		 struct liveupdate_session_get_name, name, LUO_IOCTL_OUTGOING),

> FWIW, this resolution is wrong. It should be LUO_IOCTL_ALL here.

OK, I'll fix up tomorrow.

--je259bMOnJx9OgIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVr/YACgkQJNaLcl1U
h9Bqfwf/d7BCoLLmr5+ax0i9GzVmAThyRVNs/gbZC3P+HaijF3EwRs360TfNiE7V
ClqzWbJzwE8jgsm9JVfKEcOjKFZdtnTRU8Qjhhnf00HUE1if9ZQWhC07GPC5C0dk
JT3tPpRoopG+x4fVGCUWzOidWSGvNHg1SLbbk87OryqXuHVS5nESvRqyUJG3MMez
5pFD9alUFLBO/F1q4ISPGg8cN/3/11vaggFScMsrAVjeCstNawF9rJ48YFYyc5JN
WbkQ0SHeafOzQyew+y1Dw80FQwxNv45RIn+MMIf9QKoAy0CkiaDl5UYYV7vg03Hf
ifIdrXBizjwOObToL+OTaSFKZSvc3A==
=uWUb
-----END PGP SIGNATURE-----

--je259bMOnJx9OgIf--
