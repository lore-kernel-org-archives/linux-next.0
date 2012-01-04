From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: ARM context switch changes for -next
Date: Wed, 4 Jan 2012 09:25:01 +0000
Message-ID: <20120104092501.GI22876@arm.com>
References: <20120103181418.GH22876@arm.com>
 <20120104095634.8f39a78b3ca6c85bd045bb97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:65350 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754522Ab2ADJZt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 04:25:49 -0500
Content-Disposition: inline
In-Reply-To: <20120104095634.8f39a78b3ca6c85bd045bb97@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

On Tue, Jan 03, 2012 at 10:56:34PM +0000, Stephen Rothwell wrote:
> On Tue, 3 Jan 2012 18:14:18 +0000 Catalin Marinas <catalin.marinas@arm.com> wrote:
> > Could you please pull the branch below into -next? I'd like to give it a
> > few weeks of exposure before sending an official pull request to
> > Russell. One of the patches introduces a scheduler hook and Peter Z
> > agreed with it. You may get a conflict in -next since some scheduler
> > files have been renamed.
> 
> Do you expect this to be merged by Linus during the 3.3 merge window?  If
> so, it s a bit late (I expect Linus to do the 3.2 release any time).  If
> not, I would like not to add it to -next until after v3.3-rc1 is released
> so that it doesn't complicate things for the merge window.

These patches are aimed for 3.4, not the upcoming merging window.

I'll ping you again after 3.3-rc1.

Thanks.

-- 
Catalin
