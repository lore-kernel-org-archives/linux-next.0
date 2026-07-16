Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307343F484E
	for <linux-next@vger.kernel.org>; Thu, 16 Jul 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196845; cv=none; b=CZ/uLjzvbZbKl8f7CmujXYZyAFs5g39Eb+0iOOC+PDRZramiS+ZxeUvAtGhZ96Q9s4fbw/x0KAk1xlywLUKxZBtDFSV7O7RU/HRYJ6r7GqjaRNlgxWZl7ApLc4qkJaeaIXJGvX6EXY2HAkdulmxY/B+CuSvlZyCu7gicb3eewxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196845; c=relaxed/simple;
	bh=0/tBC0KCUh5LW7IzaPJv9dSEedswCYxIQ3e8GciJMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXZbwcXXImHfU9PnRUpeP5XXr/ascydZ3R1dumKeZSWE1vat+pZRezQj+1XsuHgEx7AipGtfX/7phpStHVTDrdZmDuYGyoPh805oKtfZi+d1kC6gXCHQQmQwMRMk2X9DacGdC1ABE7suPlUHuR6LRRD8oAHIAg0TJEhvn5dj9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QX+HBYUP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QX+HBYUP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2755464f8f.1
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784196841; x=1784801641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdByQpacz1nyXIEUp0L36KxSugQAT44TfZyhzwyhKm0=;
        b=QX+HBYUPF+7SP3XCV4gKncPTuq6Tnl153VewXS6ZzlhKGQsDa2K+0SG/9Xp0/vsaxF
         gNcp+It+Fgad+TmZCmFpldBZot5dOxTCBZ9u1psR0xVjxpnfn7bCUQxV6I3lVwyXXcjL
         i4UM0+ejC2i205uXZPjpk6Bm1G8n3palH3Tze7l4ENi+Qj6cw3wxw8xucfKpuekN1H+v
         30+r7J+IDrm24YWZWdRZTxXHcFYoy8fc8E6+l6vNAjWdkv8hPKd9+8hqcIgRQ9dm+Rng
         n3F45rlXsslkuLyNW69kvUB0ON3rgV6yTvHzdie2J4vxVu9j3HfiQFDDsX/4MvKGr55h
         LJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196841; x=1784801641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdByQpacz1nyXIEUp0L36KxSugQAT44TfZyhzwyhKm0=;
        b=rS5E+Z331x+2o86oaAwv1bfjEAYiB/uMaTMRx0LZVdfhz88d439bNeNvkMkxUCcVlz
         5cFkwka67wkaldy3RbtgjZTRBQ2Plu0KIFLpxWnQK+XVXbd3RhJK7oyAPFGPYHDnZhIN
         TT8sMhVePcRKTcPrJJKJddYnaaCd6S8QpSeuG1TfMVHoDB+WWUmAK6lKEt1ZCer5U5qp
         DFAC+ljdGVBfsgQMZa9opy2cpNzFkq5+AjJRLQ7mo7OK8U1c9ra63EU1Qhl5EUi6JwvW
         pEgeqAWmia4SaQfOuggabGbdW6BfPR1DkZmMg9hkhO1y6M3p/srE1cICi8KJK8nLtuvM
         yT9w==
X-Forwarded-Encrypted: i=1; AHgh+RqsJBLpPtMuI18BcODqgzmt7FLjIhQMzxj4zN2N4ZoTmLsH+ISmR2AmrpF4AIX/3amZUj9923PniH7Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Ym2SVn1THBZglFs2rVoJh6zL6qdfKxit701rdaCsaraJf1dG
	sOk5se1fLBcqYNfnH0bDfdpb1jh/cNsJkScBr7tUqM7vdo01eVcYfL/CkD9o8X72O2U=
X-Gm-Gg: AfdE7cmZygN3rC6Og8KEz4BvZ37QdXf5jsWCuKIXPe25olujhkWm1+Mr+ugHOArwl9v
	mZ8L6rApXvc5rbmv8SsvzwNzcoXICIcGHlStvaMJUWROvGqrZGgPjgBQOVig6yuakmK7RDTMd6H
	hwmnrP639Z4K3zGnpwWZ9xscr8VFuX2b3IGxGZSk2I5VR9N7ttRKLPsA8RMPEp0Awqi68/V15EW
	kRHnifKTTTpjnqH7g+SoJCcNkaNJTnXu6rsqFjN1sYZJFuaJe7wtW+8w56jyywfIcg+ZsCkHYqB
	wMvjuJjCN9YZuxsW2goI0Te82nh60VwHJ6WrPO6FPt+qfnKxJdF6f6jl0+ogFWfkRVEaRD5HHRM
	10+hlhCVEJjop++fwEYN8h1ZFmVh82YUi0dJoMeLqum+lI6xS2fN//f5sUhIu/TKF/FyrQtNXMn
	uLYQsE76tr3hu/gyYyLcodRzikzOs9ypMx1YEQuALu2yTWBNyNy3pd4QJccgc2aTQliQ==
X-Received: by 2002:a05:6000:2dc9:b0:475:f100:35fe with SMTP id ffacd0b85a97d-47f2dd475e0mr23261709f8f.59.1784196841385;
        Thu, 16 Jul 2026 03:14:01 -0700 (PDT)
