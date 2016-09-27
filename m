From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 27 Sep 2016 15:48:20 +1000
Message-ID: <20160927154820.11d17334@canb.auug.org.au>
References: <20160927112334.3615159e@canb.auug.org.au>
        <20160927050415.GA2024@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51385 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752132AbcI0FsW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 01:48:22 -0400
In-Reply-To: <20160927050415.GA2024@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Christoph,

On Tue, 27 Sep 2016 07:04:15 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 27, 2016 at 11:23:34AM +1000, Stephen Rothwell wrote:
> > Hi Doug,
> > 
> > After merging the rdma tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:  
> 
> Please just disable broken staging code like lustre for the linux-next
> builds. We had that discussion before, didn't we?

Yeah, sorry.  Note, however, that you bothered to fix up this same
staging file in another of your patches ...

-- 
Cheers,
Stephen Rothwell
