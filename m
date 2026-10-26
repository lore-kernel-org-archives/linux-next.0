Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793059076;
	b=f6hvO0vYLgnbXZFhiJGC7lpRkMWi6RK5PSkcZpZBbBqcHTEscKfXuRyoBh9Jnj04rolK
	 a/US7BTsmiafEOT79LFh3+PYbxO/erAvYXFjdXbVLadaYaK7OOmEaJAVpIrUnYRiYKvNi
	 VpxoiD0PsCWxhLp4AQidRhox4eXTDBVkznwgRcWmjgAGIoAiyEo1uo5GFr78/RoDAvtlL
	 NniqBLkXBRacpVM/Nm6IxOCqUz09162zkjO/jGEDTeWoJ2JG/OPKKO2lIA6HGFg6WXE1B
	 xYeoJNtP8AnuJeq8NKtQGsM3S09UShEOodsZ8cLNdxDgfFeSnb4Xn+U36vCOF2xJzQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059076;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
	b=l2T5jxqZhQaGI+Psqe55hywq6Ay01PvXqagAl4uCmTg+o/colkK3luuXsgYrtHlKL0ZK
	 aPEZyzx+M+TmorzXnsaet+fvB0KjSHZXH48leMzTAgb6402riJ2uge2NuVtZwi80k0oPU
	 NAlFRGNaEnoZfCY07HLV5e8fKQvvrvEiWyVuy+Mmw7N2XIrtEAslk8mZ8K3WmPFNKSrvF
	 3lMg4hh2o1KRal16L+AKw5Xfk4xGZU+0gNTZxMuzHM9jtA68GjWz+Nh7peYoGsChfwzD/
	 BvYsRxJmNtAcr1mGdRMBhztOxpNt2AlC/JCvIoBKQHU/r4tB7DGfk9QES9Fm6alG0gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WR7GTEFm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZK4DmyvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B32606A327
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 23:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WR7GTEFm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZK4DmyvM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793059075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
	b=WR7GTEFmg81+XIXK5tSX8qWlACX11FGS7Z+szRQz4L6zfEA8Thnte1VEtZ1a7vk62mdFI2
	fmeLqwzUCo5mRAm4sr32layWhoUHY0hAgt74M3XB78ANQZH6beYDwAMPsdyEqUoHjZRbc5
	fR5XBnv6Mi30Rv8aw29u0ZwVRz7R7gA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-AvyKGHTMNtqzTluIFe96vA-1; Mon, 26 Oct 2026 19:57:53 -0400
X-MC-Unique: AvyKGHTMNtqzTluIFe96vA-1
X-Mimecast-MFC-AGG-ID: AvyKGHTMNtqzTluIFe96vA_1793059073
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so279372466b.0
        for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 16:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793059072; cv=none;
        d=google.com; s=arc-20260327;
        b=dIs2k9mpUV3tSjxUTwyoK/gHALNzSz7xCvm9I2zLilLhrYnI+RZz3FUKGD0Wo7tppG
         fDARpWxE2+TghEc1dRsVDJ4TwqXJWfdEmKJy/ELhTs3A4MUJIpq/B6AA8CQ/YIHslzer
         FoFKsMCYsDWe4fNj2tWJDpUeEL7wHzP/K4yyacZBt3ow3FKyv2BExGQ6wp6ZBgkNSrHa
         KgTjUXonrtG6QhYzrrFrLwjytLsAb1C+HQ7QpADBrG7JM9ZTKCr69abUwGfhmPrd46Nf
         3FjGPhUJlNfZ6r8xB0qt1fN5T2lglhS+YIhCi6UH6tPaxscBOzDXB1+UtCoJnhEx2llP
         5SXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        fh=mXwzA0j1Q6XdfEgPXNdcW6kC8IKqOVfQTvf/ohzsRW4=;
        b=DnoPabPYVzKHUUgyps4SMrTpk64wOJ6QX4sPF3agZLIRkVpJsLfe6gJeROjJnSvodu
         OOjyWj+3eiYzOrvwcpzmc1WP6l2MfP2b/7V5UUIlnuGzqu9bJ5wKEU3IUzyZO/nwYu6t
         L2RWqEJzLEBl93vNYwApzss/t8UHTOyiyLLO6mv3riflC2ChAbV1Zex3szioj/o/EWG2
         2UTakpmmJIJXYEuquWA4sXD+wXNjh306D/TDUcmQmyCpkLxmOTKChRj7sOMcBNVQ5CW2
         /6igX6cAXc4odoPmp2dhhjhxU4tbwQHjB9CyyXjnGRW44S7bFGp4iMkE/v8ANdtQM+Ph
         GTxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793059072; x=1793663872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        b=ZK4DmyvMD/8lJzjBQf2A5evasCf+fxkCYI02NpCw8kzvrXiatjwZk0zAVcnI2gumlZ
         2E4uepEOJL72Wuee+L03ah04BQR85T1r1T4dVtt8B0Gn7TIEDqive/dlm8F5qhUkgKoj
         AtRGvU+B+D4gzh4dWNJq99HHfFpmoUNcJ71nvy3rRg8QSNIeiNDLRs5yJ6mopGfhPJON
         SBqjBMkokFqeG17sCUMgWVU3okEAq3nu5W8bbuwH6dyLt+aUml4ze9VqrMZbtE38yBE5
         pWZ8UKAS1MVtIDVDf/sGlC1XODgwiFGCTFCJaluj5qLNhg1//AJCCSVQc0vgein9EhnS
         LJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059072; x=1793663872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrzOjAFUeKDN/eUqCFBx2+QDZdDKBVw4bOF5yFKNmt8=;
        b=Qez0xoGPfjdjbJauXudkmM4H0jVGH+4xA58LSNfiqFZ29iWhYtcITI6iCPy86sZb/q
         YlXhbfOQJ7jf0PmzIveoGbLyRUAM26DDXb6RsMGplliCueFDJgNt0bjbp+5ouaqPbJyP
         9sItLaaQQutFaR0ZlM8VjLf3Ld6VANq/xTN407UltcZKFsUhLuTgRujgEL2s6aFj9hBA
         /ONFevyWfzJs1vfEa5IeZJ8jLh/iCD7jxfGQM0goI4fKMIJJfteV2X4B0mN95NiGBbOP
         ijBxo8zI/RgLc3GGf6ejN6etFJWM4jvQF2VgN6277st0N0JCmukbHY42tu3mBSjLPrGH
         XtVQ==
