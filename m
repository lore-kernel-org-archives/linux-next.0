From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the  tree
Date: Thu, 5 Feb 2009 13:59:40 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0902051358270.11630@jikos.suse.cz>
References: <20090204175905.09624475.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:32864 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754539AbZBEM7l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 07:59:41 -0500
In-Reply-To: <20090204175905.09624475.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>, Tejun Heo <tj@kernel.org>, Jeff Garzik <jgarzik@redhat.com>

On Wed, 4 Feb 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in
> include/linux/libata.h between commit
> 9062712fa9ed13b531dfc2228086650b8bd6a255 ("libata: implement
> HORKAGE_1_5_GBPS and apply it to WD My Book") from the libata tree tree
> and commit 71e75a63456e0bb39afcae3c28dd5e211fb2b637 ("trivial: Fix
> misspelling of firmware") from the trivial tree.
> Juts trivial context overlap.  I fixed it up (see below) and can carry
> the fix as necessary.

Thanks. As the libata patch is apparently now in Linus' tree, I have now 
resolved this conflict in my tree, so you should be able to drop this 
fixup in the next round of linux-next merging.

Thanks,

-- 
Jiri Kosina
SUSE Labs
