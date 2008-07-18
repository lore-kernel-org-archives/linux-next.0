From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 13:51:32 +0100
Message-ID: <20080718125131.GP28946@ZenIV.linux.org.uk>
References: <20080718153629.93410869.sfr@canb.auug.org.au> <20080718083341.GD21656@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:49451 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754546AbYGRMvf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 08:51:35 -0400
Content-Disposition: inline
In-Reply-To: <20080718083341.GD21656@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Jul 18, 2008 at 09:33:41AM +0100, Ralf Baechle wrote:
> On Fri, Jul 18, 2008 at 03:36:29PM +1000, Stephen Rothwell wrote:
> 
> > Today's linux-next merge of the vfs tree got conflicts in
> > arch/mips/kernel/irixelf.c and include/asm-mips/namei.h between commit
> > 2957c9e61ee9c37e7ebf2c8acab03e073fe942fd ("[MIPS] IRIX: Goodbye and
> > thanks for all the fish") from the mips tree and commit
> > 2d810d154f1ffc5c637acdb067693773efb09540 ("[PATCH] kill altroot") from
> > the vfs tree.
> > 
> > I removed both files.
> 
> Removing arch/mips/kernel/irixelf.c is fine but removing <asm/namei.h>
> will break the build of fs/namei.c.
> 
> Btw, shouldn't <linux/namei.h> include <asm/namei.h>?  Or alternatively
> maybe rename <asm/namei.h> to something else?

No.  altroot is *gone* and so is asm/namei.h.  Patch in my tree removed that
one, along with the crap in fs/namei.c that used to use it.  Since irixelf.c
used to use the value of IRIX_EMUL, the same patch moved that #define in there.
So the conflict resolution is correct...