Received: from localhost (p200300f65f47db046a548a0537ec1e67.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6a54:8a05:37ec:1e67])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634debesm23440465f8f.8.2026.07.16.03.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:14:00 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:13:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin
 tree
Message-ID: <alirExca4fzB-fr8@monoceros>
References: <alUAlBfA42zAOZ3c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qf5pzw55mbyul4ky"
Content-Disposition: inline
In-Reply-To: <alUAlBfA42zAOZ3c@sirena.org.uk>


--qf5pzw55mbyul4ky
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin
 tree
MIME-Version: 1.0

Hello Mark,

On Mon, Jul 13, 2026 at 04:13:24PM +0100, Mark Brown wrote:
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   include/linux/mod_devicetable.h
>=20
> between commit:
>=20
>   ad428f5811bd7 ("mod_devicetable.h: Split into per subsystem headers")
>=20
> from the origin tree and commit:
>=20
>   e73ba3d6ed03b ("scsi: zorro: Simplify storing pointers in device id str=
uct")
>=20
> from the scsi-mkp tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/mod_devicetable.h
> index a397213bedace,2673a1bd82c45..0000000000000
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> diff --git a/include/linux/device-id/zorro.h b/include/linux/device-id/zo=
rro.h
> index 5fdac81689839..26827b9b90b67 100644
> --- a/include/linux/device-id/zorro.h
> +++ b/include/linux/device-id/zorro.h
> @@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
> =20
>  struct zorro_device_id {
>  	__u32 id;			/* Device ID or ZORRO_WILDCARD */
> -	kernel_ulong_t driver_data;	/* Data private to the driver */
> +	union {
> +		/* Data private to the driver */
> +		kernel_ulong_t driver_data;
> +		const void *driver_data_ptr;
> +	};
>  };

While this looks right, I think it's wrong in git:

$ git show next-20260715~32
commit b36e50419ebc00bef45b574c6ce3e7edbbda5eb9
Merge: 20361c12febf cf1af0ccca54
Author: Mark Brown <broonie@kernel.org>
Date:   Wed Jul 15 14:23:48 2026 +0100

    Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/=
git/jejb/scsi.git

diff --cc include/linux/device-id/zorro.h
index 5fdac8168983,000000000000..26827b9b90b6
mode 100644,000000..100644
--- a/include/linux/device-id/zorro.h
+++ b/include/linux/device-id/zorro.h
@@@ -1,19 -1,0 +1,23 @@@
 +/* SPDX-License-Identifier: GPL-2.0 */
 +#ifndef LINUX_DEVICE_ID_ZORRO_H
 +#define LINUX_DEVICE_ID_ZORRO_H
 +
 +#ifdef __KERNEL__
 +#include <linux/types.h>
 +typedef unsigned long kernel_ulong_t;
 +#endif
 +
 +#define ZORRO_WILDCARD                        (0xffffffff)    /* not offi=
cial */
 +
 +#define ZORRO_DEVICE_MODALIAS_FMT     "zorro:i%08X"
 +
 +struct zorro_device_id {
 +      __u32 id;                       /* Device ID or ZORRO_WILDCARD */
-       kernel_ulong_t driver_data;     /* Data private to the driver */
++      union {
++              /* Data private to the driver */
++              kernel_ulong_t driver_data;
++              const void *driver_data_ptr;
++      };
 +};
 +
 +#endif /* ifndef LINUX_DEVICE_ID_ZORRO_H */

So the fixup is applied to the merge of the scsi tree and not the
scsi-mkp tree. The latter wasn't pulled into next-20260715 at all. Given
that e73ba3d6ed03b isn't in next, the fixup shouldn't be there either.

Looking at merge.log I see merging scsi-mkp is tried, the fixup is
applied, yielding 0fd66dadace89 and then `git reset --hard HEAD^`
follows throwing away that commit to replace it by
next-20260714/scsi-mkp which is already included and thus the
patches/device-id-zorro fixup is applied to the wrong commit.

Having said that e73ba3d6ed03b is still in
https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
without the patch preparing drivers/ata/pata_buddha.c for that change
and thus resulting in a build failure on m68k.

Best regards
Uwe

--qf5pzw55mbyul4ky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpYruUACgkQj4D7WH0S
/k7NgAgAk3ypt7pMjdm0gi5696Gfg8dQebe2C0am53pXzdO4tDaRzv3ypxm0bq5B
omOfnQMhiLRYMRmBOKouzvLjSmCTepRhKIKuCUacijF4o5QKybq56cRsoGrIrsOr
iRSyU19MCzJIqi7yXL+NSIhzBO0gVAeSbqKR82xDtBpzSw4iNt9tFErEh05OeQX/
2sc8ZTZeqc3MxDS0Hyak2jjo9tHyiWU9QTCYeyouHuvVvblidi9DCBLRf13Jybrw
FBLKV7LvL4FPBYA9/BUxXGWgVthtjop12tyjvv4MznKQ+KSL/ASx0iwG0MLm/Hu4
R5qxuIL8in/A2NhcH1yzcwDyZTwbNw==
=kZDQ
-----END PGP SIGNATURE-----

--qf5pzw55mbyul4ky--
