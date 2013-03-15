From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the signal tree with the modules tree
Date: Fri, 15 Mar 2013 15:11:53 +1030
Message-ID: <87li9ptgtq.fsf@rustcorp.com.au>
References: <20130314172737.2856af8a9b368bc395d977be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:41460 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751355Ab3COFEF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Mar 2013 01:04:05 -0400
In-Reply-To: <20130314172737.2856af8a9b368bc395d977be@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Al,
>
> Today's linux-next merge of the signal tree got a conflict in
> include/asm-generic/unistd.h between commit 837718bfd28b
> ("CONFIG_SYMBOL_PREFIX: cleanup") from the modules tree and commit
> e1b5bb6d1236 ("consolidate cond_syscall and SYSCALL_ALIAS declarations")
> from the signal tree.
>
> The latter moved the cond_syscall stuff to linkage.h, so I applied the
> following patch as a merge fixup and can carry the fix as necessary (no
> action is required).  I am not sure if this is completely correct or all
> that is needed.

Your fix looks correct, thanks.

I've been forced to update that patch after another round of
improvements, so you may need to re-do the merge.

Cheers,
Rusty.
