Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09F3ECBD4;
	Tue, 14 Apr 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184108; cv=none; b=q5HH4ILVqv59Y8GsM+8MyZqCCwrFG+Y+BNO1A4F4lLhNBKgX5aEP84KK5Fe1MixSL3K9VTutOwOTaprOjOIAPfxz+T/SEqaGpXOAlPrO/+VPpHjfmWOEvgzlw2++6JrDV7mTgh1VGq/9ImFrwC3k1jJrEZTgzuEsKYN077MADYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184108; c=relaxed/simple;
	bh=YiTPhlPIUYGQJGJyKYl7ezRR9Glb3xw6iYq848nT3Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaQ+G/3afkIX+FPyRVM8iwNFWp2nT5+1/UsGpduMxWqVIyEvvGidOjwzgLNhlypZM65Lj6TmINyf+x7YbHLYEioCO/prz0D5yUgLE9IC3cRy6u89U3P3LRHwsFkRSOwuruDh+3Tg8vl7OSW82NNIgZbIf1vNQ5G/Z1fjPWBsk9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLz+nSkq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLz+nSkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5869FC2BCB6;
	Tue, 14 Apr 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184108;
	bh=YiTPhlPIUYGQJGJyKYl7ezRR9Glb3xw6iYq848nT3Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLz+nSkq2tFTbgR1DaANkbKZbbXJW5EuOXuvTtrk15fRuD8jLM01FKSQ5JWSvoxrR
	 GOGFx9por2/n2Cs8HX5Me2CF1192AHjVqe4QL3sN0JhF9Zsf40iZuIkStqd0MKIpsI
	 nA6jKXwGBJS8I/C15JcV+fkYuVF8QBP9b62ki/oEcQBC61OI2qrD+L8m+r2DnAaKzR
	 iMDb9YpS0NljSd6y46/Ug15sNO/M0B9gqb9pVLXabJ6puqworHOcCQVBbjXCs5+pWb
	 rHnGCjINOcoId8AWtFjWuyXY5QYpoKXxVULwjeA1mugDqlx5OQqTKIBpbabVq9c16e
	 4qhO8reDFmPwQ==
Date: Tue, 14 Apr 2026 17:28:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <b9305a33-cbe0-4904-a797-2e11ff8d3b3d@sirena.org.uk>
References: <aarBm-e3NUl9XnY8@sirena.org.uk>
 <ad5CXXdkBnr1etqT@baldur>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KymhOsmhXDUoX4bK"
Content-Disposition: inline
In-Reply-To: <ad5CXXdkBnr1etqT@baldur>
X-Cookie: Academicians care, that's who.


--KymhOsmhXDUoX4bK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2026 at 08:41:24AM -0500, Bjorn Andersson wrote:

> It looks like Mathieu rebased across the two commits and hence ended up
> as committer. Fixing it would imply rebasing a bunch of commits, in
> which I would have to add my s-o-b to patches applied by Mathieu.

> I'd suggest that we ignore the issue this time. Let me know if you think
> otherwise.

That's a question for Linus not me.

--KymhOsmhXDUoX4bK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneaygACgkQJNaLcl1U
h9A4dwf9EEHD/ZeBrROdRhlVcR7Hqbj3knS6o1YyDhp6V8ihM1qnruj9VFy0Wri+
SCcJk9xSMy2VFQCMls/9ZzULTL5w8trg9qefA7iuW6oyf/ILJBq4uyjWAXcrYkkl
6Lwa6HcJPV9H74N4wCII0M+ba8Red8gQSZgKkCDz4PxG9DDBCJrTuSVpgY8Phblf
EKDnzG3SgTP68vbxRcnZkJRdzRaaOsQPArrdH1Q3HIQ216tKom7JlUzsj+2U99QR
1f/PiGqcrCguvG5lkVvbFuoIAc65giK4fefDO/145VVOnvcS1QrzYUQz8/VyTqcC
xOSUt1t5xwGfeLzsWgLriD71PapBNg==
=K0bi
-----END PGP SIGNATURE-----

--KymhOsmhXDUoX4bK--
