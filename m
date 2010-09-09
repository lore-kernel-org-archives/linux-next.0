From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (suspend tree related)
Date: Thu, 9 Sep 2010 23:20:55 +0200
Message-ID: <201009092320.55966.rjw@sisk.pl>
References: <20100909125838.6c82edc4.sfr@canb.auug.org.au> <1284002036.2614.39.camel@shrek.rexursive.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39293 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753111Ab0IIVWG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Sep 2010 17:22:06 -0400
In-Reply-To: <1284002036.2614.39.camel@shrek.rexursive.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bojan Smojver <bojan@rexursive.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, September 09, 2010, Bojan Smojver wrote:
> On Thu, 2010-09-09 at 12:58 +1000, Stephen Rothwell wrote:
> > Caused by commit 2b2609c19ff19361360552786bd252ef40dfe5ce ("PM /
> > Hibernate: Compress hibernation image with LZO").
> > 
> > See Rule 1 in Documentation/SubmitChecklist.  There is a missing
> > include of linux/vmalloc.h. 
> 
> Thanks. I see I succeeded - first patch broke the build - yay! ;-)
> 
> Rafael,
> 
> Can you please add vmalloc.h to the thingy. I don't have commit access,
> obviously.

Fixed and pushed back.

Thanks,
Rafael
