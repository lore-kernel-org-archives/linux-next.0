From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: merge conflict resolution for pm-freezer
Date: Thu, 1 Dec 2011 22:42:57 +0100
Message-ID: <201112012242.58090.rjw@sisk.pl>
References: <20111128233055.GF3858@google.com> <201111302051.54501.rjw@sisk.pl> <20111201185322.GC13173@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:38082 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754348Ab1LAVkE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Dec 2011 16:40:04 -0500
In-Reply-To: <20111201185322.GC13173@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: sfr@canb.auug.org.au, linux-pm@vger.kernel.org, linux-next@vger.kernel.org

On Thursday, December 01, 2011, Tejun Heo wrote:
> Hello, Rafael.  (Sorry about the delay).
> 
> On Wed, Nov 30, 2011 at 08:51:54PM +0100, Rafael J. Wysocki wrote:
> > > > Rafael, please feel free to pull or resolve in any way you see fit.
> > > 
> > > Well, could you please post a fix patch on top of my pm-freezer branch?
> > > That would be the most convenient way to me. :-)
> > 
> > No, that won't work.  I think I'll resolve the conflict when merging pm-freezer
> > into pm-for-linus later.
> 
> Heh, yeah, I was a bit confused.  If you don't want to pull it
> directly, I think the best way would be merging and then comparing the
> two trees.

Can you please double check if cgroup_freezer.c is correct in my linux-next
branch?

Rafael
