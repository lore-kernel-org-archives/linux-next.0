Return-Path: <SRS0=csPv=YP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F8CA9EB7
	for <linux-next@archiver.kernel.org>; Tue, 22 Oct 2019 07:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE5D92184C
	for <linux-next@archiver.kernel.org>; Tue, 22 Oct 2019 07:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAxGNxcQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbfJVHbw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 22 Oct 2019 03:31:52 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34959 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387903AbfJVHbv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 03:31:51 -0400
Received: by mail-vs1-f67.google.com with SMTP id k15so1706609vsp.2
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2019 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GHssV/Yve2NWXUqk9yky9VUTeh7DYWhG9mR5jeyp4s=;
        b=wAxGNxcQLDVJS5VWzQGWIRZT3fniTE9O9s88eLwNFU6svDtKOiImJMBL5MyQBKqvP5
         vYWnonwgYt2zzdXpD+FDhU/FIdqpPDgzYpxVISyYDE1Oxd3QQRp5sstqWhqtixe6Jm9Q
         R0fDHSNLTRe9u2u9t5mg/DwLiNwAX019JalmRZfIe1P0CfVGCjAwi0Icol4ykU9GhUpa
         pMprGRbr88upFgq1a+JURX5DqY0viQ4vAjRfBk5/AXxJQs5uLfGkICWvNYG4hQvh6JBj
         uTaFaNJC6QLHGv6mWKPCucLqiTJWldIObd4u/fWAoih0Thcqw1CEHapgM/68XLlKKAt+
         CgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GHssV/Yve2NWXUqk9yky9VUTeh7DYWhG9mR5jeyp4s=;
        b=pk8ELMmW9sCaMAK9Vmp4dr38GiLfW37TcV8pnRqQgVYJZXueACy/ZdmYwBn1oEOERF
         uchFidNsoHZUzDpmN/c8FMenVhT0Xro30ulroFnbofQDFj91DEndDgJxSKttLzDfrTqs
         0l77VSXHNlLGyNE3zxRdyI6U80PiFoihf7YFI8lMBH/24sqV+tUnTI7mfpHNykMvqOgy
         qY+9caJM+w2mA4zyr7qgxyIl3SXdPHxdbI60mSnu7FUGtawarTJMJnCjo8s6bIUEwLIm
         /kSnD1Hpxg1vYXCB7wSqu+aB5SXWWgjp7W4800StvfsEkDR1mRhzdo1jwKY9D9LgS0vf
         79pg==
X-Gm-Message-State: APjAAAVLnw9n1HqxJYR2HgVdNH3APJWhDI56dammue5rKBOgF5nO1zGp
        72/gF1uF3F6trY4IENNO1yA/BPv+dMtJkyfdaMFDOg==
X-Google-Smtp-Source: APXvYqyjktYOMyc+jP5uoVEavfXqn48tybAcMjlwZHZslluIstQu6d6THHRIHpFnK1Fwyb7XC4ggGQSO5eu7A4o0SfM=
X-Received: by 2002:a05:6102:104d:: with SMTP id h13mr1022352vsq.165.1571729508862;
 Tue, 22 Oct 2019 00:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191022114737.0fd6211c@canb.auug.org.au>
In-Reply-To: <20191022114737.0fd6211c@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 22 Oct 2019 09:31:12 +0200
Message-ID: <CAPDyKFpUEXzcSN-eEDRNcRWWp8P-yveBirwerhrYh+WMdswnqg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Chaotian Jing <chaotian.jing@mediatek.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 22 Oct 2019 at 02:47, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/mmc/core/block.c: In function '__mmc_blk_ioctl_cmd':
> drivers/mmc/core/block.c:500:6: warning: unused variable 'status' [-Wunused-variable]
>   500 |  u32 status = 0;
>       |      ^~~~~~
>
> Introduced by commit
>
>   05224f7e4975 ("mmc: block: Add CMD13 polling for MMC IOCTLS with R1B response")
>
> --
> Cheers,
> Stephen Rothwell

Thanks for the report. I have amended the patch to address the warning.

Kind regards
Uffe
