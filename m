Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027338;
	b=UN4TFv6eZY85whl0FV4mMm0ZqSAAH1NsKmc9fYOmLgzr8W7tDFxM/RNoLecjfKXyPJqu
	 IzKTJB8nYKkChTnFbRih5EiaOXDXPl5dkcL6pjE0IpCl808miGHR6tiGnumMKmCUi9SOP
	 vnDeudycFfcWZMrELVf4Krq/qRe1ONIUMSV3YobDPr0uOlT75ewQ2/DqUllOld5YBlx0A
	 nDHA3ZyQG3YeRZUQVYFX655XUyZnJrpa3HkiHiCeRCszDdLUYY+cYSV9cLa1vGSMzs82W
	 GIK/Wr7DiA93AyYm+2K/Rm8dq9CNmfuvUoNrk6lRYtxH5zoNlhDSEPCwoON+Cvmnxlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027338;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
	b=q9gpkGf1U9ZQ1qNHOpEd97mnhj/X1OxAf4UENnoP/NLQTlzGjQgkrLCCYX7rKs2E4dNU
	 W3vXTK0fkfght1PYA5nydrpAhXT6+mC+bqC82WBDHypk0qge3urCTSp0ya1Rd+sb4ZIsO
	 +RtRA2rXykYG2c2sHEIMgabPomY+kkvl9bAPOMAQM5fZZ9tPAjUoUFN8g4s75QOAVOJs8
	 LmBaVEhwyuwJh9PFK1NqIgwTF+RXi4CkmUM89zJj5ZZIcgyvL9QEGweBdkM/62sGj54ZN
	 IG1K9vPFFXOOwYf1kujkiaZn6HnIkapF/t/B0YunsCAwyMPYV1h5djVuSjCGm7qOnQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C6bK3v9u;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkO5XjHq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06795606A31A
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 15:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06795606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C6bK3v9u;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkO5XjHq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793027337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
	b=C6bK3v9udFz+FVRxupaRGTCHs8rtSE7gJo7erB/UOmWqvuz7Nq/38wnRfcd8mXLwHGcnCb
	Wn2fJOBQAh61Y7ARLIbRaEW3+F+P66v4yAgDFsGieT9EFSJNavEOTDkXLKZgAyf7na7B5u
	IkLGFGC3oV4/Up4pPNQ+GNh420y2STg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-MKdsn343NgaNTWxHAAEH_A-1; Mon, 26 Oct 2026 11:08:49 -0400
X-MC-Unique: MKdsn343NgaNTWxHAAEH_A-1
X-Mimecast-MFC-AGG-ID: MKdsn343NgaNTWxHAAEH_A_1793027328
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c42394d1e41so261674766b.3
        for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793027328; cv=none;
        d=google.com; s=arc-20260327;
        b=lAuNcpuMrVHSZGszRQ7qyt4gy+8jTGVvAis9nJx7K7nvicPbcRQTftlYH7eLkWGlIp
         acR4YIy/22R7AfEEausSXXAZL1buuooCwcmt6+zkC6/usUL3bfPmCklymww+4QLFDqvo
         bNaqKE7GybBVjn1zpiulhh9nS/7i3wdV629aA6GUZXVYbzvZrHyNKgP4o3s0IIpTcUBv
         +cEzc3M4g1BJ3AdT5GNTxA1MTHvQ7M09BMNcRaAe8NxMWlVnmnXxFbu+M3GIZ+z33AwK
         1J1pmgFjH9/6Gn4RlGoF9jdYVbmEVtbLOxbiodGKEva9VQu0+ua0gMkY6+0emai0mRj0
         Vf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        fh=ynN6CAFwo9X1sPFEUnUaVB5T5sXhinKHW6GhAwfg1u4=;
        b=AWcfmaRUBvY2hdBjuGAdQHzgpY61jsLC/O5cII2FqGGR3sPBlJZI3m4b5ZFqy5JbIT
         kCQJc9rslwODpeqKtO58YgbXRdtwE43MBl96LzbRHWu2yRYGtvkhT7aRcHQRcf3JwaD2
         zJYt0L/HL39BVrdFBdhGiBUVF2O1fsf2BFo9VYqiesCNfphIANOMjfTG4IvnYIvqqvRH
         A/cDaAOBc1U85cS7xYMtVhRu/elZAqCK/JlGhNPBm/iKLLUyUcQEdfip4R3N+/ByOcDE
         o+j+L+8hfVzkI5t5rQciH5kyGw7T/Z9ycvm5raqw1SKZYqFgKbqpev8d0FQVf8k3wmkN
         CibQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793027328; x=1793632128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        b=tkO5XjHqaDmMahSaJ+r47B8XNVGH17+63wts+4WQfuobHJy/rpApfEaxCwDGCMCCkH
         1KhWd5sDm2MKVmi6dx9XNldGse8t6qD4DMPZ9VvpNKtGCZYpdhURDcTaqaPOZBc6Rjou
         H4mIBf9uR7Br7MW+Te4OJ2O805qJ141iXAewczsro8He+U2SwW60NxLjC3Ui50flxIC8
         yiN9WFPT3XQHtzIUOIgJ5UBvMl2rqeXacEYnZuqh4NbfPC071ShGY6cz812Tb8LmsHo1
         XmM67qHrSVuS/RTRHgU/Ul6x9S7qhbkaWUrjreJWWUyDHXG1Aie60jO2hlU1MgVB7CgY
         XmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027328; x=1793632128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        b=g7K1bUldw0EMFuE6AVYM8RQP7qfwOx5In5Heup3/GXkq+jsahvvc0No6pDbo9lHNJf
         1OdWZUlJeYk26LtMHr+HhpZWMi0tngDelwjKazo0dBcJZ5up94QAKbG+p/zEJuvI2uqL
         P01Xj9gjAj6lQzOXcn7ZqVFDf4MlDgtAR7vjEv0MYM12/tzBQYRoZHn9FUi0C5EUGz1j
         GbhOFAjIErphhRwQGIn8uRJfqxwJ78M6PejUj9Y4zozf6ROEETksuMwlMNarp+QkwXVI
         Q0giJg45bHDInIi/lFtiGp+5wvhUYkkhLyjgLjj7VUZ9uDpnLkHSvjdtS5CXO5QHI/7Z
         5oCg==
