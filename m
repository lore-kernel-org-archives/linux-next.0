Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D34FC677F1
	for <linux-next@archiver.kernel.org>; Thu, 23 Feb 2023 21:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjBWVZP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 23 Feb 2023 16:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjBWVY7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2023 16:24:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214DD28209;
        Thu, 23 Feb 2023 13:24:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D1498B81B2E;
        Thu, 23 Feb 2023 21:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36751C4339E;
        Thu, 23 Feb 2023 21:24:55 +0000 (UTC)
Date:   Thu, 23 Feb 2023 16:24:52 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ktest tree
Message-ID: <20230223162452.454a3fd6@gandalf.local.home>
In-Reply-To: <20230224081708.383a5e57@canb.auug.org.au>
References: <20230224081708.383a5e57@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 24 Feb 2023 08:17:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   bbf45b2ab467 ("ktest: Restore stty setting at first in dodie")
>   aa9aba938288 ("ktest.pl: Add RUN_TIMEOUT option with default unlimited")
>   5aa3b79933de ("ktest.pl: Give back console on Ctrt^C on monitor")
>   fa77cb30e4a0 ("ktest.pl: Fix missing "end_monitor" when machine check fails")
> 
> These are commits
> 
>   7dc8e24f0e09 ("ktest: Restore stty setting at first in dodie")
>   4e7d2a8f0b52 ("ktest.pl: Add RUN_TIMEOUT option with default unlimited")
>   83d29d439cd3 ("ktest.pl: Give back console on Ctrt^C on monitor")
>   e8bf9b98d40d ("ktest.pl: Fix missing "end_monitor" when machine check fails")
> 
> in Linus' tree.
> 

Ah sorry. When I was doing my pull request for Linus, I realized I
accidentally had a commit that wasn't to go upstream. I rebased to remove
it, but never updated my for-next branch.

Doing that now.

-- Steve
