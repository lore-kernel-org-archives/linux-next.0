From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the file-locks tree
Date: Wed, 17 May 2017 22:35:57 +1000
Message-ID: <20170517223557.3b9f78b5@canb.auug.org.au>
References: <20170517102752.3bd4da91@canb.auug.org.au>
        <1494983403.21644.8.camel@poochiereds.net>
        <20170517114805.57714a7a@canb.auug.org.au>
        <1495024366.2930.2.camel@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46109 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751607AbdEQMgB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 May 2017 08:36:01 -0400
In-Reply-To: <1495024366.2930.2.camel@poochiereds.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jeff,

On Wed, 17 May 2017 08:32:46 -0400 Jeff Layton <jlayton@poochiereds.net> wrote:
>
> On Wed, 2017-05-17 at 11:48 +1000, Stephen Rothwell wrote:
> > 
> > On Tue, 16 May 2017 21:10:03 -0400 Jeff Layton <jlayton@poochiereds.net> wrote:  
> > > 
> > > I think this patch will probably fix it, but I don't have a 32-bit host
> > > set up to build on just now. I'll go ahead and merge this into the
> > > branch, and will plan to test it tomorrow (hopefully before the next
> > > fetch).  
> > 
> > Thanks.  If you don't get around to testing, I will let you know if it
> > still fails tomorrow :-)
> 
> Yep, that fixes it (at least on i386). I squashed it into patch 1 of
> Christoph's series. Please let me know if you see further problems.

Thanks, will do.

-- 
Cheers,
Stephen Rothwell
