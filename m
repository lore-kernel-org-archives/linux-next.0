From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 17 (pinctrl-msm)
Date: Mon, 17 Feb 2014 09:33:48 -0800
Message-ID: <530247FC.90606@infradead.org>
References: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48208 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191AbaBQRdv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2014 12:33:51 -0500
In-Reply-To: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On 02/16/2014 10:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> If you see failures in building this tree due to missing declarations of
> k..alloc/free, then it may be caused by commit 2bd59d48ebfb ("cgroup:
> convert to kernfs").  Please send Tejun Heo <tj@kernel.org> a patch
> adding an inclusion of linux/slab.h to the appropriate file(s).
> 
> This tree fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140214:
> 

on i386:

ERROR: "handle_bad_irq" [drivers/pinctrl/pinctrl-msm.ko] undefined!


-- 
~Randy
