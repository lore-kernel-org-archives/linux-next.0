Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10A368276;
	Wed, 21 Jan 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016302; cv=none; b=LFZ453tmUeTr59fmUKfwgcDP8R6kOiXv+kLaUpFCAC90sEEJZsbgtXTu6YibM8SbAiIfRZGCvyQiSBpbEhdor7Eaj0fOnkDKWH1rffd4y9ZC2R0Tyos63ax5qpS6371Dr38376GqyBb/V1f0BU4cRMIBVUihF8pUKG5pxN3Wvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016302; c=relaxed/simple;
	bh=U6bvspIeKss8FObSmEuztDU60THlVMI6SyCBXY6DwBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObtJemPwqu9L84qMCRIRCLisYgrlGdxi8b89GGPrc6cVFhyivqbWm7bub4Pcley1LZ/pNPy5RGe1r7FBwlMwM2K6hEl2whBGd+fRIYZz/x0cmzVs0I5njNTgnhEzc9HSMymOPr/FdWGOPwKp5lAaRJjIMmFrHW1anvTLzPJUBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIqYRWS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIqYRWS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC7FC4CEF1;
	Wed, 21 Jan 2026 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769016300;
	bh=U6bvspIeKss8FObSmEuztDU60THlVMI6SyCBXY6DwBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIqYRWS1HxcNXmsodLtnqezYrHegfH9VhB0CRfLh7FK5JhrJaZR5CcIinrmwk8/fs
	 pegASKxiSwcQV9SZSDEooae9wIy0TWs/yUae7abqhHdAYT7rDYx0+n5jfOK+OFYUh6
	 Tt1CI8t3GrywCrPB7HlSP+m/7Q6AjJmdd3gKOA4HQV2OhSGQt5IS61ROk/BAASjsML
	 ZtgG6pz06yDA2E1vTP69fwismcfeck5AHY5/Rk7tWhOYFn8mvguCn2xc9B5p4lBdmM
	 YjTsu0TjbpHM/nBrhMtIlZllhVN6KIodoI1LV8d5j8/GGD52rwW+vKf0y3cwRXLlHI
	 ZdKU+iYNy/16w==
Date: Wed, 21 Jan 2026 17:24:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Rob Herring <robh@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <52b22a1d-b135-46f4-82ca-1c54574215d7@sirena.org.uk>
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
 <CANiq72nC3-k07aGpw8Bp-sbJcYa432yvtXwxrqNgNj8aFuvR1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EF3OxD4K/MGlmv4c"
Content-Disposition: inline
In-Reply-To: <CANiq72nC3-k07aGpw8Bp-sbJcYa432yvtXwxrqNgNj8aFuvR1g@mail.gmail.com>
X-Cookie: Eschew obfuscation.


--EF3OxD4K/MGlmv4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 06:18:06PM +0100, Miguel Ojeda wrote:

> Cc'ing Daniel as maintainer of Tyr and author of the commit -- somehow
> he wasn't Cc'd?

Ah, sorry - I missed his signoff below the Link: trailer separate to the
rest of the author signoffs.  Copying the Cc list from the blamed commit
is a manual process for build failures, my mistake.

--EF3OxD4K/MGlmv4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlxC+cACgkQJNaLcl1U
h9DgXAf+JP0mAMkfH8qbOF7DMfrlrsFhT3+g+O5k3iDsdlfCkMJ+HNPHcmmHPLXu
ARzR08Db7kIeZJlzfnKfsvH28F7Safgq0kLQPYJi0geGIKc+WetQbhh0j/2BT3Uf
vh4EAEH9Zftd0wMQW3BkFm90s72n835nd01QGKfcJtHclC63QvWaBr8JyteCAZSR
1XrP2bRudLbZquitMDXHmp/kyqX4JpxQa05e//AghyK3nMvhODcJFo4PbKJAvKUy
9iuo+Z7hIquQ3wHuD0l13LlTs675VCpEp+X7CsZh3N05UZJeev+vwLxsu0ZovuK6
eSB+6H5+uw1l9jc7/YT3HLbYhg85Uw==
=eQew
-----END PGP SIGNATURE-----

--EF3OxD4K/MGlmv4c--
