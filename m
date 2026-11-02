Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650410;
	b=PFeQ2rNHVOUC67HS0m1PQaZS2fZnxzG79KaYN9GUsBm84bZ+JyZnKGeTCNHYRQR/ggNF
	 HwLbv04I+weOpUX6c/HBY6aFw2i5pKGTQfP4tyu2G8o0J3wfX+liSidRusJgYSRadzzdr
	 I3y+0a7uZ6hDzR2VJ8foAqlEvk7USooB3xRDmAisyjgrXTaRPwtGAO4CLuXNgRcRyPnxa
	 I7Nu+r+YyKxXP/x16tkX+IbSW0wQx/vCNovZ7BzLWIOml3jSC7WtamqMpQd1QQTAsuplT
	 HvYKM78OHQlk8hBLGJ4fSmzNlQfqpB8t9yJVGCGYJgj5r5+fvUxTav3I619jDYRSt6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FVDSRwU0Ef+w5+SWcEsrpVA0mvEk+RhrtmCbTUI0zTA=;
	b=LJ3AKwZBraqXfAsWtXXWYUHctPQt1OzlN/r1YFsj+2uSlt9dft1kLB2AfcZnpMCf4wIO
	 Oz3g9pzHdnuBKLfbCeBhN5cqbZLn4fIKpTomNRqSEbPuaQYwvbeygI4N1YncJ0xaIhAD/
	 idRDcy7fEbZ04pc5abp2yPaPnBdSkU0RoZP0G/lUTI9D+nIN4DoINFlS6f8tR8ZRO5xxc
	 R/n5EE/UePbGYvdhJVslJa2MFcnOJ/aY7xvBfaLXFPT7HkopmTERNXQ87oF0I9NWkDf7c
	 9L7729WFTtzboI3tre6eI3rFnYaDRiSvqdSP4ZbPMQflFLtvzHwS7oXcTEHmTltup7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+naX1s5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE8606A326
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 20:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1BE8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+naX1s5
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso30327931fa.1
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2026 12:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650408; cv=none;
        d=google.com; s=arc-20260327;
        b=H1ozswSp4c5CbvW8i6kktdN/hCQOc6Fk0+1uARbi6bmX7WZKoIWVmF/ForCOptI5j6
         gmmxI86aWORshnUjTr19q2Rb6qg+rjjoldPsiCwHu1SGgacMEv9KDgo3y90fBP1aMjFn
         x9tIhIcp9gsS0TDdC3GxcDfrQZyij2hOaN8ecegaZOfWFZxIBASW4zNP6cmuW2bF/4FH
         NqrxCwG+QHwbu4qGReccRRHLF78dfAMqzJ2SbShbWSezWYnqkBiHwrfaSpwADulCptRs
         wO4dn9wYR+pQYlip2cpuY3ebUOlcPZYRcy4ocWro4auXYzoUDurlP4JhMeA4lvbe9Gk7
         jiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVDSRwU0Ef+w5+SWcEsrpVA0mvEk+RhrtmCbTUI0zTA=;
        fh=28Xou9ptKfrbn+8CKsJLihGr1NK/3O2kHAO+AVE9S7Q=;
        b=rTZksYIFuMExhuf+H3vok7DeMmBqALcBDJYJvtTgLzj+LNDD6G9U+Ykl4nXj+/e1RI
         sN/pZgXLkX+/9ukqPYftC2xqKXC/xB8n6ZIUZfc+pb3Oup5zvN6AVAjlcyzeFF+G5m08
         ju4tS04Zwjl0ZU4pwstUusroHOyaqDtq9i8qO2ZeJaBzjJNwU2jGpY0QMypo1KLFBFaP
         MwSfCv2MA4+NDLxc/w705bUgO/DNY3u7jSuvXWBpbPxxpU1zfA6Ayiqvo/5dcerOdXiR
         rWo3B7vkf1ufVUJYbrKrRTul+JNH/YCYGxph9VWiQvkBa0TxL3cusUMXMjo9xFMoBdxz
         LHjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650408; x=1794255208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FVDSRwU0Ef+w5+SWcEsrpVA0mvEk+RhrtmCbTUI0zTA=;
        b=Z+naX1s5CO7asVofOWxwKKl70WwpqOtgLSpZJEVZW86XA25b4XswD/58oXV3pxxNaa
         D0jFiiBDntQG1xx99BzN7+pQLElbmz8b5cwNxpYzSkQ/7wpOxF3Yu9/igwX7sQXQc8/l
         Kf0hM9EXVwpKUv5eKdQAHEbkbKMPRwtrKziBSnWSMrGFAO69NG5LlPSqkUOdXEpQ1yBL
         vLxb5QSBsFRl1ZTUJOp5W9EY2wZXc5wY8R8fFnPk7CM2LJXy5otgiCEYba2i69Sggjvm
         E5bcsROomJ9/kqOm4hTNMgKBofBjQnCbXoNZqCWdIb4pzMKupB9TlhFasW3JIVZC/6cm
         ax1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650408; x=1794255208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVDSRwU0Ef+w5+SWcEsrpVA0mvEk+RhrtmCbTUI0zTA=;
        b=dfXJyQtidUtBQp2xi8qUNhALAwLv97dMe2/ov/hVs5/R5gjYmYBkoqHp6IDHfdXCXt
         s/Yy/yVTSLeZcnKQ4iuf7FL6pqxWB4YnFLy/T4CZXa2N/3aSuFvrpINT7Zd/jqgpkDIH
         SrjELVSXUbY+QCHWH2XSc3LKrww2xivE8A9xQSQswFBtL3gf02D0jW7VkS5NZyqoMym4
         EfkHHHXFhY6DPzUL9BNCRHgCeRXQ0//GjhxlUa08h6mxTaguIyXVV1px4Id2snQPPp0T
         Oorcfzu+A9lmsOuHV0Gj3lVbqq+2dkrj+W/dtIvN1GkRniDW/9PBgQ4bsUyVGbSGvnur
         KqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcQZZiuJgj1RzowYGJi6EIapqQjNcT69WvMmxbzi6dBmWHQ37j+mNt48rnMDUP56KbiVjdIkm7xkHS@vger.kernel.org
