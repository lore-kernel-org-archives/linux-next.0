Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279531F9A3
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431607; cv=none; b=gslKfasgk5/nJNSDrWrPcv4vi8/+EnMwJPSLj+e65jd0fok/5zd8UAUutFd4com+5cFavQ1NByEHrI4AXjFFSkj6HE7m4N2jV65OoC3n251aDbaKrRtxwWxGofqD/SuT36rMeAsJz8+GeW+8uzQfcCEVPUX8ST9SaMKM7Vdqplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431607; c=relaxed/simple;
	bh=q/OrIIDlzHmkXFlcqK5Ysg6z+f5nhEcA2FWlWn0+c4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAOPkq2RZlGQYpjAfI9Lh9xYc1Nq5ZM7txELDOZNc1n0TNYKFZA5sPtnTutqQRERbFcsq+B6cZFX02c7k9SaVbYhqrV7LR5qGAPdkH8O8UhXvb+wI3NpNpnnJEwl9lO8HH2f+n0JHeSqQYBL+6TuhpudAXafwEnElARVs1sMeeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZSRL/QY+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZSRL/QY+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso19784433a12.1
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780431604; x=1781036404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VFuxKQYArWlXanB/J6xmyf4reNwOyJ6y+DrCmEp7WGs=;
        b=ZSRL/QY+ddnB6gNIoVFL1ruqe9XKLQ6CfGg64wipK5TCPJ2c65DS0648NPtdk4vexU
         vD+NcZJAwr1dInS5P5ZnUNRuIcGZva5jCGZABfYRyoysPDTRx4iIka60ZMDUyx2mbEX8
         In83MyIBPd1EjJcw7mdB7oBkOssX6QfUUUYf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780431604; x=1781036404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFuxKQYArWlXanB/J6xmyf4reNwOyJ6y+DrCmEp7WGs=;
        b=V0fVjaO0corPMr0gd4wyhZEVaVT0mqqT4qhFez3gFOd7HlPzvqkVrmY1icMX2zji4Z
         1tVX4eKJ6QkoWzoL4AV/fo+G8LbipAMFlB6rTvfVQqwFY3lbloKARxUxI4ttKgvyduWC
         jGjQwf1ratAaSfn7FpY8mUGhZaTypHQUEup54v8kojKk/008FsEWIpTDUxUwthKJDtmc
         c3jtRBuDtuv69QqsyuPvHXHkpeA87X69JwWxvEwq1mlCgzCUVMYvyPjBOh98a/qEYWum
         fAGf/4TCPvsJW6GHIQTwaxEXWXlP6WPEQu+TkYQ84SWtQ6pGtpT9LhWPOZ+wRRY/RUQn
         tOEw==
X-Gm-Message-State: AOJu0YzprQfhvJCxBznAi64idjdgX5ibM757vF81r8KXya1oZrh7aAKM
	h9H0o0ECgc4LNYkbZEN/SmRCENAACeDVilIkvvoT2xWI9lA35BFWOt2YSBpGpL0dDM1kNkaMeMG
	RcJBy+lc=
X-Gm-Gg: Acq92OHsv+48vHGyOpnJFFxx0Uipi9JX3IjSrdK3dAekvXt8TwZeBZEOt0IpSEDZK5u
	AmHOsrQoEl1O/81TIAM4tcQbmCvw7myulrAryAeodrAPU0hrW26eBi4TrFJRGWlDhXIAVJ65P21
	h4RS8bWQ5ssqf1jUud2q2Z+3cds1n3147lyZb3O41qeYhM0U4S3BmySU+XWsTMcoGFfswESnQPj
	pFkcb1sE8fK8UbhrA+P4vfH8sHZKXYqbIhZruGDEUg7AJmUSAAhCTokfDD9u0nwx9HGRMVguadk
	ygJG8tdh/bAiSodW7JsaJAqMPYwkLXYnblEjRKOgjOtIRWALvsYWTtot6xh74ALM+oU0wbAfxSZ
	ppD+RMddeyST9iGQ9UL+tHo4XHWm6NbLWk0miYvF3iQLJnGtFpm+Qtnk+yFTsA2KKeqzPUaoXfd
	x/zNkbGfzjpB2SvB1nTLxivf8CHkrcCqUzUtWVCBtVA/+TW1mjaRYLD6zuZ7K4s2Hj6sp68Sn4N
	IIpMUHNlLU=
X-Received: by 2002:a17:907:cb89:b0:bd3:1b13:7114 with SMTP id a640c23a62f3a-bf0ab211921mr3279466b.37.1780431604507;
        Tue, 02 Jun 2026 13:20:04 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c85e76sm35638866b.15.2026.06.02.13.20.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 13:20:03 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bed19623d6eso400692266b.1
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 13:20:03 -0700 (PDT)
X-Received: by 2002:a17:907:2da1:b0:bd1:fe8f:59ab with SMTP id
 a640c23a62f3a-bf0aac10b48mr3633066b.23.1780431603613; Tue, 02 Jun 2026
 13:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
In-Reply-To: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2026 13:19:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com>
X-Gm-Features: AVHnY4LEeABBMWzs24VXt8BeTcDbDmqR-DEjfB20MqdIVXabsj9ZA189mjSTvQk
Message-ID: <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com>
Subject: Re: -next status as at v7.1-rc6
To: Mark Brown <broonie@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Paul Moore <paul@paul-moore.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 at 11:22, Mark Brown <broonie@kernel.org> wrote:
>
> We're reaching the peak of conflicts for this release cycle but
> fundamentally everything is pretty quiet at the minute.

So the "Hornet" LSM thing needs to bve removed from linux-next.

I'm not ever going to pull it - it has been NAK'ed by the developers
of the actual BPF code, and now it apparently causes merge problems
too.

The LSM people need to realize that they cannot override the people
who actually write the real code.

The security layer is not boss in the relationship. It's the
subservient party. Security is important, but LSM's are not.

When the maintainer of a codebase NAK's a security model, and explains
that the code has different needs and different security models, the
LSM people don't just ignore that and go do their thing despite the
NAK.

               Linus