X-Forwarded-Encrypted: i=1; AKwUvBw6Exbth7GI0DtfDzFzAe/LsvpBOUjAHsMlzD/ZDmE5HbfFbFAgf65kVZ7GMxe1KEaAfbqm6IQP/J8W@vger.kernel.org
X-Gm-Message-State: AFq9FYImNerMack5S4/EF+RP2+8Q0abekCu/yZvC9hdnnC2+GjSTiPt5
	E1H4ACr/lIeABa/bwQpl4Iw6FG+b6ZDdCprPnwOvo1kvOtgxINf/JgHu1z3N+CqwlG30dJ//ekm
	v4NkDrQNcXCZrPl2tFRkaCjX3ErsK0lJMf78ZD9Trn734KJhoooPNUaFAEynyk/2fatid2BYWLs
	q+0ZdkpUjGB3kBe+0WAwzeiRVKGYJYBWWZtthxleTqRmGzPg==
X-Gm-Gg: AYBFou0jcA7+uRoaX9S03FKgNlgBIMoxdp7U/810SyEGQ2/BpAa+x5OpSbFhVvKEusV
	HYkAw/V2X4W3ZA7pBEEoVCI3QXmAwUM5pGbuq7fWX1PtTWGY9/RrdVyCzM+kxvsY0mdc+60CeU9
	ilnPhcA+Y35OUllY3SFBGMQbvgeSsxCSB/eIU+5swcckbwlIsun1oEJz1nv6kunGpOjzccgHAwx
	NCAbL8VSAvW8+xF
X-Received: by 2002:a17:907:86a5:b0:c39:34ba:2f6b with SMTP id a640c23a62f3a-c46bddfd4a0mr837726066b.26.1793027328468;
        Mon, 26 Oct 2026 08:08:48 -0700 (PDT)
X-Received: by 2002:a17:907:86a5:b0:c39:34ba:2f6b with SMTP id
 a640c23a62f3a-c46bddfd4a0mr837722866b.26.1793027327916; Mon, 26 Oct 2026
 08:08:47 -0700 (PDT)
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
 <at9drMPrv1IvPovj@sirena.co.uk>
In-Reply-To: <at9drMPrv1IvPovj@sirena.co.uk>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 26 Oct 2026 11:08:35 -0400
X-Gm-Features: AclHuK_6TVR7BMSJB42PtVchv_9brsV_tlMYihX61z569i8dPulhRABKPASeGyg
Message-ID: <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
Subject: Re: Missing signoff in the clk tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Oct 26, 2026 at 10:03=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> On Mon, Oct 19, 2026 at 08:08:51PM +0100, Mark Brown wrote:
> > On Mon, Oct 12, 2026 at 08:01:34PM +0100, Mark Brown wrote:
> > > On Mon, Oct 05, 2026 at 02:53:25PM +0200, Mark Brown wrote:
> > > > On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> > > > > Commits
> > > > >
> > > > >   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT pare=
nt clocks")
> > > > >   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWD=
T parent clocks")
> > > > >   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX de=
fine")
> > > > >   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missin=
g crystal inputs")
> > > > >   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in t=
he driver")
> > > > >   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on =
probe deferral")
> > > > >
> > > > > are missing a Signed-off-by from their committers
> > > >
> > > > This issue is still present today.
> > >
> > > And today.
> >
> > And today.
>
> And today.  I see the commits were actually done by Brian (CCed), who
> also appears to be a new maintainer for the clock tree - I guess the
> contacts for the tree need updating to include him?

I will fix that this evening. Sorry about that.

Jerome and I were added as the new co-maintainers and we are listed in
the MAINTAINERS file. Is there somewhere else that we should be added
for linux-clk?

Brian

