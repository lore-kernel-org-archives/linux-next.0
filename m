Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A53F54C5;
	Wed,  1 Apr 2026 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040931; cv=none; b=jbAOoYDYQNfZmF9ZcPXCLfa7YOMCk3g79NPabsLGePeXhd6ZtYj+uDFZ6erZjCXOZR6wosDeeUM7oDIAVd0IOysszAIm8nJIHvCe6HXLL1aN/z5SiyZFoDXhRTUEr76y0hl6Qd3qdl1Rvj3qpaBxnF3cnmRwYTZiYbZeOrdSOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040931; c=relaxed/simple;
	bh=LcghJW1keJKwCb4+7wFVgZDpjCPdIVTya5C1BV9YgC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLS0zxHYdyrcp6LtFOT+ysDWH7WSBracpQkiN7wdOfGZ90PBMdVKm8Ng4hFJFjBn3eJeychDBN8qudzzQK/0NC34sZvMnRoYxkDSpm3TJcoiMcsFhuXDjPn1FGiB5Qkbbfl01+vFnpW0XR6Hh14RBphCXXwY6Muj6Xd6SnsWAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvHNRMPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvHNRMPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97635C2BC9E;
	Wed,  1 Apr 2026 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775040930;
	bh=LcghJW1keJKwCb4+7wFVgZDpjCPdIVTya5C1BV9YgC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvHNRMPSsGKTr1ZUdyhR2ojXVFj56MhN8CiMvqfXxIiUkKXbYcUZI0doaNxbskscs
	 zSGJPAX1kEiy86pL5iWbJjGpqOUTKaceLSgMiWDoOnx6Sk8SgMhihwX8vhEkui8kXv
	 CH8UDy8tXrLfhPE66rck0jvsrPEgmWWvZZ2uB+a+kJ/65qge7X2996PMXNQL/WwBPq
	 O3rHaKnzJZsV34P/vFSkIRMU7XxmqYuRA8jQZs2NRJjicTxopTbRJfrqbqvWYVjwn6
	 htIj0p1GNbHgFnFt3qY6XIFDG2jzGJsp1qlWNxh1ytcQZtNue5yZF1DfhQgZBI/5iM
	 y/TL0Lgmdoktg==
Date: Wed, 1 Apr 2026 11:55:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <e3f3d679-61a8-4a2c-92ea-e93fff846938@sirena.org.uk>
References: <acPV19IY3Gna6Ira@sirena.org.uk>
 <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
 <acbDBxR6tgO6WzCB@sirena.co.uk>
 <bdfb46ce-1585-4c42-af55-a2202aa4ee9c@sirena.org.uk>
 <20260331-mondphase-schwalben-72b291049031@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rwf37Ujo+MirfZdk"
Content-Disposition: inline
In-Reply-To: <20260331-mondphase-schwalben-72b291049031@brauner>
X-Cookie: "Yo baby yo baby yo."


--Rwf37Ujo+MirfZdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:21:38AM +0200, Christian Brauner wrote:

> Sorry, this was _yet_ another callsite that completely duplicates
> wait_for_pid() for whatever reason. The following patch should fix it.
> I'm adding this to vfs-7.1.mount today.

I'm not seeing that patch yet so the issue still remains, the current
vfs-brauner tree I have is

84f524dca4b8bc9e9aca8ea1dbbd2aa3a239d998 Merge branch 'namespaces-7.1.misc'=
 into vfs.all

=66rom Thu Mar 26 17:02:16 2026 +0100 - did you forget to push?

--Rwf37Ujo+MirfZdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnM+Z4ACgkQJNaLcl1U
h9Cfnwf+L3iBWcOinh55vEIeRflX/YeHQm8vIsTMO8GhhIKd+JBxTVRKUdqtCe81
UoLMgFGLIvuf0jeL/N5b3HRPKWsxI4yVOqhCwOiD2awYIRf9emBmin5UhgO6hXpo
8YARkaF4uA7m43qm2sLadbYGua3s75brZShW/k1D7BwAzRmMx/RbPaEYrlg1tE01
HX08C8pHdY4cvfS0FDycJCoWf5jnaqCDgHYtPcRwX3Znkx4cq5I597tQqRPCxm/l
JdGRcj5Fb/L6da6tzg9KzL/IqYYZarTD6TrfNPNZdg6XU1EAV+iFpen3j2hrN7PB
06MkYXiRu0s1znoxkOCWb5ZGxPXVIg==
=Z2RF
-----END PGP SIGNATURE-----

--Rwf37Ujo+MirfZdk--
