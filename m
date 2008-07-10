From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/13] Updated V4  - Regulator Framework
Date: Thu, 10 Jul 2008 02:08:48 -0700
Message-ID: <20080710020848.066cfc8c.akpm@linux-foundation.org>
References: <1209742841.12502.40.camel@odin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38981 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751340AbYGJJOw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 05:14:52 -0400
In-Reply-To: <1209742841.12502.40.camel@odin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lg@opensource.wolfsonmicro.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, arm kernel <linux-arm-kernel@lists.arm.linux.org.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, 02 May 2008 16:40:41 +0100 Liam Girdwood <lg@opensource.wolfsonmicro.com> wrote:

> This is an updated version of the kernel voltage & current regulator
> framework based on comments received from version 3 of the patch series.

git-regulator.patch has been in -mm for two months without incident.  I'd
forgotten about it.   This is bad - we should have put it into linux-next.

If you hope to get this into 2.6.27 then please send the git URL to Stephen
and the linux-next list asap.  Please also resend the patches to this list
for re-review.  Then, if it doesn't get shot down, send Linux a pull
request during the 2.6.27 merge window.  ie: about one week from today.

Thanks.
