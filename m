From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: [PATCH 10/17] wireless: update gfp/slab.h includes
Date: Wed, 19 May 2010 10:45:05 -0400
Message-ID: <20100519144505.GD2412@tuxdriver.com>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
 <1269885165-18617-11-git-send-email-tj@kernel.org>
 <20100519190230.52385a65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:42858 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110Ab0ESPAP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2010 11:00:15 -0400
Content-Disposition: inline
In-Reply-To: <20100519190230.52385a65.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, "David S. Miller" <davem@davemloft.net>

On Wed, May 19, 2010 at 07:02:30PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> On Tue, 30 Mar 2010 02:52:38 +0900 Tejun Heo <tj@kernel.org> wrote:
> >
> > Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> > gfp.h or slab.h is included as necessary.
> > 
> > Signed-off-by: Tejun Heo <tj@kernel.org>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: John W. Linville <linville@tuxdriver.com>

> I think that this patch is still needed in the wireless tree and I notice
> that Dave has asked Linus to pull the net tree (containing the wireless
> tree).  I have been carrying this in linux-next.

Looks like this was part of a series...who merged the rest of it?
I guess I presumed they would take care of the series.

Tejun, I wouldn't mind a repost, preferrably Cc:
linux-wireless@vger.kernel.org...

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
