From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 15:10:40 -0700
Message-ID: <20150727221040.GA4038@jtriplet-mobl1>
References: <20150724153334.543cfc7b@canb.auug.org.au>
 <1437768965.3298.52.camel@stgolabs.net>
 <20150724230902.GQ3717@linux.vnet.ibm.com>
 <20150725194739.GA9753@x>
 <1437859442.3298.68.camel@stgolabs.net>
 <20150725223524.GA14593@x>
 <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
 <20150727202758.GA28119@cloud>
 <20150727133133.a2c22062fba70b971f449d0a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40763 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739AbbG0WKr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 18:10:47 -0400
Content-Disposition: inline
In-Reply-To: <20150727133133.a2c22062fba70b971f449d0a@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2015 at 01:31:33PM -0700, Andrew Morton wrote:
> On Mon, 27 Jul 2015 13:27:58 -0700 josh@joshtriplett.org wrote:
> 
> > I agree with that.  I'm wondering if, rather than making the
> > SRCU-ification optional, shrinkers themselves could just be optional.
> > Unless I'm badly misunderstanding what shrinkers do, they seem like a
> > perfect example of something that could be omitted with little to no
> > impact.  (Stub them out, make them never called, and if you run out of
> > memory just be unhappy.  Ditto for the oom-killer, which really ought to
> > be optional.)
> 
> The shrinkers do important stuff ;) "find /" will consume large amounts
> of memory for inode and dentry caches.  The shrinkers are how we free
> that up again.

*Ah*, I see.  I misunderstood their purpose, and I didn't realize that
was one of the cases they covered.  While that might be possible to
reduce, it doesn't sound like it can go away entirely. :)

- Josh Triplett
