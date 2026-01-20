Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAA3446C6;
	Tue, 20 Jan 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913257; cv=none; b=KyvyafWXplAIN3MEkPX2z0fKoQOXDGf4G/yRBWf4fjhWvexEFnJcvUIIXF/XC+D5RR73C9KV9KbtNBjyzD8VwTQ4K3FBZLhU+LNl8h2gH4M3DARE8PIPBakpp5hCYko9M6oUFLffg/UNlIRe/oBLuy6k9ThLLlqgHZL+aF/Ogrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913257; c=relaxed/simple;
	bh=IMkH2MqcgaLZq/7SPNyDkjqN+sqVW0wUeEjvdJFRoN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQtChfYhUCB/qL/8om8qYZqIxe89xmRegJSOwAOBjN5sR7tIXZdx3h99db4d6Fq7wycsVoLqgQnR8hupgi16SMd5/5ZDjYeqWeOJSQptLA7D1jFPwaRKzDuqnTJbuclO8IEYBV5KN/XXE8WlcFJXQCtEwWMumM7c81vMDUrcXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ckxtuyl5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ckxtuyl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC56C16AAE;
	Tue, 20 Jan 2026 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913257;
	bh=IMkH2MqcgaLZq/7SPNyDkjqN+sqVW0wUeEjvdJFRoN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ckxtuyl5+zAMmRaXRRw4xUhIbofL1Gc386wn06nHpwWsrXoC05xF3Y/2AfMG9JRJf
	 BY0lclSRKe3ISG0kiWhHQBL4AXPqwaVWAcQ983jiLcyiUZ/mtWHijoShzZ+lgWJSD1
	 n3kEXKYVXTHR51ddjDAA+kbVFiy1jZ8QASb6GMGDUFfTqfOGdfBCDWL8fZ3zCS9m2r
	 zM0UJCApgy9Dhu3o6SBYVTvV0JOQM6EFU/AmmeoP5mFmHDQ94rYpx6aRNjSPvBVi+a
	 Gc4jihaFkAP6abmOWoEwigulJt8AEqee5XQDjp6xnm1SZh0HNckQWyqSYCFuRel4kb
	 Dkk3EtaIABOFA==
Date: Tue, 20 Jan 2026 12:47:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 spdx tree
Message-ID: <af81f306-aca0-4457-a2f8-0eea7cb4ed4b@sirena.org.uk>
References: <aW912Qvlf_n2S8f6@sirena.org.uk>
 <2026012043-borax-cosmetics-0a0a@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XKKfic+SjZSrnTp+"
Content-Disposition: inline
In-Reply-To: <2026012043-borax-cosmetics-0a0a@gregkh>
X-Cookie: Slippery when wet.


--XKKfic+SjZSrnTp+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 01:43:55PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 20, 2026 at 12:32:25PM +0000, Mark Brown wrote:

> > diff --cc kernel/cpu.c
> > index 5185c0be847a0,a7a1cf8ea8e08..0000000000000
> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c

> Odd diff, did something go wrong?

It's what git does when you end up taking the original change.

--XKKfic+SjZSrnTp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlveWQACgkQJNaLcl1U
h9AeTgf/RGVR1VBbJTvwEptjy7Zd6zvnVnzyx67K01kwO1A7aXIwJwHRQ1koebAR
VsNoQUU+wo+Oia+XxpEE4lkohsNj9eBXj0b4LgffjUqle4Prqmw0Rp0hEpp9htCx
DpI3GW1w3ayZ2XRf1jTb4e7DSarUVWhbTKsWSiE0w4PWx0XKK+fyfpn22guJ/MwC
HK/ze+8SWsx9tqHcwsWBo/cf1pcyB8W3hfnokkfmvHE6fQiIHZe2Q0nDYbQRcuW0
770iydt9Vj7g7WpbN/3bcPFbWYzpUQq4ECmEIak0s7B/EWGaTjCdzdOzPbd/HeRd
X9cPcbAwj4KjRn2F/prb1892n4RtHQ==
=7PrS
-----END PGP SIGNATURE-----

--XKKfic+SjZSrnTp+--
