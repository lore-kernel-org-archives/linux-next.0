Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443335DA77;
	Mon, 10 Aug 2026 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371380; cv=none; b=VX0xemNz8R2WQXxCM0Byw8L1Z1CbS9I243XKlOon37wrDIfSUwroTzDKt12vK8VRP4uUZ5BMw8j4ZaJK5TzkndoBAMVvNPJ0IyM6fmmFyjwp/FzWM8ETwWYEwTX3cXIMBMqNqbb8EouIOKVS6AbYRBFNJ7mlAJR/sU79zx9zNs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371380; c=relaxed/simple;
	bh=1N8yds5LFWZt9BsmUGsarKqm68QHeuzTmd3Tp62y7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiTpkBd8SR6DciHKMW6OMSrgqDKJZlCJVm8IK9yA6LS3Qc7ka7i849PUU9OIYlkDz6Xj5hiUx587m7PYF+8CpDXT+BbgozV2/xpgyP5wOTfUID/IwVJw1i4RnQgSNS6v8smro12k4gM17AUQ7K+rY9QkcX982BwEfbf99dzV2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPq7q6dR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPq7q6dR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E221F000E9;
	Mon, 10 Aug 2026 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786371379;
	bh=dXGyi6FBhJPdhLojrN18evAVmxLNXTF9mGoK3letI0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iPq7q6dRkwfInnHI1soj/cpJyDPY9ZvGRCXOuZ0FFwqpFAUkcX3mQOHBROTmcnDTe
	 FP1inFBTBs/f+2uHDJl2LPz5O52eVaVWmbtGYsju+rQFxZRYAD/DhOB+/TwnrrlhkN
	 7/UqChVrmA47BScdj8WSCpa2hu/b5clrY3EL/dyeIygfNJU2PHl3WOY7NxoOcRN1W3
	 zJz3tG75iF/n7XqA1VuhBftfoVb21f+jsMiQF5e5QLowlb+VFOjrwdEAJUHmjHBNK2
	 BJiJFFYe9/IKErhvBi+Ed0rWO1dza5doib/SdQ4sMv2p1QlBA7B5NTQG4meReo1cWv
	 13YkhnTjb6n6Q==
Date: Mon, 10 Aug 2026 15:16:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the thermal tree
Message-ID: <0901dfff-cb48-400e-a183-1cada1e4dd31@sirena.org.uk>
References: <annVRNepH48qe6b8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BidFO/piSk9vbwov"
Content-Disposition: inline
In-Reply-To: <annVRNepH48qe6b8@sirena.org.uk>
X-Cookie: Polymer physicists are into chains.


--BidFO/piSk9vbwov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the thermal tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by 'drivers/thermal/qcom/'.  Stop.

Caused by commit

   948ee3a74f356 (thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring)

I have used the tree from next-20260807 instead.

--BidFO/piSk9vbwov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp53S4ACgkQJNaLcl1U
h9BPuAf+KBxe2igROSpBNCzLUMExFbdDR79AOVL3fWs0HXlG/Sc3a5rtAEg4UOJ6
YgZPih7y70MtHgM3ZS7QhNho3Hdaq7v8w0LNoISYfXz7MNpDsImVstD0xFVev+3t
Pq1VYfU7bPdFdYfOnKythoeSzrQu918Ecmke9LbUKawRLZa1z20WLQepSRXuxqXg
xiNHqilD5U46owV/99TaWo/LCkN2guyiDrHLykQBWoN/hHriwwvHQ1Tou5v0PJ8E
V8Tj29Lx0xWjMeJPDc/3G7xvrTIQ93/sj0XiiwVbIEb18zQjk9lqbzXn3Qk/6/zy
MP13zvO3azghb8/gOeH309rY3ispXg==
=IZqb
-----END PGP SIGNATURE-----

--BidFO/piSk9vbwov--
