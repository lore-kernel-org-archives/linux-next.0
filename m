From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 1 (sysfs.h)
Date: Fri, 1 Aug 2008 15:36:14 -0500 (CDT)
Message-ID: <33469382.1217622974098.JavaMail.oracle@acsmt303.oracle.com>
References: <20080801165808.68f833ec.sfr@canb.auug.org.au> <20080801111452.1b4c55d3.randy.dunlap@oracle.com> <20080801182612.GB4788@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:29414 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755884AbYHAUgX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2008 16:36:23 -0400
In-Reply-To: <20080801182612.GB4788@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

> > When CONFIG_SYSFS=n:
> > 
> >   CC      arch/x86/kernel/asm-offsets.s
> > In file included from linux-next-20080801/include/linux/kobject.h:21,
> >                  from linux-next-20080801/include/linux/module.h:16,
> >                  from linux-next-20080801/include/linux/crypto.h:21,
> >                  from linux-next-20080801/arch/x86/kernel/asm-offsets_64.c:7,
> >                  from linux-next-20080801/arch/x86/kernel/asm-offsets.c:4:
> > linux-next-20080801/include/linux/sysfs.h:247: error: return type is an incomplete type
> > linux-next-20080801/include/linux/sysfs.h: In function 'sysfs_get':
> > linux-next-20080801/include/linux/sysfs.h:248: warning: 'return' with a value, in function returning void
> > make[2]: *** [arch/x86/kernel/asm-offsets.s] Error 1
> 
> Ah, missed a "*".  It's Neil's fault :)
> 
> I'll go fix this up, it's for when CONFIG_SYSFS is set to N,
> right?

see line 1 above.
