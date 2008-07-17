From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 17 (net_namespace)
Date: Thu, 17 Jul 2008 15:34:00 -0700
Message-ID: <20080717153400.e9ef066a.randy.dunlap@oracle.com>
References: <20080718012842.690b8346.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:18432 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753981AbYGQWe1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 18:34:27 -0400
In-Reply-To: <20080718012842.690b8346.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

With PROC_FS=n, PROC_SYSCTL=n, SYSCTL_SYSCALL=n, the <sysctls> field of
struct net in include/net/net_namespace.h has problems:


In file included from /local/linsrc/linux-next-20080717/include/linux/init_task.h:12,
                 from /local/linsrc/linux-next-20080717/kernel/pid.c:37:
/local/linsrc/linux-next-20080717/include/net/net_namespace.h:40: error: field 'sysctls' has incomplete type


In file included from /local/linsrc/linux-next-20080717/include/linux/netdevice.h:44,
                 from /local/linsrc/linux-next-20080717/include/linux/if_bridge.h:105,
                 from /local/linsrc/linux-next-20080717/fs/compat_ioctl.c:24:
/local/linsrc/linux-next-20080717/include/net/net_namespace.h:40: error: field 'sysctls' has incomplete type


In file included from /local/linsrc/linux-next-20080717/include/linux/init_task.h:12,
                 from /local/linsrc/linux-next-20080717/arch/x86/kernel/init_task.c:5:
/local/linsrc/linux-next-20080717/include/net/net_namespace.h:40: error: field 'sysctls' has incomplete type



---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
