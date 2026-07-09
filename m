Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E62FFF8F;
	Thu,  9 Jul 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600444; cv=none; b=VjHKu6Ofw39Ohd2i/7s6VKvW78lzmnRt8XZO5VwKkNoqLU7UsCTJGky/km6God6Yrkaku0pZ5BXrnvFqU+yNg2T7uWDO+h4lmUEWMIG7NMN0Pb65rsP9hUGngadE+CwPjDDMSjG7fUcYBm/8xuBNnCozf/4UgtU11emYz3OxivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600444; c=relaxed/simple;
	bh=2yt0lwnG2PonhqMB5JESofxhHegNhh2vlEmWtf95L9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNSeVTKMdmvB0LeZQr2Jb3zJxaCK2poXScDv9Uu0MRSfStJbyA6ejZj5jFHecK1r+d0AQ82db2aY3u+RjmRzk/9BBGjZXenFQnmfWBb7qKu7T7G2zn6lu+fgAKUMxRRUqiiSjZ/UWVtFmQ1zvdrNyF+a/ZLqslODfwtWFiGi0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D88pQCAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D88pQCAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8131F000E9;
	Thu,  9 Jul 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600443;
	bh=W+VfMDXcT300PO5wmmxjs9nownfXppz8GMew042oIXc=;
	h=Date:From:To:Cc:Subject;
	b=D88pQCAzWMOan7NLYoNnTxc/ff7TbTGhm/tY54iYkmTrKV3mg3y35bor700iTdYa0
	 ukZntPPgIRWF4vyJoIMm+lE6IZwWkBqap43+uE1DrUMJ3lB3Xu5JcsZushvyDTnVZ+
	 DxnawK0fPgnXWcuIYE7mFxiY1LfEu00TxCKB6W6PlcsB/zkERZn20f9GOK0V4GD86a
	 6OKHoqzVvCB+p23w13+p0sjPQEHbLZZ9ngMQJM8MZ6raxbrLghz7/A4b7UDPAjBIwU
	 +cJGMDvNjznNb8dZPZcqTZGvKmHXdeWZCyJOJAkwAyHYdDlruB+KFtALC2KeXWLQqI
	 YZM27ogPLd0kg==
Date: Thu, 9 Jul 2026 13:33:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the tip tree
Message-ID: <ak-VNx9rQIEeCXji@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uSlF6GiX+mcZvQHG"
Content-Disposition: inline


--uSlF6GiX+mcZvQHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  b80ddec4ca74f ("irqchip/qcom-pdc: Fix kernel doc for qcom_pdc_gic_secondary_set_type()")

is missing a Signed-off-by from its author

--uSlF6GiX+mcZvQHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlTYACgkQJNaLcl1U
h9Daugf/SgepjJVJtKJbWLWhF3VOZ2z5Zx7gR2TWey/V3aYc98icwkUZO8yd6ebu
JdItW5+nK6aNIWOgBKxz5fiPnzSMpnCHUkxoS5w5+BJQLAOuL57cj0bbUQ/PYn8C
pl6YA8oxFvyI9s0IcNoy/S4hrpS095Fwk3n8XQb4fVevc7eZlGHtHNBZPMe80XoG
j9KLkufbZCtonjhqjyiFol9Z4S6p3tq/NyQmGP+657bMA4EgFrxi0rByl02prmKK
qRxVUWbZCVJBA2Yx73ieqof1bKPO9VV9fFD9Qu7r6S8WQLP3TpINW48MxK6gfcqp
iNLbTsef+DePsqW64JDsqsgk/0hA5g==
=n3Sw
-----END PGP SIGNATURE-----

--uSlF6GiX+mcZvQHG--
