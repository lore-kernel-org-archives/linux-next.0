Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D12DA76A;
	Fri, 31 Jul 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508401; cv=none; b=KLeVptccn7JFgzEV41vkf2wRXlmX+qmF8JlAREHDUWBxKw+3rnAAo36i/bjaZFRQk4XXvoZaCQ1PpLtB7LT41u3m9DLpT2fhDGtAYJ8i2RqixeeZG+Qx+kmP+ifSRHQlve+u3BKdg85zn3Ep+0JqyLlsay72DRalr5NS7CFXQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508401; c=relaxed/simple;
	bh=Z5QmVVD1Mz4pEYgSVfsUYFdcv8SpDdmSM6T6zhz0nrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saTsR3Cajr39EK165mTa9f8TiBk/j1eLWFDR23ja1t/Uiga0J76NWELW87Tg79WVGnqvqeaVjBGN4/2Amqcvw3gsIfwG9bvS9u5lh2rPnfjpJpiyVQlGVV122Co9e9mnGnhklD94UVtWQtX7BAsz18dxbQJsHxuP3SFT6mL02qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ytk3thj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ytk3thj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B981F000E9;
	Fri, 31 Jul 2026 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785508400;
	bh=/jNQ6Oq0OoROvafuTDWBeireuGNySpjk3RDxOANM2fY=;
	h=Date:From:To:Cc:Subject;
	b=Ytk3thj5mZrLGdrZGl1nKgaTikSp2jTVZieWTJMZFOhjpPnsTg4f2Q93GjxAXZEBf
	 VJJaj0yLo0AAJXDuqvaBPxJHwAnqdqvpqFCr1LGevinJuUc3BJsgppe+nqHm+VuZ5x
	 Pf3bpaweDBV1MYjWvsm311Ax8sXSjtblgBFkRrMHqqfD/w7t04bN/zJbG1LBtKmNEG
	 QZ5pHZbMunngUcCAtBcR8FTvJ/M1eVq66KPPH4v0zu50hfcL4HBr0fyaCzAK1Twdz8
	 s6AFFudq8V8F2o7ot92XvQRlVhQ0V9HtrjnUvKdxS8CNeOYukcX8ni13U89vCzo2hw
	 CD4H5p+An2cnA==
Date: Fri, 31 Jul 2026 15:33:16 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the paulmck tree with the tip tree
Message-ID: <amyyLKFqzpkn4BQT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9xvjzs+3k37XvK2"
Content-Disposition: inline


--d9xvjzs+3k37XvK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the paulmck tree got a conflict in:

  include/linux/hrtimer.h

between commits:

  d3dc7fabd4c4a ("hrtimer: Move hrtimer_callback_running() to hrtimer_bases=
=2Eh")
  a116c7582d7f7 ("hrtimer: Move hrtimer_update_function() to hrtimer.c")

=66rom the tip tree and commit:

  07abbb755f8e3 ("hrtimer: Apply READ_ONCE() to lockless base->running load=
s")

=66rom the paulmck tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

This only resolves the conflict, the READ_ONCE() got dropped.

diff --cc include/linux/hrtimer.h
index 29072d89e5cb3,b8636e81ca005..0000000000000
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h

--d9xvjzs+3k37XvK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpssisACgkQJNaLcl1U
h9DGewf/XUXmJlybFE28vfRyCXTdizHdbpdV1n7tZwH1u48NU78MK0viTdlQzYV5
TUjDBeQxb2RI56wSe4aqj2HMCnjBgKdN/A5Ro51KcE6AtgCtSNylKYiWg6tP8wIx
yg3Tr+EpSyQIKccOWuJzgSI8lEeKWBonBS3fbIadSWLd6HX1Z1mh6ILgt0dWjVTE
oMN5/LU9GND0VzJu5cFpJuFTanWtdnwZHH6x7ge7WUO4UdFtmBq1sIJy/TzBDD2z
2AVzVN7Hf8S1qJ+b9vwIT3yCKsOvQMJMHZMZgIqFyDYTxeGugcR2dTSZluwacBmR
tx7IC70OXZykss43TuMQ3jhw+8xhiA==
=hW8P
-----END PGP SIGNATURE-----

--d9xvjzs+3k37XvK2--
