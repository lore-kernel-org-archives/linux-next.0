From: Tejun Heo <tj@kernel.org>
Subject: Re: merge conflict resolution for pm-freezer
Date: Thu, 1 Dec 2011 10:53:33 -0800
Message-ID: <20111201185322.GC13173@google.com>
References: <20111128233055.GF3858@google.com>
 <201111292321.27660.rjw@sisk.pl>
 <201111302051.54501.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52635 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753849Ab1LASxj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 13:53:39 -0500
Content-Disposition: inline
In-Reply-To: <201111302051.54501.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: sfr@canb.auug.org.au, linux-pm@vger.kernel.org, linux-next@vger.kernel.org

Hello, Rafael.  (Sorry about the delay).

On Wed, Nov 30, 2011 at 08:51:54PM +0100, Rafael J. Wysocki wrote:
> > > Rafael, please feel free to pull or resolve in any way you see fit.
> > 
> > Well, could you please post a fix patch on top of my pm-freezer branch?
> > That would be the most convenient way to me. :-)
> 
> No, that won't work.  I think I'll resolve the conflict when merging pm-freezer
> into pm-for-linus later.

Heh, yeah, I was a bit confused.  If you don't want to pull it
directly, I think the best way would be merging and then comparing the
two trees.

Thanks.

-- 
tejun
