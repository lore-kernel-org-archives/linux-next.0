Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F1B31AA8F
	for <linux-next@vger.kernel.org>; Thu,  7 May 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156145; cv=none; b=F8D02PwleME/T85s/Y8R05iLN8jG+tF8TtCXSwIx9QomEsurLZfQ4HAXoVbLQ47ynC/4jGszIGgr34LKkkEzdOSf8uYxw/RtWtsnbMKbAON7XsDUXJ+ncWYVlKQa7FBqAcQg0KPBoIVXAtv+61BXU9cZf7Heegbh9yzpDX85cUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156145; c=relaxed/simple;
	bh=c0hToDKSMnxbi/5ufvYd8KJ5BjxBoSfijUk4UFSKZpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWikGktSVJivPwqoL0HvdWZg+dNzd/xhehPxEIggybkrbQJWmHNpucNaARrVslO6hMG+rhmhXyvo66TQ0B4yNx2BYYSGuB/GXY/jHha2T5JbpGtIFil+7bLHc0VyDHPpCkFzhJmGgBag14lkTwW8p8fbznQuVayRIj4deDZFQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlGsLoRS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlGsLoRS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso6746675e9.1
        for <linux-next@vger.kernel.org>; Thu, 07 May 2026 05:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778156141; x=1778760941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0hToDKSMnxbi/5ufvYd8KJ5BjxBoSfijUk4UFSKZpU=;
        b=YlGsLoRSt9kRedE0p2MaH9KnwpBaKFg2WlSI4uXQy1ECtdGR76/fK8lyWOaHHOYnO5
         DepzLwt2iAZNmAI525ATcaXzhBwW7oCYQv5RB4DSIAANV9ED91WJ644YY81M/vvwD4Ke
         iPHKb44yD+qxFCzNuCqhI/pPzwCwaCcxQkJ/WzoxvsCR2VbUa/7bKfBuri//RcjxRC0W
         y3y4Um+f0ffzrs5bcbOU97MdUaMrsQqrlF+DpW5z1Dn6bRUPxPoN4odlFxnt0W0pMIdo
         Crcmia8m+6yzMgEgczp60U2b0tlzo32rTmBTROj57dS2daDbq/UuwxYk7if8uX1HodfJ
         8HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156141; x=1778760941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0hToDKSMnxbi/5ufvYd8KJ5BjxBoSfijUk4UFSKZpU=;
        b=gkQ2gQYZLAzH/r5ngzwvVXPrKIjWpM9tcuNNvL8kATOsJA3FEo1dtfRYS1s8UPepy+
         y+5M2Cn940YCgGZi4dnAVdiCsoI87aQktd7Wc5V8V2ew4/DSd/lVYNzrdcloDnmqYX0w
         aW7DtIvsr5Qy7/0KZTeEaJ0sLp0YcuSsLrvFfl9fLN7wfl0nN4LeN3bcTsbw3TjIbHwM
         92cFWIQhxAbsJm+RVj4b6JDeOkXezhk5VzepDPy/jp2zIo9ozCXnG9C2FjMVeIIO4Qea
         bxNqo7JhNer6nddaCwVcDzbOH0/JZKPiEioCsmQZezq+AbRYZpY/XnaORfT9N55tD3x4
         FSyA==
X-Forwarded-Encrypted: i=1; AFNElJ9kGoD0/Lemt53ekMd3F4lzTUreGX8uVNG6UPNBtzBXn4Tueh6qjlUBL3Yf8/WxR2Weblg/fa7n3asI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyciwt8PnsXdxJpjptS/LES36qjIdsVTXHJQVVtg3L6xoDUPcvU
	WyyT2vVArIzHo6o9vdyX+JhZIIcQUawmHnhPwt1u5wIhtxgbTMXPUB8W
