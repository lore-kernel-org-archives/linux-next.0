From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 24 (events/amd/power)
Date: Thu, 24 Mar 2016 10:05:03 -0700
Message-ID: <56F41E3F.8000407@infradead.org>
References: <20160324130941.5931a051@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43986 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704AbcCXRFL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2016 13:05:11 -0400
In-Reply-To: <20160324130941.5931a051@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, acme@kernel.org

On 03/23/16 19:09, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v4.7 related material to your linux-next included
> trees until after v4.6-rc1 is released.
> 
> Changes since 20160323:
> 

on i386:

when CONFIG_CPU_SUP_INTEL is not enabled:

In file included from ../include/linux/kobject.h:21:0,
                 from ../include/linux/module.h:17,
                 from ../arch/x86/events/amd/power.c:13:
../arch/x86/events/amd/../perf_event.h:660:31: error: 'events_sysfs_show' undeclared here (not in a function)
  .attr  = __ATTR(_name, 0444, events_sysfs_show, NULL), \
                               ^
../include/linux/sysfs.h:103:10: note: in definition of macro '__ATTR'
  .show = _show,      \
          ^
../arch/x86/events/amd/power.c:181:1: note: in expansion of macro 'EVENT_ATTR_STR'
 EVENT_ATTR_STR(power-pkg, power_pkg, "event=0x01");
 ^
../scripts/Makefile.build:291: recipe for target 'arch/x86/events/amd/power.o' failed



-- 
~Randy
