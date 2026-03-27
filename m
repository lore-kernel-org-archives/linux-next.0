Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE430B529;
	Fri, 27 Mar 2026 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774648869; cv=none; b=JEQnyXK1f4Uu8t3R/BKQ13usfWSTheH1ePXyeBuCcpTUTsRx/x2nlYChbiKO2nm+KYl/RHfg6kAmoEhe8Co2Qym/tKRMbflNcaMzswjRgF5s9pJXbjcbxmdgr7UEEtsYY/02KFa/eWdWyiHHG54VJDGvfao0AQV3mo84t6hjcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774648869; c=relaxed/simple;
	bh=A49pom3R3RRDqriv+FyTX+jUa/eRkX6ldOu+/WQqPYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b65ZX7yYZhKq2sO5NI2Tacmgg0AkL7AeWyypcSP/jogM8KnnCxIP5VcvDEmGlHySvd6Hi/KLlPTL4sM4kWwLyYfSicIv0gxhUUV/OzHD+Z1Q++VIMGKOABlq2QzeVmJBRBXqeFicKgEoHT7VBftmy+nwxbBkLq4Bi/kB6ONDc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe1yDhge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe1yDhge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BC3C2BCB1;
	Fri, 27 Mar 2026 22:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774648869;
	bh=A49pom3R3RRDqriv+FyTX+jUa/eRkX6ldOu+/WQqPYk=;
	h=Date:From:To:Cc:Subject:From;
	b=oe1yDhgepxpMWqt4wVw62mPjfjVHol3lhYEuNDTJS7eFEvbjwG48rfRuAh70bHlUb
	 m5l84rWMwwnVOf1CaqVWa+APLlTVrR6Iv3HegjGrErKrgy1mM50tQN92yGI+Olced3
	 r8qau2i5CexYZW37if+pCTsc+I6lkskCphNHQ1xmIxyAp9Ht/75UgDQA5HXyUNv7Kc
	 E6mZvIw4DSgEfCXDQAlgOLtZALVX00+kMFBRbxwJ06DTVk0PNRKX+WDQn7tCqIP1O2
	 dYpiHvurXJyH7rtaWtofd6gIIT7ITViRhG63lQZ2DquVRJR+aJ/QasOpvLSNiM0jj1
	 jArWtVre70xQA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 929F01AC589B; Fri, 27 Mar 2026 22:01:06 +0000 (GMT)
Date: Fri, 27 Mar 2026 22:01:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
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
	protocol="application/pgp-signature"; boundary="eFIpdl2HSMZjUrW3"
Content-Disposition: inline


--eFIpdl2HSMZjUrW3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kthread tree, today's linux-next build (i386
defconfig) failed like this:

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

--eFIpdl2HSMZjUrW3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG/iEACgkQJNaLcl1U
h9CC9gf/WQCO3FtIEB6H8JfJcLZrfUqMZx64ER1c11T1meEvXB5J88wNU1GqFsdI
rYvWyn0QpHe6lpM16xHOKbG+UEe7sfLI/DOSYtMmokLyMtVbwJFs1OzremO+eORI
3zs7whH4Ni4V8uKmLVCBaFr6ziDLhD6TzgEcpWd/DzkFNK080Xn41YhVV0nnONRI
LzWgl1iGSoTZMHoLyXh+GpGDpvXLulQC4FhEfBJMLnRmhSPmplHVSjN8sj+zQ06X
4RUE6S4D7KeGG5LyAlN0xfNIr0kiJC65BLUUGI1zO/Z8k4bk9nogRaPN/crwn39W
R1qli3a4bD4nSSQUx9XvB8O2InFHKA==
=pup1
-----END PGP SIGNATURE-----

--eFIpdl2HSMZjUrW3--
