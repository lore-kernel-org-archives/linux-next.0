From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the omap_dss2 tree with Linus' tree
Date: Tue, 9 Apr 2013 17:41:00 -0700
Message-ID: <CA+55aFxDmLtDkWtyn9atBvaqok+X-CHe593Rj8WN92ZA+iyC6Q@mail.gmail.com>
References: <20130408143623.bbf18647b96df42b8b8ec6a0@canb.auug.org.au>
	<5163E925.4060601@ti.com>
	<20130410101317.0fa466659e2376aada964540@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:61787 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762270Ab3DJAlB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Apr 2013 20:41:01 -0400
In-Reply-To: <20130410101317.0fa466659e2376aada964540@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>

On Tue, Apr 9, 2013 at 5:13 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Since you really should have that fix in your -next branch as well (for
> testing), I would merge the same branch that Linus merged i.e. I would
> merge commit 090da752cdd6 ("video:uvesafb: Fix dereference NULL pointer
> code path") since that is already in your tree (presumably as a separate
> branch or tag).  I would also put a comment in the merge commit itself
> explaining why you did it.

I'd actually prefer people *not* do this unless they really have to.
Just fixing a merge conflict is not a good enough reason to add
another merge.

If you really really need the particular fix for some other reason (ie
that bug creates real problems for you and you need the bugfix in
order to test all the other development you've done), then yes, doing
the merge is worth it. But just to resolve a merge conflct early? No.

                   Linus