X-Gm-Message-State: APuU4Z/zpZtZfy2anY8rdXLVzNb38A3Sw6ROJFIalFon0e7zvJLdzGcG
	i1TkVhMYc/CMP7c//cGc9ujiGVA3xAfGx8O5Q4Z3+1jJH4vNI0rwHXMPpTw9G1bGSWpAMnB3asO
	OhpkCevhaI5qu8/dZQ1/0e2ON/QZYWB4=
X-Gm-Gg: AYBFou3tnDfJPlzrgCsrxC/DhjDSUSkLODfm5GhQYVgV0J4nUnyyi10jziTRPaO6YQ+
	sYpoQZ248rzfCWnwpHGaUmEGRoXPH8gZKGyocJHHNLljCxOruE+cKOLknFpT/ctUkaISNF8r+mD
	3tsDBS9MKAjE+gdSWVgcRIHX5YUgySA2GJP24sFg4YR+E2OvzEVg/COkYVxbADOzSXJjW66Sk7F
	xWGEby+B9IuslNh77NhyR7lSp9O3xI75QET4XAgbDuHKbo4HDjjMRXlW2Kvb5kmi7ILx8as7I3o
	BZpRSk7wM8BV4EB1ttXDyifK+SYr/cQKI6yTD3WuXc74qLvTOrw4FGG5cgrQy6Rv1B3hCvM79os
	oVFLhhA4NULOGAegXc5mz+6QcskuPmDYbiDSbPg9nSFbbkh8TVR+X0Ke0E8MVmfb4J9pbVJFW3s
	uw5nZ7+skuXjLgFp86UvGzg2tRIHX9KYXXTzXrB5tzrIMuATvtKg0B
X-Received: by 2002:a05:651c:a38e:10b0:3ac:d178:4fad with SMTP id
 38308e7fff4ca-3acd178521fmr5377081fa.29.1793650407556; Mon, 02 Nov 2026
 12:13:27 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
 <3307ed7e-27ed-4892-935a-2d25693373de@sirena.org.uk>
In-Reply-To: <3307ed7e-27ed-4892-935a-2d25693373de@sirena.org.uk>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 2 Nov 2026 15:13:14 -0500
X-Gm-Features: AclHuK-E5Pmw-_Agh4zoD2sXhSQE_lRZ2xfDAl2oVR63wsJfjJx8IDPb8gRsKWw
Message-ID: <CAEdQ38EvMHja=EyvAavm_X3htTwBvZw5RC1fHN2YyqbOMB_ViQ@mail.gmail.com>
Subject: Re: linux-next: please add lindholm/alpha.git for-next
To: Mark Brown <broonie@kernel.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Nov 02, 2026 at 08:22:42PM +0100, Magnus Lindholm wrote:
>
> > I'd like to wire up my alpha repo into linux-next, could you add the fo=
llowing
> > tree as alpha-lindholm?
>
> >   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
> >   branch: for-next
> >   contact: Magnus Lindholm <linmag7@gmail.com>
>
> I see there is actually an alpha branch at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alp=
ha-next
>
> Is this an additional tree, or should it replace Matt's?  Either option
> works, just want to make sure I'm not carrying around stale trees.

Additional. Most pull requests will come from Magnus these days (but I
did submit one for v7.4).

Thanks!
