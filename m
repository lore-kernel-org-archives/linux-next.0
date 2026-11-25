Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609865;
	b=jbI4uxfYs4Ijuqe6vpZepXAkX4uIhfrlJkpLkkcBkruf937bDzBrQnTKvZfALuBgLVKN
	 5pVORbi9KiVz2zDNe8OttAJx4c2/tfFDQJ5Mna0qp0H2QZ+C3fVt5KQZ0pUTJi4dK8EPU
	 Z6AEKhgh4daEcS2kdnjGbdTS4gmpAdDA7rUDzTOfGvTurIn8q7j+3+juRebKLFV/hSTjq
	 uJkgYKvOTiy4PomxEwS7CWr46LDqDa5f2OFD2Sg7r9JoLySfVtb8nRLE+TiAXo3ajXQlP
	 a3DX3ZT6W2FwdIfEPIttvQLVOKQjDZChdNmByYN1R4a1Cu7zHXPCBFT3jmFd8sf/mrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609865;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=e3N56wcC0HGx+Y02qLfxstEXsguXxcSyRh7I3SyoRy8=;
	b=3gA1bX2Un7xbXD/MReGpy7pVP+vqO93MBnyIB9a2o+zyh30qFhXpOUrxDAIPscuzCZDF
	 CeGkp95pASlAdzG0ckTLzK23i44l3r3HhE4eenvlGcinnGf/iH8ZK9MHPPMjHje8PXVQz
	 bBQNEjkmIyrvmGd0JB+Yq+zt/XauDL2ukMhix+DSgvsm31A47xZ/dQ+zOSL3OqNTNw41U
	 4S26V1EVsruYneqLSU4aWWOs732yjMdUDlC1e2SFjkAX2G6+void+7G4odZG+P+FMQuYJ
	 uXNVZ/MinjpmYgtuzRMpGZOSyFLbNyyPeXVICplVckyAGIHjfiJHD7IMaNdxz5nH83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtFYxuRs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974F606A31E;
	Wed, 25 Nov 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtFYxuRs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55C61F000C0;
	Wed, 25 Nov 2026 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609864;
	bh=e3N56wcC0HGx+Y02qLfxstEXsguXxcSyRh7I3SyoRy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtFYxuRs9TMZKxU1/HAq+nDBYuthFPKat3BPGOxjg1Hrjv+v/J3GZ9KnIXrmD1WS/
	 2GP5/c5evhVX1tXLBWJyF2HAKrrz29oB9g5tFKWghSYDe+SceZaXKV3MbpBwdaChBx
	 PEBCP6F8ZrBOXT6VpplgaZb2uT3hdm7ZcgiNpq1gNKnMLeBOkPWiyQyXQohtUZA3AE
	 c9mPL7xaYWOrlco9VYx5q+T14aGBVkHXYVqyl+btTkUhSBnGMhFjDJgWqO0ad28gi9
	 NVYoWaJCPP2izC83hYoGGXNZhECW9bl1QoDel3MItpTWNxE7vJ5bja4/NCUi9afJAz
	 O7iR0lwOqiJeA==
Date: Wed, 25 Nov 2026 12:31:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <b070485d-b89f-4777-a8e9-10fe07c56c2c@sirena.org.uk>
References: <awXHMlpalEe2U_vC@sirena.org.uk>
 <away4tDOZQoAWXky@gmail.com>
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
	protocol="application/pgp-signature"; boundary="hpnrE7TE8Mm/41f7"
Content-Disposition: inline
In-Reply-To: <away4tDOZQoAWXky@gmail.com>
X-Cookie: -- Owen Meredith


--hpnrE7TE8Mm/41f7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 25, 2026 at 11:05:22AM +0100, Ingo Molnar wrote:

> Technically this is not a 'build failure after the merge of the
> tip tree', but a 'manual merge of the tip tree with the pm tree',
> with the semantic conflict that went unnoticed, right?

Not really, a build failure is something that breaks the build after
doing a straight up git merge.  Some of those are due to semantic
conflicts like this one but they all come to my attention as build
failures.

--hpnrE7TE8Mm/41f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG1QQACgkQJNaLcl1U
h9DTCAf8DFuVlCj+tpuPBn0NL5Z1epko6VLm0d0ehwebjkDj0RIqlGIJGQhOZdsa
welbH/Psa4YfriPC5jKCcrS+PUUtosQwMz3OoU4/QLP1BsXOzxevyeCw1QaqgISP
62L9/09EkEGy2nk+vpyE9Q1Gprq88/lQ0/YtJKkskuQtQ6hLnX6hNdKKwFm2t2Hv
BSPdBKHu0xH7Ry49acYOOkCKTmUnVs0aseScPKqgVdZ3ErqvcazxGGOeuQX6Qbex
H0Vkh9j2hvpPLITEUZZ/Lti6kqJ/Q2yiys6ll8pQ9dC1rFB501BHy6lFa47MYJI3
3uewQ6o37bRugEW+6zGSNazFCRKJSg==
=md+Q
-----END PGP SIGNATURE-----

--hpnrE7TE8Mm/41f7--
