Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54582252900;
	Mon, 26 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440386; cv=none; b=K31srWWnvlhoWixnO6l1eySWdBaH+H5+CGH+H+S9kLrdMBwxR5YLDvdhTOjMfBLMe7f4dPt9o5syrbnQfe+wN5wJxY63ry+6ypwXNi67BZAhW1ODYG0fLek2oLrHGmRHgNPtAS9GsC8xjgFRepOYxJ5B1Nu7aGl4VYV7eionMtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440386; c=relaxed/simple;
	bh=4yf3kPs9Bi78q7PFkeuecduFCnWUdkdd3RRMCjLNfnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGZb06GbXyN3u9ietYpy/x6w00OVgO1E4ybToSLOikckKwlSLEo60ZUfNXd7i3ct3iNSktBnRJ1a0sGlzJ3Z8VRAEa7e7LPz+K8GFOsJxvs2BZ5z1asBCN1xLTU9xlV8VNbPi7jzPqO6FFX6JGA4YWoaLC4B1BKklRvYAK3gn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRgVaPyo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRgVaPyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBC2C116C6;
	Mon, 26 Jan 2026 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769440385;
	bh=4yf3kPs9Bi78q7PFkeuecduFCnWUdkdd3RRMCjLNfnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRgVaPyoOmWEfpBqjYkNmrl0J3vo5aGj0fkc3oZ/DJmaEtc/tfZtt3RKy8EGsT6MV
	 mFnQ3D1K7FERTSwwddikLg4yr5M0KGpj6yfKBrmDP/IOGI+QaWNb+a0+c5q7DaSw/T
	 yEG41AABOvMJhZcwtYYelIsc6lAnCkN8GAnC9ENJMnk2AYtaEjoKbmqVamLYG2rUoF
	 onYrzMOcqkAxAUzgT6hkGKD3qrifba2ppbCdkREbfNK2PYF8kWULov9B+LEs0xCnpS
	 y+ZUdspgF0eBl9Nd4Hv2VKAHt+vv0c1P4Z2ica3JXo69lplrJ3PUYNsw6RUhLwbs1x
	 +D1JFz7lL0lbg==
Date: Mon, 26 Jan 2026 15:13:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <27e9bfa1-4fc7-4e94-9cd3-3e661588563d@sirena.org.uk>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfPYP8dhmQPQeJz+"
Content-Disposition: inline
In-Reply-To: <aW5XSAo88_LBPSYI@sirena.org.uk>
X-Cookie: Haste makes waste.


--wfPYP8dhmQPQeJz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 04:09:44PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the perf tree, today's linux-next build (arm64 perf)
> failed like this:
>=20
> Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510=
/pmu.json
> Traceback (most recent call last):

=2E..

> Caused by commit
>=20
>    a66f6242fbf52 (perf vendor events arm64: Remove uncountable events)
>=20
> I have used the perf tree from 20260116 instead.

This issue is still present in today's -next.

--wfPYP8dhmQPQeJz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3hH0ACgkQJNaLcl1U
h9AWpQf9GyKmz22oFpCkywz4PZYZckBBLsG3al7svt3sUZ4/x856twX8783HaGmR
l749N0lCMta/YmCYmApKxFDbplX7G8NzhDZcBspevVbCf8DnTL6xzmrSOzfjFVBn
1mIoFVN52Olr+GJLAMsdbFXkGp95v9tXSeKQ9o7uHln3gbESVSKr0L5RsF+n/84K
2cLCuC/lb3WVKWZeccxgS/Bw9Xkxn6ODzI4UET9/MeM/4/s/0GEGbcJ+RN5tGWhN
MvVEWIVAxIqQtykuP4VXXMmVMyzvslYpnORra09XMSNg5RS0f63GmeMo+owDSTvC
hTKVc9sCZvDO2HjQ972OVQLDZhZSCg==
=iJZT
-----END PGP SIGNATURE-----

--wfPYP8dhmQPQeJz+--
