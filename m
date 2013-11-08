From: Kent Overstreet <kmo@daterainc.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Thu, 7 Nov 2013 23:39:59 -0800
Message-ID: <20131108073959.GA17807@kmo-pixel>
References: <527411DD.7050008@oracle.com>
 <527414DE.9090704@kernel.dk>
 <52756583.2030808@oracle.com>
 <527BE7FA.90904@oracle.com>
 <20131107192545.GA20624@moria.home.lan>
 <527C2AA9.9040608@oracle.com>
 <20131108125307.613427c04a7527c4359e6443@canb.auug.org.au>
 <20131108020805.GI3842@kmo>
 <527C4D35.8000907@oracle.com>
 <20131108073324.GA31662@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:37077 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751444Ab3KHHjp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2013 02:39:45 -0500
Received: by mail-pa0-f49.google.com with SMTP id lj1so1829707pab.36
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2013 23:39:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20131108073324.GA31662@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Nov 07, 2013 at 11:33:24PM -0800, Christoph Hellwig wrote:
> The changes for direct I/O from kernel space have been in for a long
> time, and they are blocking multiple consumers of the interface from
> getting submitted for about a year now.  Even if the guts of the
> direct-io code will get a write based on another patchset from Kent
> that will go on top of the immutable iovec changes we need the
> interfaces now and not another year down the road.

What else is blocked on this patch series? Honest question.
