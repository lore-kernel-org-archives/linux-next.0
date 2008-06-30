From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: build failure
Date: Mon, 30 Jun 2008 08:49:12 -0700
Message-ID: <20080630084912.df038c30.randy.dunlap@oracle.com>
References: <20080630232248.8d993f1d.sfr@canb.auug.org.au>
	<20080630081239.f62aec40.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:46025 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515AbYF3Pty (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 11:49:54 -0400
In-Reply-To: <20080630081239.f62aec40.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Mon, 30 Jun 2008 08:12:39 -0700 Randy Dunlap wrote:

> On Mon, 30 Jun 2008 23:22:48 +1000 Stephen Rothwell wrote:
> 
> > Hi Sam,
> > 
> > Today's linux-next build (i386 defconfig) failed like this:
> > 
> >   GEN     /scratch/sfr/i386_defconfig/Makefile
> >   GEN     /scratch/sfr/i386_defconfig/Makefile
> >   SYMLINK include/asm -> include/asm-x86
> >   Using /scratch/sfr/next as source for kernel
> > /bin/sh: include/asm/asm-offsets.h: No such file or directory
> 
> All (ALL) of my randconfig builds on i386 and x86_64 are failing like this.

I should have said:

I'm using the daily patch*bz2 file, not git.
And I'm using O= for output.
When not using O=, the build does not have this problem.


> 
> > I can only guess that this is a kbuild problem.  The object include directory
> > looked like this:
> > 
> > /scratch/sfr/i386_defconfig/include$ ls -la
> > total 24
> > drwxr-xr-x   5 sfr users 4096 2008-06-30 23:06 .
> > drwxr-xr-x   8 sfr users 4096 2008-06-30 23:06 ..
> > lrwxrwxrwx   1 sfr users    7 2008-06-30 23:06 asm -> asm-x86
> > drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 asm-i386
> > drwxr-xr-x 184 sfr users 8192 2008-06-30 23:06 config
> > drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 linux
> > 
> > My powerpc (ppc64_defconfig, allnoconfig, allyesconfig and
> > ppc44x_deconfig), x86_64 (allmodconfig), sparc (defconfig) and sparc64
> > (defconfig) build all worked.  The kisskb overnight builds will show us
> > what else is broken.


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
