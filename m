From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 30 (uml)
Date: Tue, 30 Sep 2014 11:50:06 -0700
Message-ID: <542AFB5E.7040308@infradead.org>
References: <20140930201244.0a4596ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:46160 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaI3SuM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Sep 2014 14:50:12 -0400
In-Reply-To: <20140930201244.0a4596ec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>

On 09/30/14 03:12, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20140926:
> 

uml defconfig on i386 and x86_64:

In file included from ../arch/x86/um/asm/processor.h:31:0,
                 from ../arch/um/include/asm/uaccess.h:16,
                 from ../arch/um/include/asm/thread_info.h:13,
                 from ../include/linux/thread_info.h:54,
                 from ../include/asm-generic/current.h:4,
                 from arch/um/include/generated/asm/current.h:1,
                 from ../include/linux/mutex.h:13,
                 from ../include/linux/kernfs.h:13,
                 from ../include/linux/sysfs.h:15,
                 from ../include/linux/kobject.h:21,
                 from ../include/linux/device.h:17,
                 from ../include/linux/platform_device.h:14,
                 from ../drivers/base/platform.c:14:
../arch/um/include/asm/processor-generic.h:107:19: error: expected identifier or '(' before '&' token
 #define cpu_data (&boot_cpu_data)
                   ^
../include/linux/pm_domain.h:74:23: note: in expansion of macro 'cpu_data'
  struct gpd_cpu_data *cpu_data;
                       ^


-- 
~Randy
