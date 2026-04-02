Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52932C94B;
	Thu,  2 Apr 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129703; cv=none; b=duzEpSixzoWOvLzZKbGfIQqI5RpdlsSmy8dnrVZmL+v7b5log7CJ9/VubNvMy6G6qldVeeZvUsjW1YFh7//acsVvUyWxFr4mg3C6qBt0jQnHRpuKnZ7UBjNPDp6uSfe3spECfJWsQH7Cn1rboAr6JYDnHUyz7368hLrUa/JNX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129703; c=relaxed/simple;
	bh=BNK/HQM4cIneCDWMrxLAhSb7FcqkdYiudT1PxFKpFIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSSw/pwao6hz9K14SWAWhMIG8jeBtD6GOoIKnpk3Uk7R44li4dAcoQhazlBNgv3g751vd+//U/0pTB89p5s0D1yuiJtZbbxbyMi3AE/3OekC8y1zZ2jxrJSQ810PBisfGJXUU+RwCdi9VzbpiJlqLSn2Q/vUZCoMp1YeYsIBc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXZA+Rjp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXZA+Rjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5EAC116C6;
	Thu,  2 Apr 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775129702;
	bh=BNK/HQM4cIneCDWMrxLAhSb7FcqkdYiudT1PxFKpFIo=;
	h=Date:From:To:Cc:Subject:From;
	b=jXZA+RjpLOKwjGEhg3GRjpklX3JnQXyelHeZoxR5AnNxTSCAUBxX5nRfK0V0wGs1K
	 5Mtp5XlSgKwm8vSQjhM5tKX9FZCkVjJoBifz+GOZC32/l1Ar80BnrQeN+dRd/tJFf0
	 eIM0Zqcbyw6C07sHvgxaMNRt+W4lJkWf0YPU60BvIQg1AgwmL9vYCkUGKuBixps+Y2
	 27KrP/Kj8QXMe3OnO1c61EMwYz45/8J7ccNnr1bk92li6BefAXjktAZZHpUsEx+3dD
	 44ra9XK6dPHnshZEpU9r1R45aqBU3aJZAa9GABn6Qj8avYowCQWQXVPEV8OIbHz/iH
	 Lsz86v/w/Xi3g==
Date: Thu, 2 Apr 2026 12:34:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the block tree
Message-ID: <ac5UYwbVneKIyfAE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CkYTYd1i+25TxDIM"
Content-Disposition: inline


--CkYTYd1i+25TxDIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  5c34e65e5678f ("io_uring/zcrx: don't clear not allocated niovs")

Fixes tag

  Fixes: 8c0cab0b7bf76 ("always dma map in advance")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--CkYTYd1i+25TxDIM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOVGIACgkQJNaLcl1U
h9CAuwf+LcOCmYwGc86+SjfgXklwt5Tm1QwqkKdx1RNtrNJjup772cA/6+Eunu/g
qIkf/eLIXrkI9eErUJHPh0zDTJYtn9mNa6LQg8Gepje1I4acb5DY7cN2xvf/rMFP
Whrwnj7Dewx/XAJEukVkT1cXAIXVUk4Ibo53JfVF6mzEPBTgI3IT5xN7m4no+tyP
8hP9o9ettw++O/JKY8udIxYFmut39uJWHU2IbA1/t89v5owqAVC+1LYyBsNEKWYu
HjbwIN3jno3arkGvR7hXHlAZO4XKtZ+Q8koMJtfSs5RTeWKTXKWqebkGLCD3DrSq
aNu8GPC/c/SfvxQ3Zs9kyOcMlpKwTQ==
=EWKt
-----END PGP SIGNATURE-----

--CkYTYd1i+25TxDIM--
