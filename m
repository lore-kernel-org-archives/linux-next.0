From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Date: Tue, 27 May 2014 13:40:03 +0300
Message-ID: <1401187203.1304.125.camel@sauron.fi.intel.com>
References: <20140522153047.62c1721c@canb.auug.org.au>
	 <20140526174225.GC5241@norris-Latitude-E6410>
	 <20140527095942.0a071e63@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:31747 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751705AbaE0KkH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2014 06:40:07 -0400
In-Reply-To: <20140527095942.0a071e63@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vincenzo Aliberti <vincenzo.aliberti@gmail.com>

On Tue, 2014-05-27 at 09:59 +1000, Stephen Rothwell wrote:
> Hi Brian,
> 
> On Mon, 26 May 2014 10:42:25 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> >
> > On Thu, May 22, 2014 at 03:30:47PM +1000, Stephen Rothwell wrote:
> > > Hi Artem,
> > 
> > FYI, I'm managing this tree now, not Artem.
> 
> OK, noted.  Is there a different URL for the tree as well?  Currently
> it is git://git.infradead.org/users/dedekind/l2-mtd-2.6.git#master .

Hi Stephen,

apologies for not informing you about the onwership changes in time. But
yes, Brian takes care of this tree now.

The URL you have is technically correct, but it is better to use this
instead:

git://git.infradead.org/l2-mtd.git#master

The old URL is just a symlink to the above one nowadays. Thanks!

-- 
Best Regards,
Artem Bityutskiy
