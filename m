Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1723FC5B1;
	Mon, 29 Jun 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732102; cv=none; b=lzSYOBf7RWeelaRLeSMB4RfwuGzTV83Q07OpRpZ2npNgeZqqiCjhVZ8xDS2DOB4c17DdiB8llGlIL7muJnGM5BpY1VbHDaIc/OnH0DVj+M8D0hMmaOUodFITesloQg75oj/42z299bpXMSZK1aDYPj4DNXO6O+nzSUPPU+R611Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732102; c=relaxed/simple;
	bh=eq74A56QTb6kqP9u/S625MWswM2oqw+YpIxDNcei7bM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bi8K3DgdHV5IxNfNSoZxgUpt4gzj9t6aQjwb6/65PW4PegVH+KuFsv3hstsnD955Y4+bSEAQH3G+2sJS/Daa3e18+Kr9Va3dEGHQyY6SjeI1pEzmCDb+sfwllxlWFTxi1I3p6tUkMQxL6uwOuxcHwmgDfIPal8AoWWRg9o6lDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IThlOsM4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IThlOsM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B411F000E9;
	Mon, 29 Jun 2026 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732100;
	bh=mb9vkWaYQnC4fWqoXyOrmOX5+Sb7IuE2/S6epSgtD/E=;
	h=Date:From:To:Cc:Subject;
	b=IThlOsM4wmjfpuPFhjB6NjeS/0x9T1tSwX7Nrmg0xXBaliuVB2EuMvOMm+hsKUORt
	 tF0RSmf0bIDgBx72W17UL3HKAAxtLUfsFMg7hLg2AKbNO9r74/M2SVxTybyoMVGPUb
	 DS+YOnt9QvHc24TFU6YJdHsssET3KHXSay4B4ftMFaHZYSUwzKXrL0ZmyYSilGNhW/
	 PWY4jgZukQez7CNv8JbQ7zdm70PP5zixFbZfm2c6l6Rnpbk1VOluRelf0g/B0IvSx7
	 OrLXsm8HHfc4oqHTMBjMpb1wSttbW+2geYKQ+kednJ44MdDBVCOvpy5Ef5w1XaRzqo
	 zakaqgJG2pCMQ==
Date: Mon, 29 Jun 2026 12:21:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm-nonmm-unstable tree
Message-ID: <akJVQVgBXfl4INGo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vobepN8/NgxK0dym"
Content-Disposition: inline


--vobepN8/NgxK0dym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  2f0a90124d661 ("mm: page_ext: add count limit to page_ext_iter_next to prevent invalid PFN access")

Fixes tag

  Fixes: 9039b9096ea2 ("mm: page_owner: use new iteration API")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--vobepN8/NgxK0dym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVUAACgkQJNaLcl1U
h9B9dgf+Pcq2OXAzQukpe8amtClbYzScX/yYv9l8XGylB2zfb3u67MqpUklW2Vl5
nT16DGp69uXCkVgdRCseN9eBJlT1rxWFXXA8quIVOF5jNLT8KqevHmAoWp5pepzJ
z0jtMVuN7uLyMVzrmue/klT5htdWQO5trnx8Kxg5NgN5DrtjvWOhNYbeUKrjk17/
Ob/XM0KtwGor3NU/xGpZuJG9wLpmK1OXQlMsWUNtKqdmCiTgNIv+RNvSbRXK+p05
zH56Kn5GgFJTCr0H+o6WfSKfzt/zF5qyY3h1SXHEEBMrU1272tQchs2zZ664EX+B
0N5ZpOqZg1Ons0tC5FUGOGsYEWjpBA==
=feM2
-----END PGP SIGNATURE-----

--vobepN8/NgxK0dym--
