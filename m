From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 12 Dec 2016 01:44:48 +0000
Message-ID: <20161212014448.GM1555@ZenIV.linux.org.uk>
References: <20161212123140.2408fefb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39212 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753805AbcLLBox (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Dec 2016 20:44:53 -0500
Content-Disposition: inline
In-Reply-To: <20161212123140.2408fefb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, Christoph Hellwig <hch@lst.de>

On Mon, Dec 12, 2016 at 12:31:40PM +1100, Stephen Rothwell wrote:

> Al: that vfs tree commit has a bad email address for Christoph in it :-(

Gyah...  OK, will fix (the bulk of the diff, of course, had been regenerated
while commit message came from his old mail; unfortunately, it had been long
gone from my mailbox, so I'd picked it from archives and completely missed
the mangled address).
