From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] linux-next: Tree for June 29 (hwmon/coretemp)
Date: Tue, 29 Jun 2010 21:38:37 +0200
Message-ID: <20100629213837.50a64edc@hyperion.delvare>
References: <20100629151938.6981044d.sfr@canb.auug.org.au>
	<20100629080257.43b365dd.randy.dunlap@oracle.com>
	<20100629210532.314250ba@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:55057 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754097Ab0F2Tik (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jun 2010 15:38:40 -0400
In-Reply-To: <20100629210532.314250ba@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, lm-sensors@lm-sensors.org, linux-next@vger.kernel.org, Huaxu Wan <huaxu.wan@intel.com>

On Tue, 29 Jun 2010 21:05:32 +0200, Jean Delvare wrote:
> Hi Randy,
> 
> On Tue, 29 Jun 2010 08:02:57 -0700, Randy Dunlap wrote:
> > On Tue, 29 Jun 2010 15:19:38 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20100628:
> > > 
> > > My fixes tree is now empty.
> > 
> > 
> > when CONFIG_SMP is not enabled:
> > 
> > drivers/hwmon/coretemp.c:308: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
> > drivers/hwmon/coretemp.c:428: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'
> > drivers/hwmon/coretemp.c:429: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
> > drivers/hwmon/coretemp.c:457: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'
> > drivers/hwmon/coretemp.c:458: error: 'struct cpuinfo_x86' has no member named 'cpu_core_id'
> 
> Thanks for the heads up, I hadn't considered the no-SMP case. I'll take
> a look immediately.

Should be fixed now, thanks again.

-- 
Jean Delvare
