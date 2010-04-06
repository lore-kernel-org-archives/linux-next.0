From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for April 1 (virtio_blk warning)
Date: Tue, 6 Apr 2010 12:10:48 +0930
Message-ID: <201004061210.48840.rusty@rustcorp.com.au>
References: <20100401172317.80b6d961.sfr@canb.auug.org.au> <20100401091312.85775242.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38080 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757212Ab0DFCku (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Apr 2010 22:40:50 -0400
In-Reply-To: <20100401091312.85775242.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, john cooper <john.cooper@redhat.com>

On Fri, 2 Apr 2010 02:43:12 am Randy Dunlap wrote:
> On Thu, 1 Apr 2010 17:23:17 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20100331:
> 
> 
> drivers/block/virtio_blk.c:228:13: warning: multi-character character constant
> 
> due to:
> 
> 	if (cmd == 'VBID') {

John?  That looks suspiciously like untested code.

Thanks,
Rusty.
