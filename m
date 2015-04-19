From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Sun, 19 Apr 2015 13:47:55 +0200
Message-ID: <20150419114755.GA5674@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
 <20150415211956.GA6703@chrystal.uk.oracle.com>
 <552F13AF.5030606@roeck-us.net>
 <20150416082116.GB6703@chrystal.uk.oracle.com>
 <552FAF4C.2050202@roeck-us.net>
 <5531F12B.7010401@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:16714 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbbDSLpl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Apr 2015 07:45:41 -0400
Content-Disposition: inline
In-Reply-To: <5531F12B.7010401@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Fri, Apr 17, 2015 at 10:52:43PM -0700, Guenter Roeck wrote:
> Hi Quentin,

Hi Guenter,

> 
> it looks like there is another failure in linux-next, this time with sparc64:allmodconfig:
> 
> WARNING: arch/sparc/kernel/built-in.o(__ex_table+0x3b4): Section mismatch in reference from the (unknown reference) (unknown) to the variable :__retl_efault
> /bin/sh: line 1: 22844 Floating point exception(core dumped) scripts/mod/modpost arch/sparc/kernel/built-in.o
> 
> The problem was previously hidden by a different build failure.

Thanks for letting me know, but I think this was fixed by the 3 earlier
patches Rusty already applied in it its tree.  I can reproduce this on

  ae46885 ("modpost: handle -ffunction-sections")

But it's fine on top of Rusty's modules-next (464f362).

Let me know if I'm missing something!

Thanks,
Quentin
