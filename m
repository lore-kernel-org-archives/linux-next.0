Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C451C84A2;
	Mon, 18 May 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121925; cv=none; b=Xh58D3QDvHorAw6gX4UIe18cSLsHAX7pzSmw7YRiGQVuTeBKfViW9IkKRlc3AREnFVJktAwIPr4XbbKC+Htv7GvcGtIgOrOeO92nRqoz3GboY2POATZEeT3nNxwJYg0LiQ08ZrhWjo4poskYFvGYfL1QAjUO4A0xDJFCsUho/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121925; c=relaxed/simple;
	bh=IsKkQ3kXPnGjl6LhZipZgPMbDEnX6yuCybX9kOHpfBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh/aDZqC3aNjaXdIEXQcbsKfQuPQFmmo1ig7WMIcNOuX+EsJltMW9/KdwR6xolvGqtARE8hZEiZE/7JhCGjjv3rwBC4K1ILg+M55UVWMvh1VaRyuUWjw+u+Fo2wojYRaXNgySgU1P4jW/hNGA05ozdpLPc6pQaGGgX0bXISuTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmwKmkdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmwKmkdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E22C2BCB7;
	Mon, 18 May 2026 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121924;
	bh=IsKkQ3kXPnGjl6LhZipZgPMbDEnX6yuCybX9kOHpfBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmwKmkdv6dW2MGmR5JMJmgEgedoDv88kfKo0AaFFH36JiNzHvH6OOQoKQIf5FhN+C
	 sSQ5QE5uLUHNMvjcmp0X5n/jcplN+jv1ZHGVTQS6f8BoJnLdDbkkjeBe+d2zAjCtjo
	 Fe3zyiCKholzo6DFRUkhA9q5ffDR3vDmtPqNdIhILbJE+ThHJwTCQKWqZUW4HxLgxH
	 VByGuGyI8WbSKG2Ba15jzgXTFshjeSZdsyGpML4PdoHeejh01+7BQtFpWNy72Tlgoh
	 yNd8Vw+r+eK5YBwEaKpwMNVLQCvoJOFe84jsfzADAlNaPi6VsXFEUtaUsCIyqEqoMj
	 5KDd6TIIVLZFQ==
Date: Mon, 18 May 2026 17:32:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="39ANrEIpr0zk314P"
Content-Disposition: inline
In-Reply-To: <agruPPybCx8q2XcJ@sirena.org.uk>
X-Cookie: She sells cshs by the cshore.


--39ANrEIpr0zk314P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 11:47:24AM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the vfs-brauner tree, today's linux-next build (arm64
> allnoconfig) failed like this:

> Caused by commits

>   3adfed795a99d (openat2: new OPENAT2_REGULAR flag support)
>   6703991ad3a35 (vfs: add O_EMPTYPATH to openat(2)/openat2(2))

> interacting with each other.  Due to complex conflcits with netfs on the
> old vfs-brauner tree I have applied the following fixup but since both
> commits are coming from the vfs-brauner tree it's really not a merge
> fixup:

=2E..and my fixup fails to build on sparc64_defconfig :/

--39ANrEIpr0zk314P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLPwAACgkQJNaLcl1U
h9Cz8gf/fRrrbaWyD6A9z2CZOEJqEeXnC6rFcvpn6w5gJH8i9uia89DUHchn6Jrc
KfK0BOsTsHuOg4vxazt0FiM8xAmDeVy8adS+LTrbTJTN/D24gKFDfrxi1PQDfxNA
g69iUjH+tK6tDAFuzrC/pWu46FYodbXj289oo30elXK9PAO4ydKZVj9St3OtI/gF
F1CFlsnnLI3yFSHo9o/cTPoh7toGOpCxO1x12YhJhKoL92fCSqJqv4Bld5iWNknp
Bk/iL8RIdBZJu7mn8VdIrBKUv/RuW0972gc2b0NQAUFTPMkb5rPY2V03k2Jc9Ymr
wXAG0dzLUrqc9vi0LS0JjgM3CDvFXw==
=rrCp
-----END PGP SIGNATURE-----

--39ANrEIpr0zk314P--
