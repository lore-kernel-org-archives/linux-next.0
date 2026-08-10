Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E8530C359;
	Mon, 10 Aug 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369354; cv=none; b=OQ6a/ybbmjLIOKEnJaya+OFTpefsJXcVddaBVCg8riHz/sQtme8KCr1+XPi4XJmpam9MGMffKB3FuH/yh4MAjgYNrHYpRlvOlNC7VGYQocqU6cQK1AZ9Xa3aGlcBI7TKDIoYvxQu2C5iXfAwwTygUScdv1mwZIiOopxBCB9QADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369354; c=relaxed/simple;
	bh=8Px0DsnZPBshVK/YWFsn4jKUGe5ZYgjttaWt8GhR1M4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ie5DuU2ktL4E/5EseZUatLrt3yzrSHM7DPD1m6H7BAegOTPwkfT6ywb38qoqPrych8uCmhZ2WoxnJEXOYWeGiu4LOjylzJXs2isK3bHkaagv9XBwBr+BJ4K0P4AAl7V0HaxZrx6z8UHxRCUBmnsNdRMlfsq6kTT0tQW9z3Zu++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp84WTt8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp84WTt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519B11F000E9;
	Mon, 10 Aug 2026 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786369352;
	bh=+GpEb2qWswGrss0ho4PECzUd/F7uaWJmWDWIl+fxLbM=;
	h=Date:From:To:Cc:Subject;
	b=gp84WTt8Lg5zal3ZNbkAdJjqNHVFX5Nrb0mjh1CXpMDwdqC5hGM0Ocd1Q7ewr/dKr
	 PnzVn+ENHBrTmDecrH7H0zpuEwPI/hd0r1KyYLYPr3VLsXV4YVFHj7AkIMtyODk4hJ
	 C+xZwmVLNnFbuc4UDfofcfhyqOvJAVi9miSURwjRPLsM9uscClMXJOrI4jFc7XRqAo
	 UJzJW6NMFs+VSnVn3Fym+cZIZ9YLG5rzyhS/twIaAMNksVfo0AROBsJbJ1sjbmgFSV
	 4Pbws2kW+7cYMNA7M7fzsJny/D2dDB/hQ4/4RZKWZjJlJMkZToJLHK7QL47hInTvzB
	 34HOiTZPPO9Jg==
Date: Mon, 10 Aug 2026 14:42:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <annVRNepH48qe6b8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H876829fv6ybLbPD"
Content-Disposition: inline


--H876829fv6ybLbPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by 'drivers/thermal/qcom/'.  Stop.

Caused by commit

   948ee3a74f356 (thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring)

I have used the tree from next-20260807 instead.

--H876829fv6ybLbPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp51UMACgkQJNaLcl1U
h9B7kQf/awqDQ1LUxGc7Wq+6ngQ8FJA6/7XYSAeBev8jFUTCT+yemerVgRfmWLf+
xas4rlNcfojYD8Izvl5Fu/Sty4f31sd+Kfb1b4z94yyaTVTFUqv9LqT3AvJDIlc7
MDbfuaJumJ0fFFpKH9Syn+0pinb3gaJq+vM+Y0sUvB5j1JOFO03A5HBTuPRdZZMf
kmYXZINiq8LYcHCns+IA73mMfhXDeoBoHlkKf6sbd9phCMf2MSIWWMTDOMc0dKP+
xN7vAQNNE+RWwZZGWtupbp0nfF+o3LXhuyVJxORtUiqoNGYGXmIvELZNfbEXeSoL
g63qLXMu/3N9OGLeLjWDDJGdEM+rWg==
=dJI/
-----END PGP SIGNATURE-----

--H876829fv6ybLbPD--
