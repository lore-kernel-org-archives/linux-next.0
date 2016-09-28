From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Thu, 29 Sep 2016 07:45:43 +1000
Message-ID: <20160929074543.5bb734af@canb.auug.org.au>
References: <20160927112334.3615159e@canb.auug.org.au>
        <20160928114348.2832fe46@canb.auug.org.au>
        <57EBDAFB.9060204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754001AbcI1Vpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 17:45:46 -0400
In-Reply-To: <57EBDAFB.9060204@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

Hi Doug,

On Wed, 28 Sep 2016 11:00:11 -0400 Doug Ledford <dledford@redhat.com> wrote:
>
> That doesn't seem like a particularly good thing to put in.  Wouldn't
> you end up just reverting it later when they fix lustre?  And are you
> going to revert the revert when it breaks again and revert the revert of
> the revert when it's fixed again?  That just seems a lot of churn.  I
> thought it was generally accepted that things in staging might or might
> not work and if they don't, we don't care?  Am I wrong on that?

The allmodconfig build needs to work.  Linus does an allmodconfig build
as part of his testing ...

Part of the fix patch should reenable building of the currently broken code.
-- 
Cheers,
Stephen Rothwell
