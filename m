Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94B395DBD;
	Mon,  9 Mar 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054638; cv=none; b=fvUbVHrmEE1jLqkVXmEUCKwlzTOCAib0mxKvCdKEfi5HRSxMeXFnCUgTpKxsIOfTBhw4UiX8lTYQ16geChd4m9XWoQQm24XY5NbNfx2a3CEwtxc6X8wLVoyYVJ6pYE3jR+5kzWG5h706jsP0EgZNQtasBUAjIly9pSSDHjwfTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054638; c=relaxed/simple;
	bh=2Z6P5u/hvxCYVjB2JMkqEmxrwYaQzkMGprH6KMAwaAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T93o/GqE/Y7aWX87chXTfdNfSPTxUjEdCRufCaOL4vWZNnfJpssuZZO/3F/X5x3YXVx6JslfvQ4rRIi3yDcz6EurmTVypMuAl/YVBPaXKtBbMUUHfqAJ5d3PALdiZDJlqq1GyPyJldHYYE+E5V9kd1xwYkwwPLo4m1fn+V8870o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqF75EnN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqF75EnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2612BC4CEF7;
	Mon,  9 Mar 2026 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773054638;
	bh=2Z6P5u/hvxCYVjB2JMkqEmxrwYaQzkMGprH6KMAwaAk=;
	h=Date:From:To:Cc:Subject:From;
	b=cqF75EnNIS+yApY87erNt4WZDO6btWgHeOdZUktuPnlG8+mwBOv7hv0jBPjEe7laS
	 8Kbov9RBrognSdTa/jXJb7Sm/MSXfPObV5EevZ2sOgB/5eJaNUzhckHO5uzQ8AqdWE
	 Yi9H2zuns4aCgGgvYv2Ds+XzkXh9aFp06dLKASSdiy+HmMKyGp+yWCwlMuqaT0c3Cw
	 9dIimx4byMxX6Xmbqz9qdtWlUa8GWU6LgDRAjVGWzHLdyDZWJPBN8qhEC3KOV3MfZ3
	 8F9n48hL2PAJxtRtFOIeciEB9gq0XjORDxrAtY4z71OMZ8DUz1a/6xGh8bLcxRQUUy
	 l/CKa04wSYeMw==
Date: Mon, 9 Mar 2026 11:10:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <aa6qqi-GmXZXxubE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ubcCwsrn5U9VqvNT"
Content-Disposition: inline


--ubcCwsrn5U9VqvNT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  eb15cffa15201 ("RDMA/bnxt_re: Support application specific CQs")
  485a21c14b413 ("RDMA/bnxt_re: Separate kernel and user CQ creation paths")
  9ed273bbe6637 ("RDMA/bnxt_re: Refactor bnxt_re_create_cq()")
  0edac801a2693 ("RDMA/bnxt_re: Support doorbell extensions")
  4e99362444a2f ("RDMA/bnxt_re: Refactor bnxt_qplib_create_qp() function")
  f0579e330b773 ("RDMA/bnxt_re: Move the UAPI methods to a dedicated file")
  9db6a217ba5dd ("RDMA: Add IB_UVERBS_CORE_SUPPORT_ROBUST_UDATA")
  ce150a8376e1e ("RDMA/bnxt_re: Use ib_respond_empty_udata()")
  d59f007207b39 ("RDMA/bnxt_re: Use ib_respond_udata()")
  ac4bb15208d1f ("RDMA/bnxt_re: Add missing comp_mask validation")
  12c73bee53133 ("RDMA/bnxt_re: Add compatibility checks to the uapi path for no data")
  ac593f5b66c9d ("RDMA/bnxt_re: Add compatibility checks to the uapi path")
  6df3a6414d736 ("RDMA: Provide documentation about the uABI compatibility rules")
  42d2a291ef474 ("RDMA: Add ib_is_udata_in_empty()")
  f1cac281b4245 ("RDMA: Add ib_respond_udata()")
  4ac738c6a7b90 ("RDMA: Add ib_copy_validate_udata_in_cm()")
  715eccd4798ec ("RDMA: Add ib_copy_validate_udata_in()")
  ea08d8cb8b520 ("RDMA/core: Add rdma_udata_to_dev()")
  8e886928a19d7 ("RDMA: Use copy_struct_from_user() instead of open coding")

are missing a Signed-off-by from their committers

--ubcCwsrn5U9VqvNT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmuqqkACgkQJNaLcl1U
h9D1fgf/TCSkfX/RsDbAgiyih7atGVeMRMoMZvELHEU12Tp5P1DlMrTIyzmjDgwk
Zy5kYPhc4JhvDOEUbDrh7z0AkBmSRYd0i6OcbYjq4A3gUkCyxPwIi257gRnXjUTe
fZbF5+QqDe51zksc1HD4Th9elDEaT2kUg8CQt1g753YnR1d0mxIKaEIVt6fIQj0D
bpWFEVjDuGGdcEY61YNYA+SC5j5SzciBRXgHI9j+V/VJglOyLcltEDYNTvl2vwz8
1DB1xCB+b5TakP4Mwuk9UuNLSsUwBnl0csraLoSsBK7BzF1csDBZhfXQSqbUg6id
Pq/EshCnGrveqt5eUPU08RVWEEdXwA==
=L79I
-----END PGP SIGNATURE-----

--ubcCwsrn5U9VqvNT--
