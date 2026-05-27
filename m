Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844183E8354;
	Wed, 27 May 2026 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893715; cv=none; b=HJ0AVToikZtOG47ELJIhmfupsrLCXB07v0IPfjpNCkt+evLb9zfDpuFBPvjX7MC2CU32wCZITyoeK0+NmdEeGe3GoxXVu/Nz+pwkCwn2pgq1o6c3kNQkdNumjbpQ89/jDv3kvywOZXjFUTFxZmfRt76EXmsms+u2IZW0xAI85WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893715; c=relaxed/simple;
	bh=EfxgGApQH1gWAMa5v9UCC+t06ZtgrNzqzhSQ2slwTYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP6bKgLH++tymLdIRRikdE/w3FbHgIy3R7+wx5ryJQmCK4XYzHcuBCr1ooHpGwXqN3RcMgOav0xmWB4rNBTiYsd7B2HLESTL6Zl8UanbY3J0GVz1YQJIyrlVZw81ydzU50yC50q5JXCHb4GWRuCxv0wyr0XmtnQ+4e5FmllTIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRgW0iaS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRgW0iaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D621F000E9;
	Wed, 27 May 2026 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893714;
	bh=/NHQQ19B7OvzwEOiVWJzlzaWxCvQnjhNy/B4qsCMWjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NRgW0iaSF6pVtY1uZUeVcnaOFkDx5GT3mTrhFt/LVwoPyTjgDXNJx5tBzSTZ8XxsV
	 5V4xDMl7F7P6q+eO5D0XsfC05QZdQD+4AwDujUa/dl4gxSt4ZQME6155oUGL6Mc1LH
	 /ALMAWt6+mQw8Z/dR1n0olw/t9bxdMjFKqoHGgEByer1mBapFmhpWtiZiTgbPKt2Ll
	 RCp+raPBgb/8aiatv2AUeyu7G40FgIQx4ENzdBHFyBA3O+q/6RSZZjo9MqJcdwMSAs
	 VxdHo/mvB+N2IT7vFm8x00wwvgSVQZuE0E19/AXDN9ODqZX+6oNBjgIReqQf5/SfMV
	 g76fb0EhZqoKg==
Date: Wed, 27 May 2026 15:55:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <d2ba5386-03a7-41c6-ba67-b44ffa85e403@sirena.org.uk>
References: <ahb8y-KE12lOUIVz@sirena.org.uk>
 <a9f231c8-f48a-4743-97f7-6ce7f545b400@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AnqOLkpe5mTo13+U"
Content-Disposition: inline
In-Reply-To: <a9f231c8-f48a-4743-97f7-6ce7f545b400@kernel.dk>
X-Cookie: You are fairminded, just and loving.


--AnqOLkpe5mTo13+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 08:39:16AM -0600, Jens Axboe wrote:
> On 5/27/26 8:16 AM, Mark Brown wrote:

> > possibly interacting with some rust change but I'm not sure.  I have
> > used the tree from next-20260526 instead.

> Hmm, not sure we should let rust build issues gate whether a tree is
> current in -next or not. For, by far, most systems, it's not a
> requirement for a functional device.

That's also true for a huge proportion of the issues that get caught
with an allmodconfig, and allnoconfig is not exactly a realistic
configuration either.  It's not just runtime issues, it's also issues
that come up in people's coverage tests.  TBH the rust stuff originally
got turned on because I ran the allmodconfig on a machine that happened
to have a usable rustc installed, I was intending to enable it at some
point anyway.

--AnqOLkpe5mTo13+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXBc0ACgkQJNaLcl1U
h9BnNQf/ZAt9T7/SQjZ9OpIkezCSTrMbiFfDI91s1oPBE8c6IFF4c20ULJNStn2m
gq07/P/RNkhZDqUL2leWb/1Kx2WHJUocddSNyDeD5UeJeS3AMBSeV0Pze9Ij8k8T
1MZRdsW3vrTIOpkjPYouhYlETHe7FqftYkoxMr/8vA6zSqpvsHd5e098tSBVj+lr
N51WFXtZ09r8S45z9ul0DZV7O8hwyS3TskbwsxgmXiKrLl8l63eo2mOMl8WWjoTc
2Z8/YIgqg6sFgtyV1WlROtw82TLxEUUBMEh8bhiyJBNt7E529C+N+91CshODwQ1R
RkSgpdff4NDumFVG/9tr+4KphxBhpw==
=BDTs
-----END PGP SIGNATURE-----

--AnqOLkpe5mTo13+U--
