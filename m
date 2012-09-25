From: Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 25 Sep 2012 08:47:02 +0200
Message-ID: <20120925064702.GH26600@darwin>
References: <20120925134735.067e4f119bd71099df30724f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48062 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773Ab2IYGrm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 02:47:42 -0400
Content-Disposition: inline
In-Reply-To: <20120925134735.067e4f119bd71099df30724f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

El Tue, Sep 25, 2012 at 01:47:35PM +1000 Stephen Rothwell ha dit:

> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> FATAL: modpost: GPL-incompatible module tps65217_bl.ko uses GPL-only symbol 'platform_driver_unregister'
> 
> Caused by commit dbc14ec43af2 ("backlight: Add TPS65217 WLED driver").
> 
> I have used the mfd tree from next-20120924 for today.

the module license of that driver is "GPLv2", apparently this should
be "GPL v2". for testing i used a built-in driver, so i didn't see the
problem.

i will submit a patch with the corrected license string later this day

best regards

-- 
Matthias Kaehlcke
Embedded Linux Developer
Amsterdam

               The only power to which man should aspire
                is that which he exercises over himself
                            (Elie Wiesel)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
