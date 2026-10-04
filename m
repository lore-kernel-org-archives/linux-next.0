Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A8499F31
	for <linux-next@vger.kernel.org>; Sun,  4 Oct 2026 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145819; cv=none; b=oP+zznLImn4gFFqO9jdIrp7tWfkaA+GTK2dL9TUqp4EtINj7WK0wRfDptHO9YL5u1VV6HcGmnZBm3Wqm8U5ryvgh2ZbbUck6NJpQdHXiJcz49f0bPqIYxx0JQoMmVsoJqebehF+l0MDlK02mexV0NMb1+d4v05xR3CuwAN3TgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145819; c=relaxed/simple;
	bh=BMHKsqC3rzj1KWDBt8AXImPN5BML3eEQBNV+tVkNb+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyKPEkqwom7ItNQeq2Bfcyo8lTzhzuuikMea25FTh+1kkef/yaEatWjxKH8ONYhTqh4wA+RFib7P2/z8G9zsQjoT2qV5FMX/46EahnEQ0mXxYloGOv3pu4ywqKxPvGY9MnxY4Y37NX1eMDsg+YTXtNWU887wl/JRooH5j0TAwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDyZy8Ss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDyZy8Ss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87641F000FF;
	Sun,  4 Oct 2026 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791145817;
	bh=uP2AqrTRWEPuNxschbQZv5XXcB6h0173IW0AhVvk3dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cDyZy8SshMOYfDL9wJPKqArgnHZWe9EXyeaAj6q0VgKOQ0d7uhR4S+2lMz+FQDyPB
	 chhDDRZ75Fzcf9pV+axI6lGLsq3RSb7vAEaz9bMgz1cfMT/ehFS+0mf13JklEy1X4A
	 dJ9aZf6VeBYQhPcr8nl6Et9RG7BVALBwYtUaycHB/kJqfzDzOB9awroGxy8n9+8uVU
	 btSTlhDHzFYMhgQvSMN0HCENatfucbm4OPhrruCObXvRn9OtPG5kju01ozbChrhAnk
	 LloRu7tmhPp+DvldcYaeA+Fm19Xs8xmGjZrMnc8Ug6laHa+jg29pqc7dwaSy/yfh61
	 R+XlBzbYhNaaQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CBA2F1AC57CE; Sun, 04 Oct 2026 21:30:11 +0100 (BST)
Date: Sun, 4 Oct 2026 22:30:11 +0200
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next inclusion request: ux500-dts-for-soc
Message-ID: <asK3U88rM9hESX6n@sirena.co.uk>
References: <CAD++jLmNL0HU1pECen0X8P-KGmb0e-j_Q8G0wzqMMXcKx-F1Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1tf3b+A+rgHGhVP"
Content-Disposition: inline
In-Reply-To: <CAD++jLmNL0HU1pECen0X8P-KGmb0e-j_Q8G0wzqMMXcKx-F1Cw@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.


--t1tf3b+A+rgHGhVP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2026 at 11:25:50PM +0200, Linus Walleij wrote:

> Krzysztof pointed out to me that I should run my SoC stuff through
> linux-next before sending pull requests. He's right.

> Can you please include:
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git for-next
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> for-next

FWIW https:// is generally perferred, it's nicer for the server if
nothing else.

> Into the linux-next tree?

> They will contain a mixture of DTS and SoC patches, the rest for these
> platforms will go in through maintainer trees.

They should be there from the next time -next is run.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--t1tf3b+A+rgHGhVP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasK3QQAKCRAv73Ows9A4
iaEPAP9DL3yixEwaPk5Dpr1oeTdT9ggxneQOuQhj0QWYAAepsQD/VM91zd9HvlEt
rqUOxPu795PVpVVS2dO0HYG2knohWwA=
=+0oO
-----END PGP SIGNATURE-----

--t1tf3b+A+rgHGhVP--
