From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Fri, 15 Aug 2008 09:04:08 +0200
Message-ID: <19f34abd0808150004ma79af8ei9009a792b87a4c80@mail.gmail.com>
References: <20080815164909.3d8beb10.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.183]:3017 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607AbYHOHEK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Aug 2008 03:04:10 -0400
Received: by py-out-1112.google.com with SMTP id p76so751032pyb.10
        for <linux-next@vger.kernel.org>; Fri, 15 Aug 2008 00:04:09 -0700 (PDT)
In-Reply-To: <20080815164909.3d8beb10.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, "Gustavo F. Padovan" <gustavo@las.ic.unicamp.br>

On Fri, Aug 15, 2008 at 8:49 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the kmemcheck tree got a conflict in
> arch/x86/kernel/traps_64.c between commit
> 4df9e510a9fda29aca71d8acac853b98aa6884d1 ("x86: coding style fixes to
> arch/x86/kernel/traps_64.c") from the x86 tree and commit
> 862849a36e6087faac6349de0b1bcc66ff98411b ("x86: add hooks for kmemcheck
> on x86_64") from the kmemcheck tree.
>
> All the includes got rearranged ... I fixed it up.

Hi Stephen,

Just out of curiosity: Do you have a script that produces these
messages? How hard would it be to include the "merge patch" (conflict
resolution) itself in this e-mail?

I think that would be a very helpful addition (if it can be done with
no hassle on your side), because it means that I could actually look
over it and give a comment if it looks wrong (with no hassle on my
side, looking up the merge commit, etc.).

But if it can't be done easily, then don't bother. The issues are
mostly trivial anyway. Thanks for doing this work!


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
