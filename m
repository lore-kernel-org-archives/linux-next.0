Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B813D544;
	Mon, 16 Feb 2026 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257946; cv=none; b=eBZbCjIX0l/6CAz472DCHbBijZXwruKyCtTfyfM+1Q7qCxUz8TArbZjJBu6dZJ+cKoULbeawOLso4RzBqcT9DJez3sK/PURqMFgrLGMQaLR3w6jbeK2G05Z/PZYLT2gL+lVfZJBMrGeS5R4Nro1nJK9puj4E02EE0gH+wUhn48s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257946; c=relaxed/simple;
	bh=EL7KyOL9zoFGMygTMhB27eSdDqEEfxjkkCdY3Z5wcdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY3l48+pcyQmp0mKRpHP+aPWTPgM6+RoeBkpz+4phzKt+NLaPBwqtLHf2MmglcTRl017hoRyvIJ0KE/+3FTFRJAdi/uhlWz7APaB56+LnFV1zZDkTxyECMF47Dae6eAIsRzuvXM5FQVEF05jUOKCBgyA0A1PrOhiy90DK00ppV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVFzr69g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVFzr69g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F33C116C6;
	Mon, 16 Feb 2026 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771257946;
	bh=EL7KyOL9zoFGMygTMhB27eSdDqEEfxjkkCdY3Z5wcdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVFzr69gBPFShYYE8dIhUMmGJepxEcNF+2AIyveM7C0d1hCCjmRKvZA3DPfewJXSe
	 KE4ByL+AE6uI7IFLGi00/dm/+Wgr1K5JtFhsYdieH4gtBnE3+BuzEv4gCAitoBnAeN
	 Ol7h9PNHu1ic/bjOknl5qEyOt6iXUOE9WFzMMjocW6y5oTEtt3Z0AzqymgryFdTbZX
	 t4SYiuMHAqfWIwdzx0lrxS27flbsnenZwFJJT+2P3RpaezDtQFS3BGXoyC7ro7wwQ1
	 OO88Ufg2PDoer5ihML/2kNaalQHDzd23BWlT/jSiPIBVUD7/wgLZpb+dZmCx8RyHPE
	 ObFSms0c3OPtA==
Date: Mon, 16 Feb 2026 16:05:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next inclusion request : ntfs filesystem
Message-ID: <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk>
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1/Cx8dQhqU7qtsX9"
Content-Disposition: inline
In-Reply-To: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
X-Cookie: Beware the one behind you.


--1/Cx8dQhqU7qtsX9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 15, 2026 at 03:02:34PM +0900, Namjae Jeon wrote:

> Could you please add ntfs -ntfs-next tree to linux-next ?

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next

I've done this, with you as the contact - let me know if you want to add
anyone else.  It should start appearing tomorrow, though I note that it
is the middle of the merge window so if it were going to go to Linus
this time around it should really have already been there already.  If
you want to also add a separate fixes branch let me know about that too.

BTW, using https:// rather than git:// is generally better practice

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

--1/Cx8dQhqU7qtsX9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTQFUACgkQJNaLcl1U
h9DKoQf/QRoHp9mvZdW1zAQfjCVybIGjxfxUSkufYt3jR9nbAWQG5lDfqOWY4ixk
lzl37xtqL0PizhitOCAPNSvSp1ODvSgOc1o0+Vq6oIzWtVb/T58BEPbf6AeWlvCR
29qZHTpmhn14AIfGBYKJBAkDxUxj9BxapnFtWBIaJE/gEoMpBg7DHGyneip+jpPO
biyv/rSp4G9Q+JIpBrVlsjc/zwvQxt3Tcyqe9OEeC7fVICr0vHnk09jQOgUSJAlp
+nuM8oNIqqicPN7+vCoq3eBVIMRdjW8hupxJGZUvuDtwnT7ViE4xrAaVuLBU/Mfp
AA28fUVQOTvs73u5bzrEJrwFNvNBmQ==
=HoKB
-----END PGP SIGNATURE-----

--1/Cx8dQhqU7qtsX9--
