From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree (and
 warning)
Date: Mon, 14 Nov 2011 15:39:57 -0800
Message-ID: <20111114233957.GF30922@google.com>
References: <20111114131730.ae09bb18b87e67f61a97275e@canb.auug.org.au>
 <201111150014.50898.rjw@sisk.pl>
 <Pine.LNX.4.64.1111150032170.32143@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:45005 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753644Ab1KNXkC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2011 18:40:02 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1111150032170.32143@axis700.grange>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Dan Williams <dan.j.williams@intel.com>

Hello, Guennadi.

On Tue, Nov 15, 2011 at 12:33:29AM +0100, Guennadi Liakhovetski wrote:
> No, this isn't a correct fix.

I've been looking at the code and am scratching my head about what
happens after timeout.  If test timed out (tmo == 0), it prints out
error message and continues to the next iteration of the test loop,
which will reinitialize the on-stack completion.  This essentially
makes the previous test run's callback_param pointer dangling.  The
completion needs to be either detached from the callback or waited
upon even if it timed out.  Am I missing something?

Thanks.

-- 
tejun
