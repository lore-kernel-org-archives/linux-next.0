Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55724E784BE
	for <linux-next@archiver.kernel.org>; Mon,  2 Oct 2023 15:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbjJBPkU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbjJBPkT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 11:40:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722C3AC;
        Mon,  2 Oct 2023 08:40:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7059FC433C9;
        Mon,  2 Oct 2023 15:40:15 +0000 (UTC)
Date:   Mon, 2 Oct 2023 11:41:16 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the rcu tree
Message-ID: <20231002114116.72211394@gandalf.local.home>
In-Reply-To: <20230927115330.69ef6671@canb.auug.org.au>
References: <20230927115330.69ef6671@canb.auug.org.au>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 27 Sep 2023 11:53:30 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the ftrace tree as different commits
> (but similar patches):
> 
>   8f2612479c71 ("doc: Add /proc/bootconfig to proc.rst")

This one looks like it has some whitespace issues (according to git show).

>   648c895fda8d ("doc: Update /proc/cmdline documentation to include boot config")
> 
> These are commits
> 
>   5f4028880652 ("doc: Add /proc/bootconfig to proc.rst")
>   6eab72b5fea3 ("doc: Update /proc/cmdline documentation to include boot config")
> 
> in the ftrace tree.  They are causing a conflict due to the differences.
> 
> I am guessing that the commits in the ftrace tree are an older verison?
> 

It looks like the commits in the for-next branch were nacked by Linus due
to a commit in between the above two.

  https://lore.kernel.org/all/CAHk-=wjpVAW3iRq_bfKnVfs0ZtASh_aT67bQBG11b4W6niYVUw@mail.gmail.com/

Masami, can you update your for-next bootconfig branch? If Paul is taking
the patches, I'm guessing we can just drop them.

Thanks,

-- Steve
