Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539792;
	b=hOmfe+rAJlQEK/VjEd7pQmvf0zv49Ab1ioshfUJZVUlotUmQ3Dn0D7kZvXS3o8ROGFDU
	 Ioq6GpmlhTHwb41+OacxJkU3G3DX0Z6xkLFlHLBxsebvxDOp/B0Q76ASnI46P76TdthWM
	 I2Kvh7BwN9uTd/YZpXb4hN7SQhqn/MfcpUxDuMwKPjfibTzNe20F8871aAcFtyvGeazxW
	 DDRv/sgSNVZXkqQ3FjNrqkfRKI0Bi2ZYwZwAzWuEzCpb1v6c9m4fenqgZC7qodHVv2BEA
	 E8xRNyFSHgfyUQAAVRcaMaHxxsDulMMIWQK+hLoF9CHaCzAAN20vUgAd5/tk9KCeWsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539792;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=7UOIaqm5jI4MW76ZbpVQEPff9n3HhPMQUS4wA9NCzL8=;
	b=dl08OF+RmU6m0aX7mDkBdAO/1M7q6p6c9uUPfDkCd8ekgq8EAq+9vpJYjc//2LaSpwhT
	 IA9jFIugIweRlsriNfTCD+BWf2mS3qOyqPyuZ7qis/y1QkIwAulpQUTtk7hATKtp5VRh9
	 IiDT0sX2ddkAoMqdaDx6JHToHmszPNVstCIdkPZEjPPOYcKWkB06+8dOkAOANJsknKWWy
	 tCvZAmJ6kxt2zQdO8+wFrTCI0v4/tG1m3CRCSmfr9VTK2iv4kGYFYIIunkD7dZ64wkVvd
	 n2l2gheW4BkD172W/T/X0arPL2/LqJV0uCbwD6Zzr6rUp6MEFRiSmz+XjaWaRj1hqMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UF/oFk/p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA694606A31E;
	Tue, 24 Nov 2026 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UF/oFk/p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE0A1F000E1;
	Tue, 24 Nov 2026 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539791;
	bh=7UOIaqm5jI4MW76ZbpVQEPff9n3HhPMQUS4wA9NCzL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UF/oFk/pE3wfrcuwm4GZnvP3scn0S79AMiBN+WF2lI2PXi2Po6Lo0ONRKn/CthD/L
	 ZaYfeeMNNwylHLMJk8Q91Y+r9ld/TDWTe1gKbVzsz3462+lhA4yL5RTugwXdzQwtwy
	 NAVOfdXp8hugB9pRO15IOstWC9Y4Kjs0taSSNv9l5axTAJlS7WpcCrude5WhsDqm95
	 gAVLntYj91+Zn6OjTaIXS7zjrxDxMl+8xPtvp3KnakkJiSCL5jK4fe1bJMXtcOqt5D
	 HRFoog3xrc/3sA0RyA/7eFIskHfuzvFJ29MdRXWR+RdyL9iDyRqcDd0RtH9CNq+tNz
	 shYNDqgHAikuA==
Date: Tue, 24 Nov 2026 17:03:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH linux-next] exfat: check the emergency state in
 exfat_writeback_range()
Message-ID: <01ee3c08-f7af-4b58-9981-849211b11e6e@sirena.org.uk>
References: <av2mOPyANz3H59F5@sirena.org.uk>
 <20261120003508.2135492-1-sashal@kernel.org>
 <20261123212633.1204021-1-sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="MrxnbvwMatJQE4sr"
Content-Disposition: inline
In-Reply-To: <20261123212633.1204021-1-sashal@kernel.org>
X-Cookie: Real Users never use the Help key.


--MrxnbvwMatJQE4sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 04:26:33PM -0500, Sasha Levin wrote:
> Ping. next-20261123 still calls exfat_forced_shutdown() in
> exfat_writeback_range(), so the emergency state check is still lost.
> The patch still applies.

You're sending a content free ping with no quoted context about
something you buried in the middle of an old thread...

--MrxnbvwMatJQE4sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFw0oACgkQJNaLcl1U
h9AWHgf+OmmjZBPiTzuvqRMMXuSWizS7IJ2rH7IQgXf71b9OlOBsx38yldoJoAsE
0SGIcAB/Zzi2gocV819DTpEqBDai2Qu8iNwILxYeWt0yitms3SR4fYP3dfLfevuz
WF27PINctyrBHJiN2PHVPvTjR3r/GQMap1EhIq3RGnCKJ6kUcx2rILphRU8UYGjm
56Qhq/b3u6qzjvHOXp5TMcKCbixj5XzBVlBp9TI8wETPn3xNWnNkKi6WzO/z0yk7
WL7jrgbonLP2csEiHZVpCMexwQ+9GJHDkxmGDXtKgZlHgGLFg5zR+ynuYZLr87eU
cvFscajHANvp44lbhxDz6xqsbVHVKw==
=eQu8
-----END PGP SIGNATURE-----

--MrxnbvwMatJQE4sr--
