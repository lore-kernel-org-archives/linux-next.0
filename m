Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8A43746C;
	Mon, 13 Jul 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953752; cv=none; b=FL4qJZSTDqjQHlW0aOz/CZjdWIb16+nEav1W4bC+x4Hi1gG50X6WFfQ8iI6rxym7HDPi4SoaSYk0K5jGvtRkr2dutKPdjKwHq6ETFi9Ev+a/5jx4Ehj+SkcF0i64QbVedx+e48zwx8Attibjr8Gs8pf9xBK81B0p5XBRHnBlEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953752; c=relaxed/simple;
	bh=OX+xERQrVCbBazC4GrwrKeS662RStHhMi0aMtYnDGJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0Ur7rhOz7DicgrD1Y9+edjP84ZC2LoR70s79oH373W/6Rnhsxk5U0jpNr5P1nxumViNyACIKNd/mbM3OdH3qu1m1vIuZBIwSrF1wjIWzLZgVVInueHNSsmjQsAIpGo2pfVFHsvEzK735u0OycWy2XFvNCzMkoESJdDXU5bkKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouhGfBjE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouhGfBjE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBBE1F000E9;
	Mon, 13 Jul 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953749;
	bh=vR+6YEx2kIQDo9yuNoBrWJ589o5JNdXoxzarNnuDq1Y=;
	h=Date:From:To:Cc:Subject;
	b=ouhGfBjESSvRW3B2X69J3Z8EqfYEuEO3lr0T68UiQexgpobZ+XL1jT5z019RQ7y4Y
	 rqk11sM93vd0yk0IZyGBiQY2gwVcJMC93yuxlNeqDXJimwGxmh8/DjlDgivEjsREpx
	 EJ0JZcW2tOpSsystF4VYkTCPHjGEUeQyD3UgngMuagZAbJkvKUDg62JXrpSZWCWLtQ
	 iYbgr6cnvXZOPndseSnl5YwcpZrICRO8LyNjPozBnH5BT/AbvKhlOHnBgg1XO0AKcc
	 gwGJIUp0jf7UqPZexkijPeN37tJqKq5NIfcc3PYZCNMu9a3S8LV9YDzAC+r6PeuIHw
	 1tqGluGhnKZ9A==
Date: Mon, 13 Jul 2026 15:42:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tty tree
Message-ID: <alT5UdRqcfFmadZT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IOVFlsdyLxD6k8Bz"
Content-Disposition: inline


--IOVFlsdyLxD6k8Bz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1925:4: error:
cannot jump from this goto statement to its label
 1925 |                         goto error;
      |                         ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1916:3: error:
cannot jump from this goto statement to its label
 1916 |                 goto error;
      |                 ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1911:3: error:
cannot jump from this goto statement to its label
 1911 |                 goto error;
      |                 ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1887:3: error:
cannot jump from this goto statement to its label
 1887 |                 goto error;
      |                 ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1881:3: error:
cannot jump from this goto statement to its label
 1881 |                 goto error;
      |                 ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1872:4: error:
cannot jump from this goto statement to its label
 1872 |                         goto error;
      |                         ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1864:4: error:
cannot jump from this goto statement to its label
 1864 |                         goto error;
      |                         ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1848:3: error:
cannot jump from this goto statement to its label
 1848 |                 goto error;
      |                 ^
/tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
jump bypasses initialization of variable with __attribute__((cleanup))
 1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
      |                                                   ^
8 errors generated.

Caused by commit

  3d71f8d7eeb37 (serial: qcom-geni: remove .pm callback, use runtime PM in startup/shutdown)

I have used the tree from next-20260710 instead.

--IOVFlsdyLxD6k8Bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU+VEACgkQJNaLcl1U
h9BB8gf+KJX7n+6/NewH45bqoABqkwW0yEmUfKR3p5HNwglEH8IMar2CRMQzWWqS
/qKaYN6PDvDk5/whkhvqUJ5yZH8ZGdcuLpQ6AczR3dYuhcppPhg7Z+cq3rw34Mjp
JLA1ZDorTmSOqIuz8vxWRYDt9sFGRkruGpvHof5v94mKYZVWNyLmLCqOFZom51Gs
q3cs2Wb/LyISHxpesUyBuKjZeELXlxdmzbNnQX3sSeIIxv9nb4yU/wp/oPKRMbZH
wpH5YVa1GLS/8Cc3yUEDaGvUZjrp3gi86HNngqrGEGwSi0cA4bN/T/X3KuWWCazj
bdLaN8Eqskmv8Y2r7Ig3MnmwhfLYRA==
=S9v6
-----END PGP SIGNATURE-----

--IOVFlsdyLxD6k8Bz--
