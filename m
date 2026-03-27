Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062082BDC1B;
	Fri, 27 Mar 2026 22:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649023; cv=none; b=ar59AfP7FG937xl1ZRpjsApKA9w/9hq7KMC0ffCYPIKZfkrMa2i71MUk4G8l48j3k1yAA/0s7xZ5iEDSjQke4xeZAAJLsMLBIu1Z4rz7T0DT6dcTA2VunIbdSaGFRFw9bgcGAUMKRbkSdJMLP27AUvQJoGYgCCKKlgaMjyjMTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649023; c=relaxed/simple;
	bh=1rKTdU5bXtfc1Gcto3xmghCyRrW7/UI7Is03lwsRfoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7tdTdw8HCsXU6YN/rUklkJL+mle208kCsHaZwzoAg/3t6HRLluqaQXfOZMQhDljtuGtBUTJtRxjmJDxkcpvtFuzJVvHBbD2oiSNxUnLaPUz7/4pdQI51oTnKtH+AP6ojV8F59VcW4EIO+/7zOkzWca5CQztruqYKv/+qCMpEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3+SbPXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3+SbPXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A8CC19423;
	Fri, 27 Mar 2026 22:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649022;
	bh=1rKTdU5bXtfc1Gcto3xmghCyRrW7/UI7Is03lwsRfoo=;
	h=Date:From:To:Cc:Subject:From;
	b=N3+SbPXzd8CNF2qm8m86ILgNVP4VjNIzXimun8KZNA9yH2U0YQgexnn0lp4KWIkmK
	 MigHfT/Cu3wlvJQy3hzwZdHUrJPjqRC0qa00Ru1DI0oQVABqtpQRpCNI7vzqTtBvlc
	 rb+lfJzO9gnmz05LlwyMMYPfon/mWEa4HGSeX2iRY1Vnz7VK/rAc4PzxbnN4ncs2vM
	 Qo9pVzP0t4q1v/9NX0ecw+97mLnTnzAmid68dOSruM1Bo7lknEi9LGCuul9mw0+w/Z
	 UMFeYeR+fxTWM3EebqmKCjTGZcGItSuHBnn2MMYnTeXJCRwtGGqTA/ymqqDYcEbZmC
	 EAjNNfaOtioZQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CF5AF1AC589B; Fri, 27 Mar 2026 22:03:39 +0000 (GMT)
Date: Fri, 27 Mar 2026 22:03:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <acb-IuZ4vDkwwQLW@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RrTy3Gh1yNJRIVXu"
Content-Disposition: inline
Message-ID: <20260327220339.O-zTDQTzxTVZuOedEur2L-0-IcuY33iAPnsEEUtrARo@z>


--RrTy3Gh1yNJRIVXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

In the final build, today's linux-next build (i386 defconfig) failed
like this:

/tmp/next/build/kernel/trace/trace.c:820:5: error: no previous prototype fo=
r 'tracing_alloc_snapshot' [-Werror=3Dmissing-prototypes]
  820 | int tracing_alloc_snapshot(void)
      |     ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  bade44fe546212 (tracing: Move snapshot code out of trace.c and into trace=
_snapshot.c)
  =20
I've left this for today.

--RrTy3Gh1yNJRIVXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG/rsACgkQJNaLcl1U
h9BkLQf/f9vkD6dFcyhhlhL3Rjit0PLbL+qJTlrCr6oOeeoiYSWFA9Q5CjcRVUkt
+KEiQD4cq0vu6Bxi8GAC3IJyTcOK/vj5Av3dDG73cOlX6WUy2A5z2XG4sKV+fjBh
jXWdxX7CxBSvwZI3JTWA2kei91crpjqYjyYedGnUpgAbtkvFTnN1yQKoP3EaoT6l
7ADTthjhH+XM/ZVSVOqhE03bkXEXWNfeXUy+51gXznupZRe9YMMIxj7CNTtvHRTT
sAjPuq0MPnbuCOJBYEreShJQIUM+NoE0R8z01trywhluS5uRgHnsHuk8zIYd/7nK
DlJnFzxMVK/dbn+HJgq/Rp54MmkCpg==
=alKi
-----END PGP SIGNATURE-----

--RrTy3Gh1yNJRIVXu--
