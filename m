From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 17 (sysctl/syscall)
Date: Thu, 17 Jul 2008 15:21:31 -0700
Message-ID: <20080717152131.13ada1fc.randy.dunlap@oracle.com>
References: <20080718012842.690b8346.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:20686 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756220AbYGQWXG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 18:23:06 -0400
In-Reply-To: <20080718012842.690b8346.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Who is making patches to kernel/sysctl.c ?

With
CONFIG_SYSCTL=y
# CONFIG_SYSCTL_SYSCALL is not set

linux-next-20080717 produces:

linux-next-20080717/kernel/sysctl.c:2970: error: redefinition of 'setup_sysctl_set'
linux-next-20080717/kernel/sysctl.c:1963: error: previous definition of 'setup_sysctl_set' was here

because one definition of it is bounded by CONFIG_SYSCTL and another definition
of it is bounded by CONFIG_SYSCTL_SYSCALL... :(


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
