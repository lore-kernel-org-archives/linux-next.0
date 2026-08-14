Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C2456DF2
	for <linux-next@vger.kernel.org>; Fri, 14 Aug 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699195; cv=none; b=mUa87OENBc4uRoiIZYSrv1Ip5AkeaXEI8La6blobm4zh8Tl5hspYLzHJJ/0xgToHkz/c81wFFK0FYDTcp/Nl+7p+BPWRi6JtEVy3p4JNRl0frNzOt64st03sIgMnvQUOM9+xMip8y7QC/fLzY7Ttm+1XxpD/c9FmUYA0HGpUaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699195; c=relaxed/simple;
	bh=jNYdBBFLO18hgXS46Q5rycAIM8a9J7MBu/PWXIiQxmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUxGAhYDaWCN204vigR8RLY5CZNYuWUi5uNBUDi5JcA56TOV1lR61uWCCeYZahqHimrSE775NfX/k7q+9UxpqisDakPavVub5lBJq2PHfHsvv7DBF2AXBCgDJI/PCbYbun96DP4M3usjuJICQEJdiphYzDK7ib5qGRVr/C6wQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-76b3036d2d4so414132137.2
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2026 02:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786699192; x=1787303992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9cYu+veJFNK2glAWWGSd0eRvh+9Ngi5bPC0vJMK6n9Y=;
        b=qaKayGc0LJlaJ78jbvVVGpiNdrM3hZSuIokXLMMsLXU2awpd3ePQ4ZTr1gquQPrBr6
         6rBqJbg6XY6T4cwKCMaHRJVea2MbT16dt/Msh3rLDDzY2p3e8lM0Y7ae5EMUoJWjzsy/
         WYpeTxWB9lPmGskxPLgK6TV/OE82Uu/82aYwrjR6eSMnxy69L/wO0mOrVRdO4OHyWfIE
         lSF3blho6jy0Zjg0R3Lmd7U62Hybk0CkVIgZXd0VfVtFz2LxkvnFX7PKUDFFobr1CxU1
         OCcVkPAhY6hrqhRefmPLf+eGABVhNksVvzMSqFprOIZJev324yML2S8bXhzeIcHatvhn
         AOcA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8lSSOAMcjPcJQ+SMlj3yWrffKclmfpLMZHmaJv39s+0E+tsY4/lsCSynks1KW303YyPnqJH41uUfD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4E0b9yuU99tIqz+6BZKxDVLSfARfLij6YvyqNU8bzRYHPEt/d
	/91mJURC1syURJbP5DdVFm8DtS96rLgan8SvzV2fIXJ9rk1QxCeJ5FOk5E6hsV0jhF8=
X-Gm-Gg: AR+sD11i6+KRQG8c0VdKV5IraWOjjB1D+BdzqomxRp3UMLCtFe9RXsYTSqHfMV7bFHE
	AVnCHuDxMFUX0q7avDuOnZhvqO+nCrReKohy0I5bbSubLNr4wWfg2el3/BoFG0vGO3OZzoevRin
	z0o9FXRKkDsm4bKyd6CbWNW43iLlfLoorOOUpIM1+Fzl6z9rOF13LqCnp0Iw92pdX+23PDFiBhu
	lJ6CwTxlngSwGuh4BnFGAS9Gwx1ouERe1lBp9X94xLeQuEbBhoVwrUMM8c0u4SRGAN4xD6mlxAQ
	e4HsEBn10/eW4OSKKyY66ihH4HVCL7K1cM2jepCxmmFHVHl5JoRsDG3IZai88ZsrsUI8OIsGbJX
	AZVuf7ndKC8Oaq76dk+yCbZunqelKwBEtcYf9k1eTOyoo5Z0X8+rKSLebw0SCLoXNU1wqQjeuUE
	8+noPyzzFgcj7VIrCaGPTisNFAqUuAukyCA2XpT1X0Qn7pULjUAk9nA2Pp9O8vEDqzJL4mFNt1E
	ZukMFzmnUkK9S4Q5Zh6G91H1nbbtQ==
X-Received: by 2002:a05:6102:4bca:b0:738:133f:8d5e with SMTP id ada2fe7eead31-76f2eab96fdmr847954137.12.1786699192329;
        Fri, 14 Aug 2026 02:19:52 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76ef849a7fbsm1137799137.3.2026.08.14.02.19.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:19:51 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so410732e0c.3
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2026 02:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpg8TCmPlw1QgjJ83AmX6Sz1+ycTtUOKh7XagvCLj3uEB68QdKGtxNnhPWIBifokHlqmYDjnqYBIe9t@vger.kernel.org
X-Received: by 2002:a05:6122:f89:b0:5bf:9bfa:53a0 with SMTP id
 71dfb90a1353d-5c591c69d80mr1061572e0c.1.1786699191251; Fri, 14 Aug 2026
 02:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
 <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof>
 <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org> <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 11:19:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
X-Gm-Features: AcwNN1WF2WhUvwHaIYTdgysoS-hjS27a6FuAyvrqY6CJtnRl1cB5O8FhMeoJOCc
Message-ID: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
To: Paul Walmsley <pjw@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Rui Qi <qirui.001@bytedance.com>, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	Jingwei Wang <wangjingwei@iscas.ac.cn>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 11 Aug 2026 at 10:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 8 Aug 2026 at 01:30, Paul Walmsley <pjw@kernel.org> wrote:
> > On Fri, 7 Aug 2026, Nam Cao wrote:
> > > Paul Walmsley <pjw@kernel.org> writes:
> > > > Now that we've queued a patch to get rid of the async hwprobe
> > > > infrastructure, is this patch still needed?
> > >
> > > Yes. Removing async probe only ensures probe is finished before the
> > > kernel is done booting.
> > >
> > > But there are usermode helpers which run while the kernel is still booting.
> > > This patch ensures probe is done before that.
> >
> > Okay, thanks for taking a look.
> >
> > Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.
>
> This commit is now commit 994dad686e755477 in riscv/fixes.
> However, riscv/for-next contains the similar but empty commit
> acf3fcb5e9199cc9.  Presumably this is the result of a bad rebasing of
> for-next on top of fixes?

The empty commit was rebased, and is now commit 4e864f1c3d8d147b.
Please drop it (it breaks my scripting ;-).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
