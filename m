From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 1 (sysfs.h)
Date: Fri, 1 Aug 2008 11:14:52 -0700
Message-ID: <20080801111452.1b4c55d3.randy.dunlap@oracle.com>
References: <20080801165808.68f833ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757776AbYHASRt@vger.kernel.org>
In-Reply-To: <20080801165808.68f833ec.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

When CONFIG_SYSFS=n:

  CC      arch/x86/kernel/asm-offsets.s
In file included from linux-next-20080801/include/linux/kobject.h:21,
                 from linux-next-20080801/include/linux/module.h:16,
                 from linux-next-20080801/include/linux/crypto.h:21,
                 from linux-next-20080801/arch/x86/kernel/asm-offsets_64.c:7,
                 from linux-next-20080801/arch/x86/kernel/asm-offsets.c:4:
linux-next-20080801/include/linux/sysfs.h:247: error: return type is an incomplete type
linux-next-20080801/include/linux/sysfs.h: In function 'sysfs_get':
linux-next-20080801/include/linux/sysfs.h:248: warning: 'return' with a value, in function returning void
make[2]: *** [arch/x86/kernel/asm-offsets.s] Error 1




---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
