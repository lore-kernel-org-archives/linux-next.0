From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Thu, 22 Sep 2011 07:56:34 -0400
Message-ID: <m262kk23kd.fsf@bob.laptop.org>
References: <20110922161350.a3a0f41a56dd99760f688e3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:33220 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752556Ab1IVL5X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Sep 2011 07:57:23 -0400
In-Reply-To: <20110922161350.a3a0f41a56dd99760f688e3a@canb.auug.org.au>
	(Stephen Rothwell's message of "Thu, 22 Sep 2011 16:13:50 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Adrian Hunter <adrian.hunter@intel.com>

Hi,

On Thu, Sep 22 2011, Stephen Rothwell wrote:
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/mmc/core/core.c: In function 'mmc_do_hw_reset':
> drivers/mmc/core/core.c:1848:11: error: 'struct mmc_ios' has no member
> named 'ddr'

Thanks, sorry about that.  I had caught it locally, but pushing my fix
failed.  It's fixed now.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
