Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2787C636D7
	for <linux-next@archiver.kernel.org>; Mon, 13 Feb 2023 00:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjBMAfW (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 12 Feb 2023 19:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBMAfW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Feb 2023 19:35:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71687EFB8;
        Sun, 12 Feb 2023 16:35:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18211B80DCE;
        Mon, 13 Feb 2023 00:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB26C433EF;
        Mon, 13 Feb 2023 00:35:18 +0000 (UTC)
Date:   Sun, 12 Feb 2023 19:35:15 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20230212193515.6c99a476@rorschach.local.home>
In-Reply-To: <20230213081743.33c4d0c9@canb.auug.org.au>
References: <20230213081743.33c4d0c9@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 13 Feb 2023 08:17:43 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   ce9c752ee1e7 ("tracing/probe: add a char type to show the character value of traced arguments")
> 
> is missing a Signed-off-by from its committer.
> 

Hi Masami,

Can you fix this commit, and rebase the probes/for-next branch? Then,
I'll push it back to the for-next branch.

Thanks!

-- Steve
