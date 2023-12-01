Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iCHbatUa"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5571B4;
	Fri,  1 Dec 2023 03:55:07 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2031D240009;
	Fri,  1 Dec 2023 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701431706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xyrHR3xQvFZqYpSgaO4Yekhq+6bnItgb7/+ZV0mlCFw=;
	b=iCHbatUaVfY+IwgqGPkS88aNn6XYuQvR46LCRbzPCsVQ4GdUDiNnj20SpObr+PxSpL0FZC
	2ctu6Ml6dZXPtiIHf454Iu3X7vm0gL0P1EBUSFk2qB7WwykbS/mAkV9O0WwtRAryh1qh8d
	Ps4uR8Ef+Fog9u6NhrT1oPI7CvI7haRbFW7h8KhOlL0I9imPCGmr2pRZUnMKfdGDySr0V/
	2Y6qa0cibIAue/TI3N9E2ew/gNwZOBpL0FTSgLzZ2EH/8+IDgJai9BAqqujDI7c4nI8/FE
	1v0dUkLkJqzGRY5g2o0TUCdFjeYLexmEaUajH1QFJ2bzOo8tGkHDnWw7ufpkwg==
Date: Fri, 1 Dec 2023 12:55:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon
 <boris.brezillon@collabora.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nand tree
Message-ID: <20231201125503.1bedb057@xps-13>
In-Reply-To: <CAA_RMS5THkAQxEPWvtpcbb=F-G1xdntZPTmzhAhvK6voWi6VOA@mail.gmail.com>
References: <20231201125648.71d7586d@canb.auug.org.au>
	<CAA_RMS5THkAQxEPWvtpcbb=F-G1xdntZPTmzhAhvK6voWi6VOA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi David,

dregan@broadcom.com wrote on Thu, 30 Nov 2023 21:03:00 -0800:

> Hi Stephen,
>=20
> from this post:
> https://github.com/bbrezillon/linux/commit/e612e1f2c69a33ac5f2c91d13669f0=
f172d58717
>=20
> Looks like this comment needs to be added:
>=20
> * @deassert_wp: set to true when the operation requires the WP pin to be
> *                         de-asserted (ERASE, PROG, ...)
>=20
>=20
> What's the best way to go about doing this?

Please send a normal patch and I will take care of this.

Thanks,
Miqu=C3=A8l
