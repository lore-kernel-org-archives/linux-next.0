From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: linux-next: build failure after merge of the fsnotify tree
Date: Wed, 10 Nov 2010 18:14:05 +0100
Message-ID: <20101110171405.GA4485@lsanfilippo.unix.rd.tt.avira.com>
References: <20101110125321.79c5c8a2.sfr@canb.auug.org.au> <1289403143.3083.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:47812 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1757230Ab0KJRPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Nov 2010 12:15:43 -0500
Content-Disposition: inline
In-Reply-To: <1289403143.3083.54.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wed, Nov 10, 2010 at 10:32:23AM -0500, Eric Paris wrote:
> On Wed, 2010-11-10 at 12:53 +1100, Stephen Rothwell wrote:
> > Hi Eric,
> > 
> > After merging the fsnotify tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > fs/notify/mark.c: In function 'fsnotify_add_mark':
> > fs/notify/mark.c:230: error: 'struct fsnotify_group' has no member named 'fanotify_data'
> > 
> > Caused by commit 0ed64ab6b338e4269c9f25de83781619ecd624f1 ("fsnotify:
> > code and error path cleanup in fsnotify_add_mark").  This build has
> > CONFIG_FANOTIFY not set.
> > 
> > I have used the fsnotify tree from next-20101109 for today.
> 
> I wasn't actually that commit it was:
> 
> 5876b30fc2c91d67386f91da62b14f159d7bb41f ("fanotify: Do check against
> max_marks and increase number of group marks atomically")
> 
> Lino, I knew there was a reason I was happy with the small race.  Would
> you like to take another stab or should I just revert?
> 
> -Eric
> 

Damn, sorry for that.
Please revert it Eric. But we should somehow avoid this race.  What about 
making max_marks a generic groups attribute?

Lino 
 
