From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Feb 17 (uml)
Date: Fri, 17 Feb 2012 10:34:48 -0800
Message-ID: <4F3E9DC8.6090304@xenotime.net>
References: <20120217165045.2394d944d6efc37104421d2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:46444 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752317Ab2BQSeu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2012 13:34:50 -0500
In-Reply-To: <20120217165045.2394d944d6efc37104421d2e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, user-mode-linux-devel@lists.sourceforge.net

On 02/16/2012 09:50 PM, Stephen Rothwell wrote:
> Hi all,
>
> Changes since 20120216:


uml on x86_64 (defconfig):

   CC      arch/um/kernel/asm-offsets.s
In file included from linux-next-20120217/include/linux/slab.h:12:0,
                  from linux-next-20120217/include/linux/crypto.h:23,
                  from 
linux-next-20120217/arch/x86/um/shared/sysdep/kernel-offsets.h:4,
                  from linux-next-20120217/arch/um/kernel/asm-offsets.c:1:
linux-next-20120217/include/linux/gfp.h: In function 'gfp_zonelist':
linux-next-20120217/include/linux/gfp.h:267:1: error: 
'__enabled_CONFIG_NUMA' undeclared (first use in this function)
linux-next-20120217/include/linux/gfp.h:267:1: note: each undeclared 
identifier is reported only once for each function it appears in
linux-next-20120217/include/linux/gfp.h:267:1: error: 
'__enabled_CONFIG_NUMA_MODULE' undeclared (first use in this function)



-- 
~Randy
