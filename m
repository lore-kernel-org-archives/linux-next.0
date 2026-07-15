Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D93B7B6E;
	Wed, 15 Jul 2026 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113861; cv=none; b=KKNf/YBpShVsLKssL+U62EvGpDhmY6talvxAQOJAevEqdh3o+Ivktc3V6NRb4VQx4syl+Nbzn0kfnxOsRYHj3IS5qwTNzJkj/3HDYQvUUSBt3AaTS8+vFBMaK9XkR2VDboo+s38YW0IOqAJXOdrClBnu3gLzv+QJ1vHBEkHEKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113861; c=relaxed/simple;
	bh=Eh9nRez0fKKMSvHlRCr70kVLCrMW/tQ4cqP8kG8krns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vq+jD4yUZkHCbubW0ufntep4sGB6Ql7gsZazc50LxKa+ZieM0b015SWwR6SQa9VlDyAfM/05BsUSeA2Wf/1+RgXhbjKVl5rSJTIkFcGj6O0Q8Z7R1SijKu1JaVKmYx0PpTtWEGvIgpq1OBaqEggjil6N0uKfi+bQy45JHO0dn2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqqyIRn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqqyIRn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E041F000E9;
	Wed, 15 Jul 2026 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113859;
	bh=PYNf3sBwzCtYQH2LawdormnYbgyqh6P9m9lf35j+h1w=;
	h=Date:From:To:Cc:Subject;
	b=PqqyIRn9JXqArIfAOQuNH6/1ZmiYjRxPUlOTirBxsTSTnRKSOF7WozgoWJ/RkHcYA
	 2mSMi/D35DZXzom43OBg1JyDlgaKsFAPRucBjwqMXQISLcO2dpvEBqOMwVYGGMNL9o
	 y3ITj1sWENdGJCCDmzSdbApUFxD3D3Roy+GXs+ictIQgGofX2EHwyl55W+ITUbQBtl
	 i8NTE8HXcpXxqrrqDqDQ1vJ4A3mtzps+kUKBGSkc0Y5YLvUq41su59YSQ64+8gpSEp
	 9VqmK6dY09BiuLK6+EFze15ySY5LKWKp2QQ5ktyQP2Issn/QN3H5zDf8plyCSjCIQY
	 ByP/qeIsxmIQA==
Date: Wed, 15 Jul 2026 12:10:56 +0100
From: Mark Brown <broonie@kernel.org>
To: James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the realtek tree
Message-ID: <aldqwEDCi6Ae9qOn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D7SaEDmhDUTU9/hG"
Content-Disposition: inline


--D7SaEDmhDUTU9/hG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  18a9dade373ef ("arm64: dts: realtek: Add EL2 virtual timer interrupt")

is missing a Signed-off-by from its committer

--D7SaEDmhDUTU9/hG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXar8ACgkQJNaLcl1U
h9AjeAf/VCVRqKWGzHKgxNNTfqjQl559OCxEdgRbZo1wdr9GI8Z0bZOQ30+/4Z8O
oGFx8EEIHjmzwML8E0Ei3wtnsNQvVlnyKLmLWjRX2pFB7su7qZdN5dbZP7XuWqXv
egh0XnvuKgJ0NaPBtGYxugVftmV6UBcLgqdIehdleNRQU3J6mUDs0pk1apJ8Pjbs
fe6iqwJRWAkrAs9j20TA1r9ZGMZpQdOWIVt+tsJgAx16nmnfeYIVwCvQWKnTsQR3
H587FehNgIU0ehWZbd2mPVPHJbRuMu24Q3DvD2AMq9ygo2nOvAFMRSge2pR6g/1V
sgavoOvDF/cCMeAYTVH/yB+enAQRuQ==
=6wp+
-----END PGP SIGNATURE-----

--D7SaEDmhDUTU9/hG--
