Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4FD3B6C15
	for <linux-next@vger.kernel.org>; Tue, 26 May 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783061; cv=none; b=GTFt1Ko+Nh+uqQlJWsLTYIrFM4C/uUoHefoemRjnapwQj/KXmG6ddHohNbshsz78631itdO55i2emuf8Wj04Ak7jB/aMCu4222ZkW011EJY9uul8Pg56hJBLG6QkePlmq7PzFbA6P0pEoBVgKhzpWRA1SlbqmB8q+U5eAGPVoNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783061; c=relaxed/simple;
	bh=Zd/9bfUr3ic5TIlTExBVFIonTb2VjXWM9A9PrgdqiDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjH/8QfH8x/F8+DuC7d+GHR0a7QcL6e6VBipvtyMIrAcfDep5M8L5pMP5q32dsoQOWOQQHgulVCTsUEvFJ6vcHcKjmxSz4QjuUp7MlxNFFSNrwnMIzLJguPqYS9WKqLI1e56AFlp/hZrlJoKWqnTAGInEOLwPFt8YFFKmVXh7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56f6afbd205so6287581e0c.0
        for <linux-next@vger.kernel.org>; Tue, 26 May 2026 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783059; x=1780387859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lTP6MMwy4pS6KbZKn87ULNoqoY47p/A1CVPh7q8jp4=;
        b=V74CDYK7BbMbeTl93fooDaPPYKjcBs1njzetEzQlhxZ5wqtxmmTrWcMOFSbKDJYIbG
         Hgg2CTkExG5TemcXdoooKqDC0mC897ZxD9xIXwr971nW99O+p22uXxhbe/FjPHb0G6R4
         9RyubEadJr74MR9rr22DSUQ3wG91/M/oZnkq4OzoHtGVHJHpJAah9AYzS27shh/x91JT
         HzQnLUNjDIybcTg6lKqeob2N5NTPt1DEw8pOcJGOigPtTOfLU9CCUsscXYGFHNprXZAd
         36ZiHzWnePPOw5h97tLr7MgfY5Vid0eiDSmv638HzPCybUpSSeQvmZjgcbKbLYpt7CTR
         w4bw==
X-Forwarded-Encrypted: i=1; AFNElJ9Rk69S8e3sjc8R1gqUy5lUxN79TkVrNSdH4zvcrm+qJ++aW4oi2D6j0D5b5pLltFSmvg3wzim6PPMW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/Ubo0AjbYJWq1OVeK4kbjS2YoOOJFmY9SisTI/KE+iSDySvE
	AMqFuOlI+d8J1ZdrwtzrWvgsbbRdvMHio91P5WCuYfAmlWiEm7N2gXasvM0eHvJc
X-Gm-Gg: Acq92OFfBTlNRjUdVEzUquQPl/VydbSEHCgPi/FsZKN29e1l0yrP12UTq8pyf769GQS
	YrD3r1QpKYZyjsKWIwkIGHrIyVOZhbuvmLCvA/A5DIK2xAPku1k2KGRZci2DSC/NGI4ju8qK0K0
	OnufQ6P5wWpgrtuZ2hgRHXWhiFGiApTXyb+3HHPDcaHXGLi9O9yFL3lDv4KROApetqLbyqxtfLU
	0CESLN0HMeAG5ExjNKw/2CrG4z7rm2fGgJ9yVN2LqN7qOHvUyD652mHaIX24YdAHVXFJ7mTcEdC
	aC9pdodv9qm2ZqGH0c6S7uZwiPG/AMJBWoH7O1MG1/pK9CacldKCVYS2CCz2dV6q7+BanNNLzT8
	9Il2JufZnNptSqRshtU4yLezgr250KMpTW0HvskZqt5CuYXZMCKsKIfbLxWLMx45G+FmjsHyEP5
	CW6sxTHj59wIQ8a5DAEDk6IkGKbF+1mYuBf4uztDSPDqgPBMaRdm4o+KFDFQq/
X-Received: by 2002:a05:6122:1796:b0:575:9cb5:a87d with SMTP id 71dfb90a1353d-5840da90c61mr3408023e0c.2.1779783058678;
        Tue, 26 May 2026 01:10:58 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791fa49sm15671159e0c.12.2026.05.26.01.10.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:10:57 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95f2b0bd920so7720771241.0
        for <linux-next@vger.kernel.org>; Tue, 26 May 2026 01:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+E8ShZoEAp0aJvQIhrdYS2OhKE0ldnMAqxAHC2SPykAqOJ8p0PkfsUiide5p1XRMOEz5PA9uupV1Kx@vger.kernel.org
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id
 ada2fe7eead31-673cbd0a917mr6568746137.13.1779783056566; Tue, 26 May 2026
 01:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503040331.71875-1-julianbraha@gmail.com> <fd28add8-fa62-4655-a630-0293473fc758@kernel.org>
In-Reply-To: <fd28add8-fa62-4655-a630-0293473fc758@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 10:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNBdYJfxdaUOEmuZUvDMGRxD-7uRRVhW7CZqK_UNpvgQ@mail.gmail.com>
X-Gm-Features: AVHnY4IxCBQRQwRrHoNhM4qpyFTjlN9TBUyPFpLI1x90SI005W0IVz0VySyc8-g
Message-ID: <CAMuHMdVNBdYJfxdaUOEmuZUvDMGRxD-7uRRVhW7CZqK_UNpvgQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: replace select with dependency for visible RELOCATABLE
To: Paul Walmsley <pjw@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Sat, 23 May 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> On Sun, 3 May 2026, Julian Braha wrote:
> > RANDOMIZE_BASE currently selects RELOCATABLE even though RELOCATABLE
> > is visible to users. Some other architectures, like x86, use 'depends on'
> > for RELOCATABLE in their definition of RANDOMIZE_BASE, so let's do the same
> > here.
> >
> > This select-visible Kconfig misusage was detected by Kconfirm, a static
> > analysis tool for Kconfig.
> >
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
>
> Thanks, queued for v7.2.

This was applied twice to riscv/for-next, in commits 7bce18b7c0835686
and a74483879d1d4769 ("riscv: replace select with dependency for
visible RELOCATABLE").  Apparently, the second commit is empty.

I noticed because it broke my workflow: I use "git cherry -v
linux-next/master master" to check which of my patches were accepted
in linux-next.  Thanks to your empty commit, all my empty separator
commits are now flagged as present in linux-next...

Thanks for fixing! ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
