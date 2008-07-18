From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 09:33:41 +0100
Message-ID: <20080718083341.GD21656@linux-mips.org>
References: <20080718153629.93410869.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ditditdahdahdah-dahdahdahditdit.dl5rb.org.uk ([217.169.26.28]:52155
	"EHLO ditditdahdahdah-dahdahdahditdit.dl5rb.org.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751515AbYGRId5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:33:57 -0400
Content-Disposition: inline
In-Reply-To: <20080718153629.93410869.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org

On Fri, Jul 18, 2008 at 03:36:29PM +1000, Stephen Rothwell wrote:

> Today's linux-next merge of the vfs tree got conflicts in
> arch/mips/kernel/irixelf.c and include/asm-mips/namei.h between commit
> 2957c9e61ee9c37e7ebf2c8acab03e073fe942fd ("[MIPS] IRIX: Goodbye and
> thanks for all the fish") from the mips tree and commit
> 2d810d154f1ffc5c637acdb067693773efb09540 ("[PATCH] kill altroot") from
> the vfs tree.
> 
> I removed both files.

Removing arch/mips/kernel/irixelf.c is fine but removing <asm/namei.h>
will break the build of fs/namei.c.

Btw, shouldn't <linux/namei.h> include <asm/namei.h>?  Or alternatively
maybe rename <asm/namei.h> to something else?

  Ralf
