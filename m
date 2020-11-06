Return-Path: <SRS0=qnOo=EM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40EEC55178
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 12:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE5220728
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 12:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AuRaa9NK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgKFMUL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 6 Nov 2020 07:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgKFMUA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 07:20:00 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671BEC0613D3
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 04:19:57 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so1149292wme.1
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wu0yuz1Rqywdt2lXVmkZwBU4v10ZmblZwj+lb/B5gns=;
        b=AuRaa9NKjvddCz+g+IJRpzzDT0yuon1mPZk/iACz6uSTGVJaz0qTESiPnTFJoscCOe
         dC8dAdzkCI5Ipkpep5GqWxcutifG9nYT5QehxhiaggAJtFGe12XpWVQ4fwZiDDVlxjCG
         IpzNm8BOYz5zR3eV/NtjcucMZZH1olctzfx3evPQxc5+Cw51l3PO24ke2hKe4SYlJJMV
         HfSIhu/0cubKXaT3t0sog2J8JPZ/pNhtkeV6hZdO+MKavjZzhQ0Jx+o/Ghk3J/OGVLSX
         HwhGZHCVqx5TfMg+7F7b/pkwuBv+vHaCcCI13q91RwJ3QEGT60eLMtYHGt7IMlB6wGpg
         72fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wu0yuz1Rqywdt2lXVmkZwBU4v10ZmblZwj+lb/B5gns=;
        b=JPlLu0/koPCMYfLD4cQSQa8uofBqxTnq2fFpUqnl90lz00Bd6w/yytMkL7StsPQrMp
         rU3VtLqSF98WR0HmAMRd0lIt54gJGoW3ITwF2TSh03FyFe0q8F6l/0FuvIE8upsF8A/E
         KXl2OXuvzy0LX7uMWw9TFvShSygjt0hROfKADWAco+WP/S4hOFbjFoJBP9CJzJV9hcqD
         dLphCn9vInFqeYpV42mN2384Be42Yh1tVxXBzu41apEan5CDx35qvVKWvN0Tpzxy3huL
         X6gNna1GQkwalvO6r8IIRkuilnMgbtSjh+NokXU9LC2KLarurmcqLhQrI4EXiFlrG9XG
         kbwQ==
X-Gm-Message-State: AOAM532r2+SMH7s8eJsqY72JXZaAr67n1LWw9zFNvQjxROqdjd4/8B8o
        yfN80P6i05K/6IcLaZrHG2SbDEo2nhn/h1IF/72ZWV0qrhI=
X-Google-Smtp-Source: ABdhPJyyH6ginqB6su10N1e1YY6ro31XfgUroej4pOpV0frsYt4K7s0DBw+Zdgfhh4n1WLRCAiVrIz/RvyBlQ0KqQwo=
X-Received: by 2002:a1c:c906:: with SMTP id f6mr2300366wmb.9.1604665196366;
 Fri, 06 Nov 2020 04:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20201106172616.4a27b3b3@canb.auug.org.au> <20201106092149.GA2851373@elver.google.com>
In-Reply-To: <20201106092149.GA2851373@elver.google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 6 Nov 2020 13:19:45 +0100
Message-ID: <CAG_fn=Vf7vX7r1kyqd3pqPZnNN9kKO6gtmum+E=X_PLmxG=Uqw@mail.gmail.com>
Subject: Re: [PATCH] kfence: Fix parameter description for kfence_object_start()
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 6, 2020 at 10:21 AM Marco Elver <elver@google.com> wrote:
>
> Describe parameter @addr correctly by delimiting with ':'.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

> ---
>  include/linux/kfence.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 98a97f9d43cd..76246889ecdb 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -125,7 +125,7 @@ size_t kfence_ksize(const void *addr);
>
>  /**
>   * kfence_object_start() - find the beginning of a KFENCE object
> - * @addr - address within a KFENCE-allocated object
> + * @addr: address within a KFENCE-allocated object
>   *
>   * Return: address of the beginning of the object.
>   *
> --
> 2.29.2.222.g5d2a92d10f8-goog
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
