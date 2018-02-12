From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: unnecessary merge in the v4l-dvb tree
Date: Mon, 12 Feb 2018 13:37:04 -0800
Message-ID: <CA+55aFzxsNxgKD1uGZQCiib+=+wCMSa0=B+Ye3Zi-u6kpz8Vrg@mail.gmail.com>
References: <20180213080036.3bf3a908@canb.auug.org.au> <CA+55aFwM0vy+pw-Xv=gA19ULMwAXNPhdO3qR5A3hkMrZKJFNSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:44100 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932204AbeBLVhG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Feb 2018 16:37:06 -0500
In-Reply-To: <CA+55aFwM0vy+pw-Xv=gA19ULMwAXNPhdO3qR5A3hkMrZKJFNSQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Junio C Hamano <gitster@pobox.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

On Mon, Feb 12, 2018 at 1:15 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The reasoning is to avoid losing the signature from the tag (when
> merging a signed tag, the signature gets inserted into the merge
> commit itself - use "git log --show-signature" to see them).

I think the commit that actually introduced the behavior was

    fab47d057: merge: force edit and no-ff mode when merging a tag object

back in 2011, so we've had this behavior for a long time. So it's
probably not be worth tweaking the behavior any more, and maybe we
need to educate people to not update to other peoples state with "git
pull".

Maybe we could just tell people to have something like

       git config --global alias.update pull --ff-only

and use that for "try to update to upstream".

               Linus
