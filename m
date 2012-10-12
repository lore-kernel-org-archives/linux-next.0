From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kmemleak tree with Linus' tree
Date: Fri, 12 Oct 2012 16:22:06 +0100
Message-ID: <20121012152205.GA13957@arm.com>
References: <20121010140644.0235454126ca50b7f60d1f59@canb.auug.org.au>
 <20121010045553.GB3975@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:47060 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758028Ab2JLPWO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Oct 2012 11:22:14 -0400
In-Reply-To: <20121010045553.GB3975@swordfish>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michel Lespinasse <walken@google.com>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Oct 10, 2012 at 05:55:53AM +0100, Sergey Senozhatsky wrote:
> On (10/10/12 14:06), Stephen Rothwell wrote:
> > Today's linux-next merge of the kmemleak tree got a conflict in
> > mm/kmemleak.c between commit 85d3a316c714 ("kmemleak: use rbtree instead
> > of prio tree") from Linus' tree and commit 48786770bf3b ("kmemleak: do
> > not leak object after tree insertion error") from the kmemleak tree.
> > 
> > The kmemleak tree commit has been there since April, should it have
> > progressed by now?  Its fix is also included in the above commit from
> > Linus' tree.
> > 
> > I just used the version from Linus' tree and can carry the fix as
> > necessary (no action is required).
> 
> Oh, my bad! Just took a look on current create_object(). I guess we can
> drop my patch.

Sorry, I haven't pushed it early enough and I've seen the rbtree
conversion patch in the meantime which was fixing this as well.

I've updated my kmemleak branch now. Stephen, I guess you can remove
this branch since I don't have any outstanding kmemleak patches.

Thanks.

-- 
Catalin
