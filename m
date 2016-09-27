From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 27 Sep 2016 07:04:15 +0200
Message-ID: <20160927050415.GA2024@lst.de>
References: <20160927112334.3615159e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:52590 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750840AbcI0FES (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 01:04:18 -0400
Content-Disposition: inline
In-Reply-To: <20160927112334.3615159e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Tue, Sep 27, 2016 at 11:23:34AM +1000, Stephen Rothwell wrote:
> Hi Doug,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Please just disable broken staging code like lustre for the linux-next
builds. We had that discussion before, didn't we?
