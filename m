Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54126286A4;
	Mon, 23 Mar 2026 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274223; cv=none; b=Bvxpt/hVOkjZDSDfoF5xpDJpEBJYquTQS7lredqwZU8yGd58bfbKl9jZ5yWFDCAawgE6G45qYZc+yl4yMHp1wSDUqttLGiFL6qgaXRS1IZ5BoZVH4KsHJYIvMt04LgZmYqe+aU0G7VdeWGl36IHBqfUGmDkXSzhNseu6CrVG9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274223; c=relaxed/simple;
	bh=hztFQmmY5hatslQ79FFoytJaDTtZ6EQM+dRrUib1EZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZegsXO6b9bHe6zrTWrMNufXRAGdMVSELJ9b9NiUZtJ2MC20VXnLny6qpFn5WddVbAXzzzltdvmFnWh1C2SX4xorjclrsImRJkQVwcxB8MnZQvpRn9SRBa1O6WRFM615L6Ua/V/ScJylyPLtH+bxM28kSmH8eZdhAYEdE+xL71YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFETMJlP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFETMJlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B35C4CEF7;
	Mon, 23 Mar 2026 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274222;
	bh=hztFQmmY5hatslQ79FFoytJaDTtZ6EQM+dRrUib1EZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFETMJlPhn04Zsys+K9sSl9DId8BhY/7ZVW+3vnQ3TLf3shGoqDi1HHFLIfmGxT3u
	 lsu7T+eY9gA4cGKLOcrKbH8bNsitNTWDUmnZ1faOLpF1J2lm6gxaWfN3kGyV2cCqgO
	 PsU/uBxZVXW6hxTHjEZztUt4XyXvdlQK5g3vKx86NvtAyVLHsAtyGPdhpE3gB1qxqt
	 MBzFZ8f6Bp0zBxUdLGArTyxJ/QwpNFfaVu0mezhhdOSbNogn/yMMP3S/yYPq8LQpqU
	 b8NWqpDN21jzDIrdPnmJuPQauublZ1AWyBYrqDXIQKkVzw/E+mOtTjP4sO0VsAjNhP
	 /8zsE+jMhuP8A==
Date: Mon, 23 Mar 2026 13:56:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <0eb49c98-13cd-4ad9-87f3-7c7b0ace242c@sirena.org.uk>
References: <abQKe58fc13oRFfB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahsiO6nedx2oVeLy"
Content-Disposition: inline
In-Reply-To: <abQKe58fc13oRFfB@sirena.org.uk>
X-Cookie: Your mileage may vary.


--ahsiO6nedx2oVeLy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 01:00:43PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the vfs-brauner tree, today's linux-next build (arm64
> kselftest) failed like this:
>=20
>   CC       statmount_test_ns
> statmount_test_ns.c:37:19: error: static declaration of 'wait_for_pid' fo=
llows non-static declaration
>    37 | static inline int wait_for_pid(pid_t pid)
>       |                   ^~~~~~~~~~~~

This issue is still present in today's -next, the version of the
vfs-brauner tree being merged is currently that from next-20260312.

--ahsiO6nedx2oVeLy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBRqoACgkQJNaLcl1U
h9BP8wf/fcxVgFNriSZs6KmIqEJMLnGdhEH0USeT8xBNzqxYCbmIM2snZszoMpTw
Tcv1KA5osFwFyPANc1ompn/tFVZTP0JuGbwhrfaYXenl9D8+u2QiTjeaovijjzsa
J81AdvibKjTTrDyaKMZjzBpYbQJZza+fFhbPAMbA9j/xVWSjCRJWkYVC4V6QyJk3
wEhapIGVbC3TlXd1C6kVlhZIwqXXzkV1URqLcus0nZAWDqAluxDNo7Ro2HMv9adK
UzJj872Og0BSIlO0AOC97s9DLj1fb0QC8xAqzIaRuS9xHaM7NtKrRhvqJ2fRFpyO
pAHcdVz/Zxv90zgK2k6dAzr1zCda+w==
=p/OE
-----END PGP SIGNATURE-----

--ahsiO6nedx2oVeLy--
