Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615986;
	b=q1qyOvFuoji82ZYLuN0vSUOfI6sgbnS22c9sPuHnzadWqiLrYgOT5n92rvtaBbbAmp+O
	 2XMuwmVZJEcruI0ks292Kbv3gUKkIshe5acekiwzO+VNdZIU3LypjBmPg7+Op+p16nMZ7
	 dWojpxu1M9O9bp179aVVd+wyce+vE/40WN6ukeT4cpPGkEkaOw3RMKO/f2TJEH7mDgO8M
	 xWRDCUxDLpVbtFqvha8OxUBVp5+NRNDkHGzPFP8Xu8dh6TjSKwEyuEIBCz/M0aenyu/1c
	 xjHam39SY1Amg1UY0HZi8gKzsEpg0c7vUiNThoEsowwia/72XfKO0uI8zH9CWgSleuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615986;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=kKSOc4krN6fESyzYoOBEWRPvJ8l1CU1oOEgL/+g2HI8=;
	b=rJRTtbN/mtGe+8lxvqpFc/M8eVTrUQsf8O/zCrgM+k6qbkBlyefjgjUK4NIKrgRJK+qH
	 9h9lTwcfl+0DpenLAXzR11sYlpNrITcBgDm2UMOlClu9vLU4a5YybwL0pBWSuEibFkqy6
	 ycQlL8ywCUDCmvpOjYaaD+k9Sw++E6S1npw6ZHoYCgORhO6H/QMxczPSYp3fW/hWuS2eO
	 HwAiglmRlt+DEj1u6QfWuAmsj6FuXmUeJK4WB8CuJwBb2T7VtptH2cGz0YD/VxJvfntop
	 RueNBk90yZC15TokfsrPhK6zW1CQ/h4CPsNTMRIyRiJXG6CfAcZkv7K0TKg4IbqUj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvxJH7uh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43435606A326;
	Wed, 25 Nov 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvxJH7uh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478821F000CF;
	Wed, 25 Nov 2026 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615986;
	bh=kKSOc4krN6fESyzYoOBEWRPvJ8l1CU1oOEgL/+g2HI8=;
	h=Date:From:To:Cc:Subject;
	b=AvxJH7uhH9LV2GSA7b+5KUaDhZ7LA+CNne1kW9zsyxOAJ3h53k99GwGe8al0IzDdp
	 eGUv2feuX2jjzzxgumK5EuURmgvsTli1/vR+6fAVwTB/rMD8kSx6SU9Ny9B34vOToi
	 ee/CAAkYQCikbk2t4Dhthi1JBTK3kJHKytA99qAmuRvDjB7N+5Cl20vM7kQ7CNe0DA
	 J5hriUlGL2vcZcGfqc/NaoAA2MewUJRgBZiVJpNF+Q2qx174P3xHPJdSWoHJ9gIa0T
	 uRuNNc849RsjhXSEqyyBkYhEzSIaccEhLGDiYJMYVEQmqPBiWp0b4wn0EJ3AuGeuN2
	 CnH0UI06dwRZg==
Date: Wed, 25 Nov 2026 14:13:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbs7isbRjiWZZJP@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="RizzzCsZvk8rCdM9"
Content-Disposition: inline


--RizzzCsZvk8rCdM9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  1b50bbc3419c4 ("arm64: dts: imx95-aquila: fix vdev buffer reserved memory node name")

Fixes tag

  Fixes: d5c082ba23db ("arm64: dts: add Aquila iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--RizzzCsZvk8rCdM9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7O4ACgkQJNaLcl1U
h9CEbAf9HVDaXXCUU+0nEHKalAApKwVp/o3NDiz6xrajJkoBmn5wGvCKvVGJ8WSE
pXGQZ4YqHqce57UfceDF+sAMTdAXOGoVXKSG5ihTwFHNJdh/u3ufNCKPtZUkUdn3
1riGrYC5SOUtxEbJZ2Qtc/GOY2/qdkNecAw8QG8hMEHoHADEASbWGCrU7jXqrKqY
8Pfu676EzwjTVqYIZiSBfTMWI6+HcPDtFghGdps46us5uTrMcAVr5G9aQ8Bzmy99
c+tjges7TzjQicAGCTs/ex0BxUSESEIEv4ZfgJwtPoDiwZmYMQ5lvFPlWCkyLxbk
WkVLQcckmjm+jtyPmNHL/SHTMMQrZg==
=z4d6
-----END PGP SIGNATURE-----

--RizzzCsZvk8rCdM9--
