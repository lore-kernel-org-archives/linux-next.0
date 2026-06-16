Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AF2BDC0F;
	Tue, 16 Jun 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619179; cv=none; b=Wqe6mCHuoycNdTCFkF25ESu8z1Lv679QTg/yC/KOrM0vFhGiyLrG4G5Rws47UwvhqW0S/cmJR0H+7zw/+dF4XVWWngB1bxREQLVjtVXgmn/0AfYkGnZB5g25Vqjei3hW2PZHus06YIIVV4fCRTgudp5zSr2ureS27BWraghF1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619179; c=relaxed/simple;
	bh=rsRSqwL9aDdW03U9AZpav/LBkxY2GlD7zAp1J4Glc/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJNaCVVQzTMoxZ/B9M9yLMpuxNk+wbxzYNWX5+OkHRGVEkLxR/GxAy42/194xpShlHvCUjsmL7Ca9k80iFhDMv40WUUozxQkuKhyUSBjw8+p1oq328oMTA/s8bMpqR7vbQZu0lfiOMTf7kiZ58m8WMABK1XcMcPtVKP/hLq+GrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0tusdtA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0tusdtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC4A1F000E9;
	Tue, 16 Jun 2026 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781619178;
	bh=HziwEwky17qdkz2lfY4XTKwbuIGzU5GPbaNp0wEgpXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0tusdtAFd+YKtP9lCkYeNgA3RixtdgoPXS8j0YLlByySSJyzXD8rPjzy1zE/jetv
	 pKR+j13qz06fNx7RmJPaSxirLTQ75+NPiumbVU2SM5DjZuO8jVEI/qU7m9ExUzr6Df
	 3tYK0F17aYGK5mZo8aZd8TnmalN1Tj8qpxG4v5RoyhBj5+zPfCaAEkTqgvRmc/Pg4X
	 LmtFonsntBozoTF3iJ8FzK/zYq4DaUO3W4PzDvc51MHLVkOOcwS139hAkCcPPmCVZC
	 2mMuYE7bT6wrVukFkAbHQroLlEl9mLindaZbkqHcPcvMyDjx/xC86C21xu8vbGxVXq
	 7NseWl8i7XiUg==
Date: Tue, 16 Jun 2026 15:12:53 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Christoph Hellwig <hch@lst.de>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <bc0bd0ac-580f-4778-85c9-dc4c84b53e60@sirena.org.uk>
References: <ajFMJzsbcZ1m_vr3@sirena.org.uk>
 <7e0b3775-3e22-4c43-828d-6bde2fd165d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EqNY+XxEkTZZ5DRf"
Content-Disposition: inline
In-Reply-To: <7e0b3775-3e22-4c43-828d-6bde2fd165d5@kernel.org>
X-Cookie: Password:


--EqNY+XxEkTZZ5DRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2026 at 04:01:06PM +0200, Vlastimil Babka (SUSE) wrote:
> On 6/16/26 15:14, Mark Brown wrote:

> > interacting with changes in the drm tree.  I have applied the fixup
> > below and can carry as needed.

> Initially there was a conflict between drm and slab and your resolution
> removed that line:
> https://lore.kernel.org/all/ahoZ7OCzxTAbGMtO@sirena.org.uk/

> I think nothing has changed except that the slab part was merged to mainline
> since. Maybe that changed the ordering of the two trees and you had to redo
> the conflict resolution?

That'll be it, it didn't turn up as a conflict with the new ordering.  I
did scan through for a prior issue but nothing jumped out.

--EqNY+XxEkTZZ5DRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxWeUACgkQJNaLcl1U
h9Bs7Qf/RFjVSm7pbsTlsPzUPpO2rM2XhKoIk1gNpXX5CumgmVS6S1x/DLjLi8qK
YZIgCK4J5sjjTMRgxKhAXlogpzpN6Y8pXmshPWleUPkesRyZSKLOP0EGEy5ZsOyU
lhUFgKbrGOl2ovMyrbP8WRy3mq9DnHm+tt50r0syu/rt0qkAtfiSaWVUskc5ZfuR
HAEAgkggX6oaZoGBS2E4ZQ2DiFZgbx52TQoPw/20+VmrcBF1xGwJhSUkWFoltKqL
Z4vzE2mUbx13T7efVyPT2gy7SAyVSUx+l0wpMe6K2oUS5k8Dmrux0znMSStpnanO
NnzpbDhG83UfZc1I9YwmAaA5tLvOyg==
=qqoG
-----END PGP SIGNATURE-----

--EqNY+XxEkTZZ5DRf--
