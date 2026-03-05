Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBF13BED60;
	Thu,  5 Mar 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723929; cv=none; b=Cursr2x+E+P9ESVTCaly/+aQ/moQIYWgh/oTRznxg1UI3GM7CFf6cbiin00brmqiLuNHLA4BmN7q3jGAnEz6bDg1EvBAJOCHn2oiiBqEhIht7ZLJyCJBn3G2P+iEMIjxtxJap826UXlXuLzLCGWpiD6WdzPlkUdvU4aC/L3ku0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723929; c=relaxed/simple;
	bh=e9iPpCyoVAUy3qHOLP18VfDaInrVx3EQhIEe+R/lpRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5gv5cXK1R08C+TkgdtDuVIzTk5Aq+7sYHRDYJGkGY7Qdrf5tFYAXZLJSQf9mnns4DNYjxEKOdRvKxY+JkT+8LWFd3CzWVe6qcOVEpQYMnW+6eTbOsWwxtdrh4fqW/I/iPQTJHT4A6+jaWz/LqNXPlk409pGsKC2kcBkiyKAXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOFMwTAS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOFMwTAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CCFC116C6;
	Thu,  5 Mar 2026 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723929;
	bh=e9iPpCyoVAUy3qHOLP18VfDaInrVx3EQhIEe+R/lpRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOFMwTASQzoe8uKgUVDubs5Grksjt6TZZRy8kr+V7rZvK05Er7q7N/oLc5zCYiQlX
	 5ZaNyQVL179WTHPGGe37U+lHDQsLi7u24pgV+O9ujMddT5BEUCJ+v4tg4GnNThQopV
	 e8MY6ljXpjzeWQa0pis4LllTPgU2qKCYWwcdmWjNki1B4dzIbPK1gIvl2ZEjBjpomP
	 daer45AySwtgKbGE3S4WqU6E/GS7wmTOaGhGEVBSuI+DzKwa7GlmBOsbyr5UVNOJ0e
	 p+0lkB/AJVE2E9/PK0qxTQmeOlukKhbX4kTQLcGFlh31NLxnIFzaKtsD/lRGS8zYaE
	 Xp1Xa0wJgmccg==
Date: Thu, 5 Mar 2026 15:18:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the vfs-brauner
 tree
Message-ID: <fe2349a1-5b5d-41a4-bd48-8814ce9ab7cb@sirena.org.uk>
References: <aamIvIWiZDDCmNYG@sirena.org.uk>
 <20260305145428.GA17884@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JeDU/fiXHx3qYmiI"
Content-Disposition: inline
In-Reply-To: <20260305145428.GA17884@lst.de>
X-Cookie: Onward through the fog.


--JeDU/fiXHx3qYmiI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 03:54:28PM +0100, Christoph Hellwig wrote:
> On Thu, Mar 05, 2026 at 01:44:28PM +0000, Mark Brown wrote:

> > I don't have a huge degree of confidence in this merge as the block
> > change was quite large and the code is entirely unfamiliar to me.

> I'm familiar with the code and looking at this I have a hard time
> understanding the merge.  I think we need to get both of these changes
> into the same branch somehow to properly audit and test it.

Thanks for taking a look, like I said above I did fear that was the
case unfortunately.  Your suggestion sounds like the safest way forward
to me, let me know if there's an updated change I should carry.

--JeDU/fiXHx3qYmiI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpntQACgkQJNaLcl1U
h9DEgQf+Nr9XmiYTbnUlOadPL2U9g5RFO42mRhEzH4S5nJmRxKNBE/QPc7Mb3cW1
x9nZ4Eh4TYeXyW0gX6mVbgqSHuHKQLrZ8mZFbgs6o2xveKMLqOwyoyH8Faeal8uV
xAbDF0wLUfnEl7wXQMqKuozrceQwb8X2T0t0BTJgUYKJ7TL/4symArWLFLBUzzk/
xVVVrPXFJyZfp2NftA0MjMda2QxGdqFqCy5xmPTwZjAvA0ZrzLXET1/UULWdmp0x
81ywTLhzMdLXSVbGTCP2PMEEoedW3aNjwRaiSl6LeTZCzL1Xb0OKgZKhQ9LNtpA0
W8hNAOT/HiZR7dPJOBpBxtT6+4298Q==
=sVmV
-----END PGP SIGNATURE-----

--JeDU/fiXHx3qYmiI--
