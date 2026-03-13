Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0027456;
	Fri, 13 Mar 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406847; cv=none; b=Q2viciJim1qGfI1PRE1lrXqE3veoaF/m/DvB+rW8Tq7oz4wR9XOKz7McZDwTKJHybBCQeWiyoZXSKgrOeqI6XICNwqaLPxB5Qe7bAsdm2U0pgDPulFXUHjZt3Hy+4k7gFZvvEJSRjHcVlhB/28JbnLziwTxm+jJJqQKHvWgYydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406847; c=relaxed/simple;
	bh=tK0Z2UT7cJVTr2B38PhoDr1oX8knsT8iMZX6S2dxC0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHoPmAhDwuMJZgnw42HNaaw3EMeOxOU86EiF4pBJvgJ/AXEaMeG2G6pRTXgJEK2E2L9zY5RJf3aHwMeEE1+XL4Spo67kZvRDRuZunx3RcdmdZQckeIfRTEnPThI8I3thhnSteGNJVEZkekaHGEu+9b7WzGC/2TMojdaN2HuILeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YulAfswj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YulAfswj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBE4C19421;
	Fri, 13 Mar 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773406846;
	bh=tK0Z2UT7cJVTr2B38PhoDr1oX8knsT8iMZX6S2dxC0g=;
	h=Date:From:To:Cc:Subject:From;
	b=YulAfswjd134vBzONQJO8xQg8KHvYAhPR1QpUrZKb/IVR0/8AkxjeNon5d8Ta2h+u
	 Bh+00Uz8mS8qkZs+xMp3aySaBIfIxe3hYZMIoIVjULDE795tab15pCzzLEboR40RNC
	 /fGf8Sk1vcH0Daw7QNgOuTUNu2khGpr9F+E0CBktv4SXMkETB3Dsz2Orz5OSHU1sdK
	 LvNd+t9IjOHUcOunRiR5bK+RuA86iNJBkZMcZ4vP7N4xv+4+YBn8vvGRky7863V7c7
	 tlc6euUBaC91HiELLttLK33t6P7MBvqDQHyWrVzb57jvPbt656AthvMW7JxMufMjXM
	 O1O4XfK/T8sRw==
Date: Fri, 13 Mar 2026 13:00:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <abQKe58fc13oRFfB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r85edfuF9zs7vVTN"
Content-Disposition: inline


--r85edfuF9zs7vVTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm64
kselftest) failed like this:

  CC       statmount_test_ns
statmount_test_ns.c:37:19: error: static declaration of 'wait_for_pid' follows non-static declaration
   37 | static inline int wait_for_pid(pid_t pid)
      |                   ^~~~~~~~~~~~
In file included from statmount_test_ns.c:17:
../utils.h:47:12: note: previous declaration of 'wait_for_pid' with type 'int(pid_t)' {aka 'int(int)'}
   47 | extern int wait_for_pid(pid_t pid);
      |            ^~~~~~~~~~~~
make[1]: *** [../../lib.mk:225: /tmp/next/arm6

Caused by commit

  32f54f2bbccfd (selftests/filesystems: add tests for empty mount namespaces)

I have used the version from next-20260312 instead.

--r85edfuF9zs7vVTN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0CnoACgkQJNaLcl1U
h9Cm4gf/ZSsIsx8Ah7cGUPmtG8zxMSwdD02m/SE/0SgnJmNcZyf82EN6UVhNN5H0
/8x9cscgQ8CdD+6AdneI61dMh9K/X7/4BX/lPFIe6dMfAE8iZXCtGpwNbGn2nr6B
zjVrO+Orz9g1i529dsSRqzNbLIu8RFnJBm/XMZZA48Ja/fz6wltpzym9CDIjvpYe
dG7l8zp/q6rrvZZduyZsdl7r9rBaZq0nVeFxb8WrckiE5nlRzsnULSb3bRPJFS/U
AzZm+7Q6Ebdczn5JbBxwlKFc6fZhykxyT+QgVldGU9LGo58NPgrfc46zkwai1TjX
XaK8tC/deEuqs9ebiZM9LUsMV2e4Sg==
=PwJf
-----END PGP SIGNATURE-----

--r85edfuF9zs7vVTN--
