Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC83C77B7A
	for <linux-next@archiver.kernel.org>; Wed, 17 May 2023 08:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjEQIZP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 17 May 2023 04:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjEQIZO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 04:25:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99369358B;
        Wed, 17 May 2023 01:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36D7861B57;
        Wed, 17 May 2023 08:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BBCC433D2;
        Wed, 17 May 2023 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684311912;
        bh=Q2eq2HRQkG8z30GmpDc7eSZoIAm9vdn5MKezqNcrPxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BEIPpLrVK0QUCJ22xeGkEZa6tG+vSNkfHcm2hRsRaYnUwraeYRiDVOsDhVhWLA3CE
         b2TOJUcfSaKQ11HxcVwMUGzPgiwMM+J+qCZmjVPtl03GQAFzM51+9qJtENB4UeywhC
         fCNous0bjVY8XGp4E14GznqwvnR6kfMY0fHL9WtZcHk+cj/gy+O8nX5G7KeAC9ZQwV
         mtM+T2R4XOKRaEetrt2s1OaNfnKxSW/+565Vxkg9Fsj0wzYAxQ4w4fYmU2/8MIe41q
         oZJpOHx0WgmWcIlsh4xP6i3JiH+L3q/17tQSQz9ZI9Zxd4+xeShpb2XiLTlRLJfHWx
         64Io7tQibioYA==
Date:   Wed, 17 May 2023 10:25:08 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     syzbot <syzbot+ac3b41786a2d0565b6d5@syzkaller.appspotmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] linux-next test error: UBSAN:
 array-index-out-of-bounds in alloc_pid
Message-ID: <20230517-bushaltestelle-super-e223978c1ba6@brauner>
References: <000000000000c6de2a05fbdecbbb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000000000000c6de2a05fbdecbbb@google.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 17, 2023 at 12:40:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    065efa589871 Add linux-next specific files for 20230517
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=17f27bb2280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=821eeb02ef201bcc
> dashboard link: https://syzkaller.appspot.com/bug?extid=ac3b41786a2d0565b6d5
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/dbbd691e9e5a/disk-065efa58.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e5b9541c3979/vmlinux-065efa58.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/44cf3f3aaabb/bzImage-065efa58.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ac3b41786a2d0565b6d5@syzkaller.appspotmail.com
> 
> ================================================================================
> UBSAN: array-index-out-of-bounds in kernel/pid.c:244:15

Only way I see this happening is if the logic in
kernel/pid_namespace.c:create_pid_cachep() which sets the object size
for the struct pid allocation of this pid namespace based on
parent_pid_namespace->level + 1 is broken. The way this works is:

    struct pid
    {
            [snip]
            struct upid numbers[1];
    };

    create_pid_namespace()
    {
            unsigned int level = parent_pid_ns->level + 1;
            ns->pid_cachep = create_pid_cachep(level);
    }

and then during fork:

    alloc_pid()
    {
            pid = kmem_cache_alloc(ns->pid_cachep, GFP_KERNEL);
    }

So effectively, the wrong level must've been set in
create_pid_namespace() so that the flexible array allocation is too
small.

I don't have time to debug this tbh. Ccing Kees maybe there's some
flexible array stuff going on I'm unaware of.
