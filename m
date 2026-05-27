Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF73EF0DE;
	Wed, 27 May 2026 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877806; cv=none; b=UcigZvevCJjq2ISu7XkUY0uQFq81q6Ovo7wPuYZaaXjUQmIm5a9wRexVs3Xm5dtzixv8eiwYUfWWculo/UMN/qOI1HcUQ9pzQD8zA6LCMfqtA6vk8vnPWL6nD5DwywVz5bRfsMVOI0aSvGpEnI3J9hliDe1g8ijd4zzKiUHa42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877806; c=relaxed/simple;
	bh=Y+zYj0jgWKapXEjWhzlVdRbGPxNbSgS+0gKH3FAJs3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/V5tn32m8axfeg/6MIeDDTZjGVo6Sw+1zCTRp4kwYkWXBqUjzMk7GNHB8dRSPDYOcYyMjRckN0vhPW97qHWME2ehSF0mmZp1vFPWYRrfNhMvZtUqHsDnjn5Kbe18Gvad/sKyN1NC0A6UE6+o3Ks78/JuG7W6SKpo7rPI6jR/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yz/ph9i2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yz/ph9i2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44E11F000E9;
	Wed, 27 May 2026 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877803;
	bh=PHRJNeLhnGDccbPVqaeI+evsCz/Gci8WVQVSEDYBmcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yz/ph9i2i+y8UDbZwLSaDzvarWiHQ654WhDUFwxyHV2kJy0Qbgzq9r4fdeKZlpQrM
	 /2NeeI3lAIbLjIUjMhJa6IrZEru0P+1DQ6yShPSrx8Yc+8oiluVTajEtN26Z7Jtn9j
	 DeFNzRoChTyPCI0WxSzW1clb6xoc3GP3WpRxvZTvT8Qk9PB905/GBYoayr8PddZth3
	 A8YEh26M6WeRsdC8vqo/rV6cPI7C10WJm7+MJ9RshMwtDoWq2vrjtbwzzHoaOk529Z
	 ysvy7xdZl/KUbYhEwiUsHjmnDMotAtfw5FjgMZAG2uSXFCMyjfx3e9+Tp99aHtlJvF
	 DKKWoAat3Bzfw==
Date: Wed, 27 May 2026 11:30:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the ipsec tree
Message-ID: <7e8d59b0-ae5d-40f5-8e76-2200b2e420bf@sirena.org.uk>
References: <ahWldvORuJNSMRzm@sirena.org.uk>
 <ahZ65tqj7eJWbiQF@secunet.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdqBcqagEvf/gpNy"
Content-Disposition: inline
In-Reply-To: <ahZ65tqj7eJWbiQF@secunet.com>
X-Cookie: You are fairminded, just and loving.


--fdqBcqagEvf/gpNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 07:02:30AM +0200, Steffen Klassert wrote:
> On Tue, May 26, 2026 at 02:51:50PM +0100, Mark Brown wrote:

> >   2982e599fff6f ("esp: fix page frag reference leak on skb_to_sgvec failure")

> The commit message looks like this:

> Author: e521588 <alessandro.schino@sbb.ch>

>     Signed-off-by: Alessandro Schino <7991aleschino@gmail.com>
>     Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

> So 'Author:' and 'Signed-off-by:' have different mail addresses,
> but the person should be the same. I did not notice that when
> I applied the patch. I hope it is not a problem.

It's probably fine if you're sure enough they're the same person, at the
end of the day it's up to Linus and whoever your upstream maintainers
are rather than me.

--fdqBcqagEvf/gpNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWx6cACgkQJNaLcl1U
h9BG5wf7BgaAAWTS2ozrL8PIOtMrIKRTAd1SkGnww/N+OYhbzvPm3jagHYwDsvIb
11tE9JOQOb0/yLrjSfH9d22uhjGTiuJAqNStP+2xDBr6xyh4D1L/gzBJlpZ8AYXd
ENN1geq1FAiTzRrk3KeMnNsCMbW+bdoFo5P51c6jJyznBBb1k3iqdLL1WCW7VxJ3
t32+h9EeV7kMEAbfO+YX89yyjOlrzD23gy+sGjCYDwD0sYRxto5aUqyC9j6TAB+X
h1fgIWeh1Sr0J4CNBUCSuKm47hGItiXAf54kZTWcMsqV7lX14ekye8VO6Y5Tb6mC
vwKXtjNT52R1kSdhYqfxP336Wr4Ebw==
=fF07
-----END PGP SIGNATURE-----

--fdqBcqagEvf/gpNy--
