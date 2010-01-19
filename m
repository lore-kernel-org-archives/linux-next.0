From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 19 Jan 2010 11:59:27 +0100
Message-ID: <20100119105926.GA554@sortiz.org>
References: <20100119150653.1b9bbf67.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:45710 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752841Ab0ASK5y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2010 05:57:54 -0500
Content-Disposition: inline
In-Reply-To: <20100119150653.1b9bbf67.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Maccarrone <darkstar6262@gmail.com>

Hi Stephen,

On Tue, Jan 19, 2010 at 03:06:53PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mfd/htc-i2cpld.c: In function 'htcpld_set_type':
> drivers/mfd/htc-i2cpld.c:106: error: 'irq_desc' undeclared (first use in this function)
> 
> Caused by commit b4714172cd2f1cd8694546169237c30c5b4fdf3b ("mfd: Add
> HTCPLD driver").
Thanks for the report. It should be all fixed now.

Cheers,
Samuel.


> I have used the mfd tree from next-20100118 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



-- 
Intel Open Source Technology Centre
http://oss.intel.com/
