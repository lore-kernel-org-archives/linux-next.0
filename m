From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the akpm tree with the drm tree
Date: Mon, 21 Jan 2013 09:43:40 +0100
Message-ID: <CAKMK7uHJf6C99kNFybBhv3kXKze8x+YRDSHNycOfbY_QiSC7HA@mail.gmail.com>
References: <20130121164336.9edf1179a8e5c91baea8571a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:36559 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404Ab3AUInm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Jan 2013 03:43:42 -0500
Received: by mail-bk0-f52.google.com with SMTP id y7so108398bkt.11
        for <linux-next@vger.kernel.org>; Mon, 21 Jan 2013 00:43:41 -0800 (PST)
In-Reply-To: <20130121164336.9edf1179a8e5c91baea8571a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>

Hi all,

I'm working on some follow-up patches for the drm fb helper library
already, and fixing up the panic handling is on the plan already. And
since the fb helper has its own panic notifier anyway (simply
unblanking is not good enough to display an oops on a kms device) I
think we should simply return without doing anything from our
->fb_blank if an oops is in progress.

So please drop the patch from the akpm tree, I'll take care of this
(and reply to the original patch submission with my plan).

Thanks, Daniel

On Mon, Jan 21, 2013 at 6:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in
> drivers/gpu/drm/drm_fb_helper.c between commit 848499032504 ("drm: add
> drm_modeset_lock|unlock_all") from the drm tree and commit
> "drivers/gpu/drm/drm_fb_helper.c: avoid sleeping in unblank_screen() if
> oops in progress" from the akpm tree.
>
> I can't see an easy way to resolve these, so I just dropped the akpm tree
> patch.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
