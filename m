From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 18 (slow-work)
Date: Thu, 18 Dec 2008 09:21:45 -0800
Message-ID: <20081218092145.7e1566ef.randy.dunlap@oracle.com>
References: <20081218230637.c879a046.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:55459 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782AbYLRRWN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Dec 2008 12:22:13 -0500
In-Reply-To: <20081218230637.c879a046.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, dhowells@redhat.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

when CONFIG_SYSCTL=n:

build-r7380.out:/local/linsrc/linux-next-20081218/kernel/slow-work.c:612: error: 'slow_work_max_max_threads' undeclared (first use in this function)
build-r7380.out:make[2]: *** [kernel/slow-work.o] Error 1


---
~Randy