X-Gm-Gg: AeBDiev9RFY1TwXK5KrmdJlncXo1OkZV1A7aTTlLhsuRZ46mC4hc6QW5TmqUPH3HgbB
	zoN4UfQq/LhJO3f8AKTjxrwCxnvfGulPlnniO1Wxp9zBHLSO+eDhh+tarmobrbnK6Nc3FcxU0fi
	iN1Bm3BKG9Y2EXpqTCOpwD+NAvH4DZfSv7bMBIjDQQfdKCRKScXRU1ZVJgIp/0RsgWzHOOsEx8f
	Fig3Pf3TRL2Si1ISEoDGBNhOdK4cXfsT5I8gG/Sh1hF2Drfq+GiM8sosoDRp9XTy+aFdR2hqNpi
	aBGqh8L5pNWkPS1bN4rgyaZiWQDgUIznFmsY148Rmodm+gHG8yRVT0IczDRlNejKdvCkOHVHsud
	TZmhWvFwajtnE1M2PRJT7eQP4Othj9/cZFKCBXjdFyFEt3Ha7+d9x2adJqV6/r32SxuQGJq62kq
	cThVQEunrFYcbDsaFFjN+X7chae1NNjsXf/964OKMsnIfOtF8rGbAgtEEGjAgLfyt7tVKzWESAQ
	qHfB38FDxy97R2ImpHuTlAp
X-Received: by 2002:a05:600c:871b:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48e51f45eddmr121794395e9.17.1778156140136;
        Thu, 07 May 2026 05:15:40 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b212esm52203795e9.1.2026.05.07.05.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:15:38 -0700 (PDT)
Date: Thu, 7 May 2026 14:15:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	DRI <dri-devel@lists.freedesktop.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Maxime Ripard <mripard@kernel.org>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl-intel tree
Message-ID: <afyCC_FE9QL5VBBm@orome>
References: <3b729608ad4bc3bb161c3779a9768b12@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zxepztxp53sv2ewk"
Content-Disposition: inline
In-Reply-To: <3b729608ad4bc3bb161c3779a9768b12@kernel.org>


--zxepztxp53sv2ewk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the pinctrl-intel tree
MIME-Version: 1.0

On Thu, May 07, 2026 at 12:47:48PM +0200, Thierry Reding wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Sorry about the misleading subject. This was indeed introduced after
merging the drm-misc tree, not pinctrl-intel. I need to look closer at
the templates that are generated.

Thierry

--zxepztxp53sv2ewk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8gmUACgkQ3SOs138+
s6HcUA//TIusmk3FnAe7we2CgaOJ+sqg8vpo8WhTR3tp61urf1xbiecKbG0xC7ou
QJykdzlYPfSJYlEnJrSEakUAfpohy/38qKYtmguUVBfCH2YA3tuCFVy+9ElidkpF
QWbUwHQ5NjJnr5rMIVnZDzcOM52NWfozCF+nXS4JRwA9krPK7FQI+yftv/ystF+c
o8ur3EofGq6BQg885XNFd2FRGlsJsYBA9v6OWwKx4M83tKvlA2u65+vUPsNbo9So
X+7fBWqK3P9jf/r0gBxImInqgkPcNwggNMG++u+Ngj9dxaNa5UDRAC+DgqJPAMef
8C/2nofhRjWRSHxlWSgoWc2wmjUOFv85G3rQDr5cipG0b9Ws2b0dJFPCJf3wIaUU
bYRGl3OoEMI6TP5vdNnST0P/Z/9NFxRWpBEA5tVogpEbVw29mfTeLzlQzNorjppq
ldulosvdNBuRNUhMelHYX6DQ47WmDSdCJBfLtsSvXiiEhtYGHmgg1Z0GtusVAE9j
yEWdNbQi6hJnj69wraT96UeW5YjTQkRqWlAcAYiIkQ/eUWlv85ComEu/IQZNsS4r
qYw4RSmVUbhAcPT1LBNPjYqQDc2kEESrZRnYWFXv4EwXvcDFgSpXIQO3YhHRXASd
GTByz1YcHtIBEjIRkVUGiICQb8ox/Fq3/wdK/F9NTLKnA5wzHcE=
=NXs4
-----END PGP SIGNATURE-----

--zxepztxp53sv2ewk--
