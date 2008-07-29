From: Liam Girdwood <lg@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/13] Updated V4  - Regulator Framework
Date: Tue, 29 Jul 2008 21:33:46 +0100
Message-ID: <1217363626.7498.47.camel@odin>
References: <1209742841.12502.40.camel@odin>
	 <20080710020848.066cfc8c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54549 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752296AbYG2Udt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 16:33:49 -0400
In-Reply-To: <20080710020848.066cfc8c.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, arm kernel <linux-arm-kernel@lists.arm.linux.org.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, 2008-07-10 at 02:08 -0700, Andrew Morton wrote:
> On Fri, 02 May 2008 16:40:41 +0100 Liam Girdwood <lg@opensource.wolfsonmicro.com> wrote:
> 
> > This is an updated version of the kernel voltage & current regulator
> > framework based on comments received from version 3 of the patch series.
> 
> git-regulator.patch has been in -mm for two months without incident.  I'd
> forgotten about it.   This is bad - we should have put it into linux-next.
> 
> If you hope to get this into 2.6.27 then please send the git URL to Stephen
> and the linux-next list asap.  Please also resend the patches to this list
> for re-review.  Then, if it doesn't get shot down, send Linux a pull
> request during the 2.6.27 merge window.  ie: about one week from today.

Would there be any chance of this going in for rc2 ? (2 pull requests
sent recently prior to rc1) or would it be better now waiting for the
2.6.28 merge window ?

Thanks

Liam
