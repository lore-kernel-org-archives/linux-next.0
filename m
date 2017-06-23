From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 23 Jun 2017 13:33:14 +1000
Message-ID: <20170623133314.3df3dbbe@canb.auug.org.au>
References: <20170623130632.03bc60af@canb.auug.org.au>
        <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
        <20170623132433.5aff6b19@canb.auug.org.au>
        <612521b1-f272-3e4a-e295-c3bac3e54f25@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753925AbdFWDdQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 23:33:16 -0400
In-Reply-To: <612521b1-f272-3e4a-e295-c3bac3e54f25@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jens,

On Thu, 22 Jun 2017 21:27:04 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 06/22/2017 09:24 PM, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > On Thu, 22 Jun 2017 21:09:22 -0600 Jens Axboe <axboe@kernel.dk> wrote:  
> >>
> >> I'll cherry pick that commit into the 4.13 branch to get this resolved.  
> > 
> > Merging commit 8e8320c9315c might give a better result ...  
> 
> I don't want to pull the whole thing in, just that offending commit.

Your tree is already based on v4.12-rc5 so you are not really pulling
much in at all:

$ git rev-list --count --no-merges 8e8320c9315c ^block/for-next 
14

-- 
Cheers,
Stephen Rothwell
