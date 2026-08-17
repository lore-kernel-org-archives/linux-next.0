Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA23EAC74;
	Mon, 17 Aug 2026 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975651; cv=none; b=gnIFP2TtJasnyJcH4q/dZBWYtPeOZQuZyuXSa1gIEtLc3Y+690fVDFP1tmzQ0MBA7THoVEH2X8Q6iC34HucQ++i2X/MU7ulhdaGLJGvQraOZ6Q/opZf6GYvYoIMpiUc7NykfsBoaoh9tzyvm3GDzOrOIOlrA2EJD0Yk8kQ7tfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975651; c=relaxed/simple;
	bh=8J2pwyslpjvORHAvoPzw+yHaOYhOvuW5WeTThlq6778=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjdGFSLA67uJ3/SFXySodEarpOkFMTeFj9j0T4A8cHqLVpsVpIhuwt4YnFyGDzTfuR77Fq451IwbZ25T/TtPDWZw1qVRcUygX9mcs9Xe4GI4D1HA3FuiZCy70k5jErJDNF3EAQZL4e8BQU93+oit6bBlLbb3RzRwCctJWxD4D2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxpTkSeT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxpTkSeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E473A1F00A3A;
	Mon, 17 Aug 2026 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975649;
	bh=8J2pwyslpjvORHAvoPzw+yHaOYhOvuW5WeTThlq6778=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxpTkSeTo48RMfz5rOPvcZfEYUqBEqesTf6fpHJwbDbpX+sgDmcgBEJa9+9g8QUQ7
	 DzdVh9w48elyvt5T0S4ImqID/VeyDt39po110b07J7MCIyXzg1oEQrZ1yhgrs77JJS
	 l8fVvEo2qTNcJy2MAezLxurDFCjIH82/QkM4j6M1E2TcWVglYncQjtanYPs5g9/8bz
	 FhpyRGOyH3xKWVcUwvJYQhhPDdPISNhD7owLoCayRGBcu6cUsck6p3UlVwMLsMTJWl
	 gwfRao41Iu461NtuyAqj6yiC33c/fFtZuVCrAH3vKIoMTgdENjRzjH43T1rJhzORyn
	 20KdZsmR2Nszg==
Date: Mon, 17 Aug 2026 15:07:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>
Subject: Re: Missing signoff in the block tree
Message-ID: <70dfdef3-7d3a-4c46-8027-35baa5310625@sirena.org.uk>
References: <aoMBWuoLh1bAEUYU@sirena.org.uk>
 <93c7c45a-09c7-413d-b83b-beab1d3a3a38@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="reYZOccyihF3q5IK"
Content-Disposition: inline
In-Reply-To: <93c7c45a-09c7-413d-b83b-beab1d3a3a38@kernel.dk>
X-Cookie: Obey all traffic laws.


--reYZOccyihF3q5IK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 08:03:34AM -0600, Jens Axboe wrote:
> On 8/17/26 6:40 AM, Mark Brown wrote:

> > are missing a Signed-off-by from their committers

> Keith, fix your scripts...

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git/

might be useful.

--reYZOccyihF3q5IK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDFZ0ACgkQJNaLcl1U
h9DFYwf+POLu5kLQ642faAdl06k33BMD1M31lmkAv9z48TJHS4oia816sobAMO+E
BsrMjIGnA1PWV3yElmWwPZ4/4CQFAoc5y5QLS9T9aRjLzU1bnXff4l//JhoVG3/6
7SFAWznmHCl1Yex0BlUocWoRfsRqllGNMEq0757tAQMEEa1oqzicGqxEynxZseGI
BMlSJ76GRhmdIDbV44M/f2vj1zPxb0jZFXGsiSADkuMBBw/QTcZXNtgnE5wv2RXq
rhXf3NlchdhMWNKt4WG9pj5UJWJX23cIoG8jZYWCJA9qrW0iOHdd2KGgw20ruuz2
iq1g8+zpcE+U1wXYoN4T9r/Bq1zyzg==
=XXQT
-----END PGP SIGNATURE-----

--reYZOccyihF3q5IK--
