Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F9436BCE;
	Mon, 17 Aug 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972873; cv=none; b=WWv2d9g6Yg0iyJ3cGv50Q8I1nODXr0BMxVgwxaXmNiPDd4vM6ebbaPfxOsAaArh9N+LCdT0x2GxrQ2/cRY2DRzfQCDUr/HP5FSys46UEj9RxgfnW7XADeTuYgmkxiZwAv8lezK6c6z3nsHoz4g668j7ft8amDo3xPDXANSj3bWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972873; c=relaxed/simple;
	bh=O8KVQY2pnZhzqx5rrfhibF/s0vOsF6qy//6XKlcIhUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ilfl4pI2IdbzHE1IMq37IDcXf2vK4vQrVGugNPUqkK4os/TG7mMxqbjtiA63ldcusuGZ++BRRu4NTSbM1RgNE0v0YsIyV1L8lkP2MU8nK5mYu+b2NwnnuiPRx1xK5zJCFScbT1XBPfyZFBvP3lz5wzEs+qmLvKrqVyn1XO2HLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKh4V6FG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKh4V6FG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4C61F000E9;
	Mon, 17 Aug 2026 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786972871;
	bh=O8KVQY2pnZhzqx5rrfhibF/s0vOsF6qy//6XKlcIhUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKh4V6FGUilwD2DpOAUhGtE/+6hiQXLitcx1trai7jkHStFbj8oMzzAPJB1yucjy5
	 cuVpjdJyXHyjENZE4ZugFQlVTfrs4aL8/GASa3KMN4KYlqg7hRwe21WcPR9UVB/Qne
	 hBe8cbNtPiWHuMSOeRyopZmuKQScJI+nUhf1xWiLj0XgzQPYDCNT8EazjBV3vySBbG
	 RWZHYeDebaWtUg3b77mciLX/TIqMfjJAFPFu2GUUpg93ojKCbAwm8cQp/8FAs7NCy5
	 cKQtfOM3WkPslfwOBY5g4ooQmk5Q+W6zSoxh4icBiOsBcp8qx81xRI/Vl7J7WD9k7H
	 rlxZ96RuEBPzQ==
Date: Mon, 17 Aug 2026 14:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <smfrench@gmail.com>
Subject: Re: linux-next: Update git repository URL for ksmbd
Message-ID: <2df27d3f-3783-4083-88b4-55d175057a59@sirena.org.uk>
References: <CAKYAXd_-ZXHbfTT=2Hwkaujo4Jt1itQ1xd1gaNt=A0LjjrgR4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7N6u+DBpQz5gdme"
Content-Disposition: inline
In-Reply-To: <CAKYAXd_-ZXHbfTT=2Hwkaujo4Jt1itQ1xd1gaNt=A0LjjrgR4w@mail.gmail.com>
X-Cookie: Obey all traffic laws.


--c7N6u+DBpQz5gdme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 03:26:42PM +0900, Namjae Jeon wrote:

> Due to Steve's health issue, I will be taking over the management of
> the ksmbd git tree.

Oh dear, best wishes Steve.

> Please update the git tree URL for ksmbd in linux-next as follows:

> Old tree: git://git.samba.org/ksmbd.git ksmbd-for-next

> New tree: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
> ksmbd-for-next

Done.

--c7N6u+DBpQz5gdme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDCsMACgkQJNaLcl1U
h9BSZggAhbV67cxvybWJjns5affTVwhWIFwaXqRED1L5be6i+xKE5t/YBhV4oxKD
Tj73GL6N/Bn9bji/0WS3pS7qYiT7npscCDs6mTKmSy7D9GOKs4gXZV26AgNZe+lB
9vhQQ4TG09LRWXAOsS/kxQBk8WCxX6ir1SOnSEw2ezj7Sizi2eR9u+gViApW6uYw
lsZ/T8J0g3DI3M3F258Q88IQe3RsRfhHPoBvRfOYAOV9i6vviFNZllZA3ZGw4rU6
x1m3AxNedxrN7YmRg1c0jdxyQ4BLh3as+LqbVSqkoMVKJPJUpVsCPXOzk/wLzSLq
E+TXYE9ny46y+p4YHKLnW2nsg/Tfiw==
=3/M8
-----END PGP SIGNATURE-----

--c7N6u+DBpQz5gdme--
