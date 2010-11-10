From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: build failure after merge of the fsnotify tree
Date: Wed, 10 Nov 2010 10:32:23 -0500
Message-ID: <1289403143.3083.54.camel@localhost.localdomain>
References: <20101110125321.79c5c8a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28968 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756279Ab0KJPck (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Nov 2010 10:32:40 -0500
In-Reply-To: <20101110125321.79c5c8a2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, LinoSanfilippo@gmx.de

On Wed, 2010-11-10 at 12:53 +1100, Stephen Rothwell wrote:
> Hi Eric,
> 
> After merging the fsnotify tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/notify/mark.c: In function 'fsnotify_add_mark':
> fs/notify/mark.c:230: error: 'struct fsnotify_group' has no member named 'fanotify_data'
> 
> Caused by commit 0ed64ab6b338e4269c9f25de83781619ecd624f1 ("fsnotify:
> code and error path cleanup in fsnotify_add_mark").  This build has
> CONFIG_FANOTIFY not set.
> 
> I have used the fsnotify tree from next-20101109 for today.

I wasn't actually that commit it was:

5876b30fc2c91d67386f91da62b14f159d7bb41f ("fanotify: Do check against
max_marks and increase number of group marks atomically")

Lino, I knew there was a reason I was happy with the small race.  Would
you like to take another stab or should I just revert?

-Eric
