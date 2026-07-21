Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA1360EDB;
	Tue, 21 Jul 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641043; cv=none; b=e1z8vZ7L/RpfZ2nRArU8xrNG1/IG6eE1gfJGmrnPRPTMDj4p3/zFCHfg9ZOAV00NCK9dDOvk/8kiGx3Fb7KAp5n8M4zKJswmr7VECGXab+e357ARF1X+qXeXVNlDSHlj3dnB2IIlm5FeFF2YqqdNvmH8LWSH1akAwZLZh2JiLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641043; c=relaxed/simple;
	bh=2AXB3HAVI6E2IExtK32QUdmkeidHkchmgwsToyWmGFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3JnkC8hRV6eXT3aQDamgmEZQf8LukL5UZykznfryRQHTKhz/JNu92RjNaFtjVBe/IWsP50d1CjEagqdUj0qWQwCEBaa8gay0YuhqShKTNnV2ARrhFFQs+/OrISxCInjVxsxySV/YS70+rqxEL7yTjogbrhCbGO3GHINauPuCG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9yshE4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9yshE4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B131E1F00A3F;
	Tue, 21 Jul 2026 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641039;
	bh=qOxcTM8Bb5O4TBjDA8HGfq//wMYCU/S3CsTRo5qHVnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d9yshE4sBd/33P3/CcpMt+xcQzEfRcEaUYo4jVwamxzTzsmU2jAJm+QLNezNPW0QW
	 6vwaAI6EUnWo04Dvo6sToH4+taqaXyBQxe+vlvhiFjR179jG1MQZltw6zozlDhnnUm
	 OYpSBYTDu+t5CSn4coR/1Yt2TTDuyNm8Sr5Mnlv180RqBYqaBPEzSWUJfGAKSiZrGe
	 O/msUXIxX/PYuSjXH11R8TrwQ6gmSJPAZkRuONLhAJ2poWj5vvcRYCrR+5+mJ16khu
	 u9PpkZifYB/yfjaZ5cDzeSU6czJFAmssuISFktzElZAanwRbR74xo0fLEqPiSLr6dh
	 xGmQOo+O3jycg==
Date: Tue, 21 Jul 2026 14:37:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the kvm-arm-fixes tree
Message-ID: <0604b71d-5a05-47f6-949c-26e0ceaf1b78@sirena.org.uk>
References: <al9cA4bfywF11OmQ@sirena.org.uk>
 <86wluoeek4.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnXHoLtBBpIgKHUD"
Content-Disposition: inline
In-Reply-To: <86wluoeek4.wl-maz@kernel.org>
X-Cookie: Love America -- or give it back.


--MnXHoLtBBpIgKHUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 01:02:19PM +0100, Marc Zyngier wrote:

> BTW, could you please Cc the actual maintainers of KVM/arm64?
> Christoffer has been out of that look for over 7 years now...

Of course, I did think that - just to confirm, that's you and Oliver
(with oupton@kernel.org as his address) since AIUI it's you two that
manage the git tree?  Usually it's the people with write access in the
contacts list, but I can add whoever you like pretty much.

-next has it's own contacts database since there's frequent enough
divergence and I figured there must be some reason it was that way given
how long it's been.  I guess it's just bitrot though.

--MnXHoLtBBpIgKHUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfdgoACgkQJNaLcl1U
h9AoRAf9FVOaf5TzOpT3iRwSHGQjeYV3pu+fLpo18xQStBUr+JYRKfuMNsGMrpbY
+uZhYN6rjnVsMb1Wy68eJrd8KX+XraObHggUEd4SC+B3ygJ6j2btLHYOhnybxm5z
jdKFtaVG1hBu9yo23p0eRcFA4Xd0htGzKZZzP0fw6Z/+ThJQJE/gdoXTNhVefMKi
XOYdlF5Xe4jH4k1tejwA2R9zvd+fVRWcA24CY5KD2rkGYgdDicMv8XzqtBRnXEtt
dqcVYbNggT+Bksryt2qw+ptiqO7VQvYX2a3/EquJdS90Dos6MsQ0kl0W6Huc7Dtd
GVm+g7gJEdCACOko4ofLQcYlO83bjw==
=W2i5
-----END PGP SIGNATURE-----

--MnXHoLtBBpIgKHUD--
