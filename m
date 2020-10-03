Return-Path: <SRS0=KaWh=DK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3CDC41604
	for <linux-next@archiver.kernel.org>; Sat,  3 Oct 2020 21:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F67D206C3
	for <linux-next@archiver.kernel.org>; Sat,  3 Oct 2020 21:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iVI4RMx/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgJCVyx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 3 Oct 2020 17:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgJCVyu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 3 Oct 2020 17:54:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E709C0613E7
        for <linux-next@vger.kernel.org>; Sat,  3 Oct 2020 14:54:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so3287038pjd.3
        for <linux-next@vger.kernel.org>; Sat, 03 Oct 2020 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RqVHPpZ6Wz7y1+qhwZaYda5zEvzwd+4/97qb+/erIeo=;
        b=iVI4RMx/f3DX40AitIt+awPfWkymQBZUzPMOfOvbos7d+O0YpuhCZ0nZKLz1SAknKu
         V6eh/IQPihzXGVhKVPDP33OdAiMOOmEnPjUUbBo+fDqmSf3euzzmJfeZTpOynE5EJH5R
         e7MiKwdPDf2Cvk4qehTFpYc7rK4s24OyUDaW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RqVHPpZ6Wz7y1+qhwZaYda5zEvzwd+4/97qb+/erIeo=;
        b=K29q5WrSY6jlgFLvXYK7NbtI038RkLdylCN7B9AjoxRJXzlPrUosaI93F4z20glAFT
         tSKyOQR9DdNH50I+rGUOxZPw+sISQooqVEXyQCcXKCub+6LRpoCc3lsda3uC1lbcB5oW
         XW8Z2yXhNSbBBgjQWO8d82BGwSeRYSct/8+2mGwYfxoAOa4xRWmImZ4dJ9X/OsB37x6g
         x4xlqEreDr/HSaAdzmaQv8QIxowiMHcSBgJbVlYzRZuei87u2stNBa7a4IfNbpQX9kcI
         J30/lY6VG9H93Up4TyCsjJ77XAh1eBbyiyPgZIjLFIG18S6SBHktJX6GiSUyJKs1NOel
         4zNw==
X-Gm-Message-State: AOAM5336k9nLaxgO8xOhReYd7Xkdv4SZnmuRWMbL47g8nmQFFLjNHG18
        Xou1MtB/YdV8zmToJgDv37ukIw==
X-Google-Smtp-Source: ABdhPJxM2a12aykn6gYP6up7MCND60ZS6yo1DT9rpBCVWJnVU7cN/sF3yqufCX7M4KT2TFwREgrfqQ==
X-Received: by 2002:a17:90b:3882:: with SMTP id mu2mr8605760pjb.29.1601762088609;
        Sat, 03 Oct 2020 14:54:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gp8sm5528308pjb.3.2020.10.03.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 14:54:47 -0700 (PDT)
Date:   Sat, 3 Oct 2020 14:54:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202010031451.ABC49D88@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914132249.40c88461@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> [...]

Is it only trace that is warning?

> gcc (Debian 10.2.0-5) 10.2.0
> GNU ld (GNU Binutils for Debian) 2.35

I can't reproduce this with:

gcc (Ubuntu 10.2.0-11ubuntu1) 10.2.0
GNU ld (GNU Binutils for Ubuntu) 2.35.1

Are you running Debian testing or unstable? (I see binutils 2.35.1 is
in both, so was this fixed in the .1?)

I will go build a Debian testing container...

-- 
Kees Cook
