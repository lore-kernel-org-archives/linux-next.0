From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Tue, 1 Sep 2009 10:13:25 +0200
Message-ID: <20090901081324.GS12579@kernel.dk>
References: <20090901145949.58610c23.sfr@canb.auug.org.au> <20090901153038.807f5586.sfr@canb.auug.org.au> <20090901053807.GJ12579@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:34548 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbZIAINX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Sep 2009 04:13:23 -0400
Content-Disposition: inline
In-Reply-To: <20090901053807.GJ12579@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 01 2009, Jens Axboe wrote:
> On Tue, Sep 01 2009, Stephen Rothwell wrote:
> > Hi Alasdair,
> > 
> > On Tue, 1 Sep 2009 14:59:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > I have used the version of the block tree from next-20090831 for today.
> > 
> > Which means that I have had to use yesterday's version of the
> > device-mapper tree as well (since it is based on the block tree).
> 
> Ah darn, sorry about that. I'll get that updated in about an hours time
> and do a full compile.

This is resolved now.

-- 
Jens Axboe
