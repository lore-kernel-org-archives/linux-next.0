Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D433F8B4;
	Wed, 15 Apr 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247928; cv=none; b=biqDo9wkCZFAzQw11lL76cdBBRr2DKzWCZayNO027e5T7gjV5gd/kylrjymq676/dkxiS2EV4H+ARUZ3XByoRLFS6y3Lutj23730mOsGM9KAb7EHqsPRoWRU5Yd0fGI0XoMBq/8ggBjT0mKCXKGlB9/L9oCESpyddMcw1Gvv8KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247928; c=relaxed/simple;
	bh=Mj/JMT8mbBDFdvUlotxUa4gZpVtTrwOSPwpLJAOVeA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOpV0ewJ8V3qzjm8ZYp2k+xpZ73BJ8/BgCdBS3Z+ddDeE+Zog7InorPvPnAxh/Pj8rHSOv7eHpRci7w2LQE07ozFrz6DeLLldCzwryO/WKhnPYCrzH3NrWNbK+8kbktYaUBlL47D+EAsohC0aoEgpkE80ieqKy+1/TNeOn7glzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODdgcmhV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODdgcmhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676A4C19424;
	Wed, 15 Apr 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776247927;
	bh=Mj/JMT8mbBDFdvUlotxUa4gZpVtTrwOSPwpLJAOVeA8=;
	h=Date:From:To:Cc:Subject:From;
	b=ODdgcmhV1xG0clJaqrWigBg8nF///AGdV/M4jY9AYRgEZu/XaMtMNEvokrc49xPc3
	 nldc5b5gRAVHGn+aRmYlzLdw0bLf4LV4SWEbt7NPgQLUuMLGFdadmCxqAm1fwtvINe
	 XuZMim6nM7LTcHnxnVyGD/RPZphgDyUXeGAbbpj/3YEuctRDRCKCwlkuOWPC6Mq1Cb
	 1rflQJPRAisXC1xDzWCowYF5gWQ56ZBThVDwZHebhuFW0Asr1YP2hT7OowPHegtv9L
	 GDgR1v3LJCJcrlRyfFSTz1xXucRTnO9P1ZWLGoL/9ynLf8YH1XrJdQ92rLNKTAqvmy
	 dXGmkqUFWbCyg==
Date: Wed, 15 Apr 2026 11:12:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the perf tree
Message-ID: <ad9kc24cz9mhPXWJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="62pPmpOPApo4tDtu"
Content-Disposition: inline


--62pPmpOPApo4tDtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  841dbf4871c57 ("perf loongarch: Fix build failure with CONFIG_LIBDW_DWARF_UNWIND")

Fixes tag

  Fixes: e62fae9d9e8 ("perf unwind-libdw: Fix a cross-arch unwinding bug")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--62pPmpOPApo4tDtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfZHIACgkQJNaLcl1U
h9Dz4Qf+LIGZu6J1p5okrBKRNFCJ1ojFC1R2p36nC4Yl3VbTVyqE7bty69nIcEom
SHfGE9kuT1iH3PQZm7rdD9kr4w35jHfqtP/Nfpm0qGoiyBjjzfsWsnXVHOmJ2Epf
OeJN/0+DO2r3y2rzSRqdi44qXsgS7XOFJdYwvRACTR0GzZMaZVpndYL5rOWkeQ2K
idIhIQ/qdu52dlIZ6/18YGdHXJYbh62W7/t1crRJ3KQKkp2czBOOdFfdMZ+8HI9F
rbQDnA0FqtP/l/j/2cGqrCrEJIQAvw3a7c6AX0Mar+HaREnaRdCF39Q7T/XxZhuj
UaEQoE4KgcgkM57TJaRlVy+UYuflbg==
=jJ+5
-----END PGP SIGNATURE-----

--62pPmpOPApo4tDtu--