X-Forwarded-Encrypted: i=1; AKwUvByE9ZR0ya45L5/UpE0XEAF4cJ75QwPCQ+Gm64xy/m/XbigeteyRhXsSUTNbAE8XrvvaFCr+1PKmdMVj@vger.kernel.org
X-Gm-Message-State: AFq9FYIUlTG3O3tzIpJzdh6wsP1Eo5BVAESRcR0x8xDS32tqCyNIRSry
	OC/RxJ2eBOMnTviTt+otm1G0O4NvXsuQIFdatQBF/RpDW7S6WM9277GJSJ0RrMGUcvmGO/G7/oN
	mfkyS0qBOcbQscPPFEgSFWmye+V/qwhIYskCKe/C7OToQcLNoLGd+DtXd90R9Iql8Y3IweZccl/
	dRxQGc0bqCAhsjHLvGFRdzbVuwW2f/HuiOmoahfA==
X-Gm-Gg: AYBFou2ojRouxl+ygwgsBrnu2h7lYN81IxW4hpuuK6rlFs1llVAmJEuZcDKFsnMbx4Q
	+8TPC1pV4tMyGPRa9c/u08PSnvRjlMek0S9GtGUOyRdB4OSeJwM10iKy3NCf9XWrG+1YbwD6fkp
	5WFxEZLMYTS7B4Rsqbk6i1UZ5hOmZy7aNwz1ZPRDd0ZZxW3xTnGJZZYRdjFE2VNL3jR+3FIbcDB
	nXbfjuzPzJf9z4=
X-Received: by 2002:a17:906:f59c:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c46bde62669mr982024566b.31.1793059072572;
        Mon, 26 Oct 2026 16:57:52 -0700 (PDT)
X-Received: by 2002:a17:906:f59c:b0:c46:7ec3:fde7 with SMTP id
 a640c23a62f3a-c46bde62669mr982023566b.31.1793059072194; Mon, 26 Oct 2026
 16:57:52 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar_0GFOb5hZfhHHx@sirena.co.uk> <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk> <atZqw7pdZjMwahdf@sirena.co.uk>
 <at9drMPrv1IvPovj@sirena.co.uk> <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
 <at-YqCa-RGEv7IJ4@sirena.org.uk>
In-Reply-To: <at-YqCa-RGEv7IJ4@sirena.org.uk>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 26 Oct 2026 19:57:40 -0400
X-Gm-Features: AclHuK9rafwiT5sMTFWEhdKWjRobeMh9DoBW_vUnJtaI7_tfFhl_74ljQgjwZg0
Message-ID: <CABx5tqJnZi9KT67RU47PLqR8tQWV-TL3Y4SrUyzWvF0B7AE68g@mail.gmail.com>
Subject: Re: Missing signoff in the clk tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Mark,

On Mon, Oct 26, 2026 at 2:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Mon, Oct 26, 2026 at 11:08:35AM -0400, Brian Masney wrote:
> > On Mon, Oct 26, 2026 at 10:03=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > And today.  I see the commits were actually done by Brian (CCed), who
> > > also appears to be a new maintainer for the clock tree - I guess the
> > > contacts for the tree need updating to include him?
>
> > I will fix that this evening. Sorry about that.
>
> > Jerome and I were added as the new co-maintainers and we are listed in
> > the MAINTAINERS file. Is there somewhere else that we should be added
> > for linux-clk?
>
> Yes, you need to tell me about it - there's a separate list of contacts
> for the various trees in -next since there isn't a 1:1 correspondance
> between them.

I fixed the clk-next tree (via clk-pile). Sorry about that and I
definitely see now why not to rebase the tree, especially with two
co-maintainers!

Let me know if there's anything else you need to do regarding the
contacts for next, or if this is enough. Also just a heads up that
Mike stepped down so you can remove him. It's now me, Jerome and
Stephen.

Brian

