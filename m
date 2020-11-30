Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F3BC64E8A
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 10:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4162B2073C
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 10:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgK3KS2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Nov 2020 05:18:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:57668 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726828AbgK3KS2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 05:18:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2CBF6AC6A;
        Mon, 30 Nov 2020 10:17:46 +0000 (UTC)
Date:   Mon, 30 Nov 2020 11:17:33 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Justin Ernst <justin.ernst@hpe.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the tip tree
Message-ID: <20201130101733.GA6586@zn.tnic>
References: <20201130180503.5c173e05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130180503.5c173e05@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 06:05:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected indentation.
> 
> Introduced by commit
> 
>   7ac2f1017115 ("x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/")

Yah, I can reproduce but I have no clue what sphinx wants from me. Line
2 looks ok which could mean that the warning line it points to is bogus.

Justin, this is all yours. :)

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
