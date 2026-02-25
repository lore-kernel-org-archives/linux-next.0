Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0F39446D;
	Wed, 25 Feb 2026 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018963; cv=none; b=F5vnRqL8w+RHwo0eGl0k1mQ8eaS84Ak1FjzbZWI1zyySjETkgrzE+gdVFCmBMjl+MTQwJhIeAMaBf4FGpo9FY+T9dXvmFVa7iDLOYsn0p7gDONrDE8NUpKmW4BebfO4Hfm4WYoEprFsXHSR323Mlcqocg8jvSoOLrQOY0HfyBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018963; c=relaxed/simple;
	bh=oTJWrXX4Vf9s30T/3NC9BsdmGel3IUZbHogetXAwrRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y4OJ3sGuNayHdKIFek0NVRewN0GB7oe54wGz10zkcHOJZCNG/W3NIf325PYCMDe6dwvactvMIgkRD8Q82O0xWEksCt0MoU+//kYgX9/PcWGbw91ecaAq9q1/8W0+2E8o5Nz4QbL7zLkcz7pd19Xe/0jCSxsy5dQmO5PGwQK9lU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDzJ6gWV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDzJ6gWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0807C116D0;
	Wed, 25 Feb 2026 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018962;
	bh=oTJWrXX4Vf9s30T/3NC9BsdmGel3IUZbHogetXAwrRo=;
	h=Date:From:To:Cc:Subject:From;
	b=RDzJ6gWVO2Z32nG4Orel/2tFxdEANwQ8JLJquspUw2JUha3tF0rAHPbmTmtAMvKtE
	 SDmPwgA21lke/kIX3XT7NA5jzkZ2si673SbaVXQXj5n6H8spVNUq5IcGl4Abyt2Zn1
	 OlzdRLA151OZN+WmNC5/zF7xPyvzlDxhBbPA6cUEeF1/1tPCDPq+OsUvv5CsdYzfT9
	 ZnZ/mS9RWQdhzNSCu/ZrjCM5ai3fI6y9nr6B7LM1Kfzkd9AtMiR95A5Yg5LUIHuMV0
	 4VbEdEqhvRXny26s7gHaB17TJ1pZtTW3/054vo18fU3tJHIP5XfifQlMd3imCp/RFt
	 JN+/6faOje+ew==
Date: Wed, 25 Feb 2026 11:29:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the rpmsg tree
Message-ID: <aZ7dD4KAc6zdpSXx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d1SqNkNLc4qBy7SS"
Content-Disposition: inline


--d1SqNkNLc4qBy7SS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0067396b1e58b ("remoteproc: mediatek: Unprepare SCP clock during system suspend")

Fixes tag

  Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--d1SqNkNLc4qBy7SS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme3Q4ACgkQJNaLcl1U
h9ArOAf9HzvAOWjBCst7UnvIjIMGVBBfwGrEx/Zf5mw1ycDH7b6TL0bJ8j64xd/l
fMzLs9S6d7MvInG92K3qEpZ8OTXSEO9dwi+df6T8SJwvrYSoLy5uZNy8bR0PVrYk
RU/AiaDfMneF1gug6mf1wDTOsCI4ObMWhkhjNVWHjysf2X3BWvMFRr95Y1akblGd
t/ivNYrLLtiamg4AOKOJChIvQ17rIJQXrmh81D2aGQLj1gIE7MPnWgKiLvP/ccWd
0c+hUlNGE3Fr7ypIB8B/JVAsUJ3L9GL3l9TjX+sqp2nz/eGPZYUy5EbpT0eSHpBz
GkXKBEFKCQngXzEYu2uhcNC1cflt7A==
=ZePY
-----END PGP SIGNATURE-----

--d1SqNkNLc4qBy7SS--
