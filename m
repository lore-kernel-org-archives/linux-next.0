Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BADBC433FE
	for <linux-next@archiver.kernel.org>; Thu, 13 Oct 2022 08:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiJMIuH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 13 Oct 2022 04:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiJMIuE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Oct 2022 04:50:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE905A3FC
        for <linux-next@vger.kernel.org>; Thu, 13 Oct 2022 01:50:02 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id fy4so2416148ejc.5
        for <linux-next@vger.kernel.org>; Thu, 13 Oct 2022 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq/ww/61kF7UEYUJquz3gQawyeedcnVNs9ttspn+Jxg=;
        b=MzFESBng0hz0sPP1i7MX53IRdqo+s6IANrM+UXWer47SlyA2kws0MuA1VCNXNVKA4u
         grEBzayKCCC67pUYT2xAxT5v4PNSTLtH+7tvrD+PzW4NhzO5In05Q9zc84BGpc54IRwD
         v1REmL5X2zSk0vLYmZZjJkC4/KM/5ImJ1gDOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq/ww/61kF7UEYUJquz3gQawyeedcnVNs9ttspn+Jxg=;
        b=EOIP/z5ZpRw3SCvqaiydALEs+4+bd0nQNQAgBqGNwqpNl4yuQyBi1qgLFWxwgdtuQN
         mU95atb8kaz7JrBn2XvZuiknxxcOkhMS//4EvqH3w27wzzqeDDmrFnbCR7/dmoq3Ag0c
         vUr6TMqA5Z669oyE7dsxok0LgixYRqh3DmlvKHk+MUhmFMoDfIo9AdmEhicxz6scXuyz
         2Kx/Aco08+AZBtqVdjuAEaXxElyO5s4hLLNMlXEUtCUFNlpM01EHNF3+6lMB57fttgpu
         LnPdbmz9opXwbtUSuw/TIsPjW6Hx2hoPkZ4l9we98VaWUpj5p1LaZau2Y3A1JpoQjHkk
         6FDQ==
X-Gm-Message-State: ACrzQf2RgW/vcfZn4MfyXwUYYbx559qtyNZUnm4XHgp1T4xKygTDEUBp
        Z9GX45/kw/2oubzmUPmyRvpHAonKVbba2FnNt0Rzdg==
X-Google-Smtp-Source: AMsMyM7GhWNCiU4Xw0H6JLxXS6xUxkVE10ALtrZFVSH2+Giufp5J4ESRyyRvIziMdJO/0OnJasP0RYiFjlaMcOE56fE=
X-Received: by 2002:a17:907:b07:b0:78d:ce2b:1999 with SMTP id
 h7-20020a1709070b0700b0078dce2b1999mr12044586ejl.267.1665651001242; Thu, 13
 Oct 2022 01:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221013101528.4afacfe3@canb.auug.org.au>
In-Reply-To: <20221013101528.4afacfe3@canb.auug.org.au>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Thu, 13 Oct 2022 10:49:50 +0200
Message-ID: <CAJfpegs85WbrJ8sQ5Y3XCwtSdSwjK+m5GCAkTBOEUBc1-=h0xg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fuse tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 13 Oct 2022 at 01:15, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the fuse tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: ".delete_from_page_cache" [fs/fuse/fuse.ko] undefined!
>
> Caused by commit
>
>   0d659ac83481 ("fuse: fix readdir cache race")
>
> delete_from_page_cache has not been exported to modules since commit
>
>   452e9e6992fe ("filemap: Add filemap_remove_folio and __filemap_remove_folio")
>
> Which was merged into Linus tree in v5.17-rc1.
>
> I have used the fuse tree from next-20221012 for today.
>
> Is this really destined for v6.1?

This particular patch, yes.   I posted the patch and asked Willy about
delete_from_page_cache().

Rebased my for-next branch on HEAD and re-added the EXPORT_SYMBOL to
fix this for now.

Thanks,
Miklos
