Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C168EB64DC
	for <linux-next@archiver.kernel.org>; Sat,  1 Jul 2023 17:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjGARnJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 1 Jul 2023 13:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGARnI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 1 Jul 2023 13:43:08 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6A3199B;
        Sat,  1 Jul 2023 10:43:07 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1688233385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sTc+p5TPNbnfHEv9COkbIVI1YjEbATBZ2hQ/9gaXcsU=;
        b=paxbWpL/BumjogKNBpNKo0i6PS57u4P3FxexcBJCxQF1nmZcr9qjkL7JSSU+Pqbf+SMlzy
        UBvGHqoT5nxPhhq1tcf2Ouck+MzVHed6aU95oHXzCl8KUsYJKWW6TdIdeLgjzytNrV5Mtd
        eSKURe5jz+4RlqWX6/9ZcHgmUMF34YWiMNKGJ2jeCQPhGKaU8szw7/W2zFTdO7OhTNXXGQ
        yzBp0mDP+9Yh6+rXpuXDAZhAGd1zkYcCac2Sx1XK0E2XqcuMmVOn1DyhjVv+l7kCdIUy2j
        wdhr/FqF/Hsw1tELtsAKege7xXkj0LpoKO5zL6bdq8skIRI6uohEr4fTiYFUQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1688233385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sTc+p5TPNbnfHEv9COkbIVI1YjEbATBZ2hQ/9gaXcsU=;
        b=qeKHk0YDrdZCfdK4KaV5pk5U37VrCWD3e9/Xu1RX1NAcUvbf5cXXpRXxQ8VPlM8hp+jceD
        ehuN/tKTwPs1LHDQ==
To:     syzbot <syzbot+bdc9ec9be68959140dbf@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        peterz@infradead.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] linux-next boot error: BUG: sleeping
 function called from invalid context in cpu_bugs_smt_update
In-Reply-To: <000000000000e6068305ff68b9c5@google.com>
References: <000000000000e6068305ff68b9c5@google.com>
Date:   Sat, 01 Jul 2023 19:43:04 +0200
Message-ID: <87edlry1cn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Jul 01 2023 at 01:29, syzbot wrote:
> syzbot found the following issue on:
>
> HEAD commit:    53cdf865f90b Add linux-next specific files for 20230627
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=12a6f567280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=83c17849d18e7a86
> dashboard link: https://syzkaller.appspot.com/bug?extid=bdc9ec9be68959140dbf
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

That was a temporary hickup in next.
