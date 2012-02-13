From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 staging tree
Date: Mon, 13 Feb 2012 17:00:42 +0800
Message-ID: <1329123642.2647.42.camel@cr0>
References: <20120213162008.a9a3092bec076bcf0f05c261@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:2665 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619Ab2BMJA5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Feb 2012 04:00:57 -0500
In-Reply-To: <20120213162008.a9a3092bec076bcf0f05c261@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>, Greg KH <greg@kroah.com>

On Mon, 2012-02-13 at 16:20 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/zram/zram_drv.c between commit fd1a30dea194 ("staging:
> zram: replace xvmalloc with zsmalloc") from the staging tree and commit
> ea81cfe7d7fb ("zram: remove the second argument of k[un]map_atomic()")
> from the kmap_atomic tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> 

Looks good, thanks!
