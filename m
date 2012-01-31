From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 staging.current tree
Date: Tue, 31 Jan 2012 11:39:32 +0800
Message-ID: <1327981172.10202.1.camel@cr0>
References: <20120131142747.a2dd139403833a50939dbd17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55739 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752554Ab2AaDjo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jan 2012 22:39:44 -0500
In-Reply-To: <20120131142747.a2dd139403833a50939dbd17@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

On Tue, 2012-01-31 at 14:27 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/gma500/mmu.c between commit 344bc24c2947 ("staging:
> delete gma500 driver") from the staging.current tree and commit
> cb422c115787 ("gma500: remove the second argument of k[un]map_atomic()")
> from the kmap_atomic tree.
> 
> The former removes this file (as the driver has migrated out of staging),
> so I did that.
> 

Ok for me. Probably I need to remove that commit from my tree.

Thanks!
