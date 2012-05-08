From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 8 (printk)
Date: Tue, 08 May 2012 09:24:25 -0700
Message-ID: <4FA948B9.20600@xenotime.net>
References: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:35959 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754810Ab2EHQYK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 12:24:10 -0400
In-Reply-To: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kay@vrfy.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 05/08/2012 01:15 AM, Stephen Rothwell wrote:

> Hi all,
> 
> There will be no linux-next tomorrow.
> 
> Changes since 20120507:


Build errors on i386 and x86_64 when CONFIG_PRINTK is not enabled:

drivers/char/mem.c:858:2: error: implicit declaration of function 'printk_emit'

kernel/printk.c:1423:20: error: 'LOG_LINE_MAX' undeclared (first use in this function)
kernel/printk.c:1427:3: error: 'logbuf_lock' undeclared (first use in this function)
kernel/printk.c:1428:19: error: 'log_next_seq' undeclared (first use in this function)
kernel/printk.c:1433:21: error: 'log_first_seq' undeclared (first use in this function)
kernel/printk.c:1436:18: error: 'log_first_idx' undeclared (first use in this function)
kernel/printk.c:1442:3: error: implicit declaration of function 'log_from_idx'
kernel/printk.c:1442:7: warning: assignment makes pointer from integer without a cast
kernel/printk.c:1443:14: error: dereferencing pointer to incomplete type
kernel/printk.c:1444:12: error: dereferencing pointer to incomplete type
kernel/printk.c:1447:3: error: implicit declaration of function 'log_text'
kernel/printk.c:1450:3: error: implicit declaration of function 'log_next'
kernel/printk.c:1711:3: error: 'logbuf_lock' undeclared (first use in this function)
kernel/printk.c:1712:17: error: 'syslog_seq' undeclared (first use in this function)
kernel/printk.c:1713:17: error: 'syslog_idx' undeclared (first use in this function)



-- 
~Randy
