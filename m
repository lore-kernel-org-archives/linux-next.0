Return-Path: <SRS0=4Ai6=DO=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB7DC3279D
	for <linux-next@archiver.kernel.org>; Wed,  7 Oct 2020 00:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F5220739
	for <linux-next@archiver.kernel.org>; Wed,  7 Oct 2020 00:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJxmq0s8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgJGAK2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Oct 2020 20:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgJGAK2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 20:10:28 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B589C061755
        for <linux-next@vger.kernel.org>; Tue,  6 Oct 2020 17:10:28 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id q21so593157ota.8
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2020 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wi1jcDUXhmUJVWSN8u8P6C9eTibLrPPcR6pQHLdgOfs=;
        b=OJxmq0s8FOKsNlNTy4Qsr91aFes6ycErtqR6aokbT0gMY+jAIwaiFGbu/PsfCHXJBv
         3QcuCmB8P2knzLs8Km9ZfRItJdwOgmlsBnPUqE1W764JyJC79HUJI+HRxTSIp+qqorHp
         /jkIJXVDio3Gnonuf1nevnlnVzY2lIkbZ0tQpLPoDIcHzZzDO5VfvTHte8RqqacpWssG
         cLrDRa2lHDQiZW9oxF8S/uc+lJ/Dc+2KeyUH8C1Y/qLYXEgcqM+Xpooj4cpNYqeoo2LH
         /nQGnP+yL5WC90OddOKb91erO4fPrFvm6BKY4I0U8KLFmc3BZkatyKtPTgz6VGzK8P3T
         9TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wi1jcDUXhmUJVWSN8u8P6C9eTibLrPPcR6pQHLdgOfs=;
        b=YH1KLZpZ2k0ubAehT4pwzLXHeQ3krxn81DeNgmPY0X8od1CG1GfrpAsm4fgAZyVD6R
         BKQWv8fWex6vcsNVhe44iqaCrbMTD370Ro3g7Lmn+31/qrSskBS7nfm1XGAWZg9AbghR
         QM7BN8/ZcMPuIPVohzh5TGsvkVSE+Vj6yi9BBunywaRnmmin+YFSeF7vOUUBAzN+IdYn
         DPjYgELZ8435rBIARGqiWSKqyRvOm/xE5dBZZVcnT1zr5pHA7IltmKmX/FjLQbniXkcO
         AC/96/0FTMOJd+tE7zp9KGJNWQzZ/3orgyZwcTpv2d4rMwHQUZSGYjJW81WKYYnxF15x
         yFRg==
X-Gm-Message-State: AOAM532X/otNmj4EhPYZDvcDrOG47HBTpHm9+ysF716xUaHTq2KNvCfD
        O99D9UAl8X7IdKiMWz6hMKIKFimsCe47ZY1o6b0WPQ==
X-Google-Smtp-Source: ABdhPJyxAvneJRD04IOXKzjRKHPbeKdB69oCmF9vNJuvEgBkwACc05hjNXkE/uZ6k1q/4vsdBkZXBLsDJgaAeSx1WZ4=
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr265996ota.221.1602029427384;
 Tue, 06 Oct 2020 17:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201006231234.701591b5@canb.auug.org.au> <73bc372f-8896-d363-8832-193999296054@infradead.org>
In-Reply-To: <73bc372f-8896-d363-8832-193999296054@infradead.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 6 Oct 2020 17:10:15 -0700
Message-ID: <CALAqxLU672fOHudfvZWDEoO=fHYt79isz35e9EaJAsvTCg5How@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 6 (drivers/misc/hisi_hikey_usb.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 6, 2020 at 12:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/6/20 5:12 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20201002:
> >
>
> on x86_64:
> CONFIG_USB_ROLE_SWITCH=m
> and HISI_HIKEY_USB=y.
>
> ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_remove':
> hisi_hikey_usb.c:(.text+0x61): undefined reference to `usb_role_switch_unregister'
> ld: hisi_hikey_usb.c:(.text+0xa4): undefined reference to `usb_role_switch_put'
> ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_set':
> hisi_hikey_usb.c:(.text+0xd3): undefined reference to `usb_role_switch_get_drvdata'
> ld: drivers/misc/hisi_hikey_usb.o: in function `relay_set_role_switch':
> hisi_hikey_usb.c:(.text+0x54d): undefined reference to `usb_role_switch_set_role'
> ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_probe':
> hisi_hikey_usb.c:(.text+0x8a5): undefined reference to `usb_role_switch_get'
> ld: hisi_hikey_usb.c:(.text+0xa08): undefined reference to `usb_role_switch_register'
> ld: hisi_hikey_usb.c:(.text+0xa6e): undefined reference to `usb_role_switch_put'
>
>
> Full randconfig file is attached.
>

Adding Mauro to the thread, as he's the one submitting that patch upstream.

Looks like we need to tweak the kconfig so it depends on CONFIG_USB_ROLE_SWITCH.

thanks
-john
