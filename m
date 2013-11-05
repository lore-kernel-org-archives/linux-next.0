From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 5 (tty/serial/xilinx_uartps)
Date: Tue, 05 Nov 2013 11:00:49 -0800
Message-ID: <52794061.2000300@infradead.org>
References: <20131105181617.228320b251ab24cce48d3b1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:37594 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754726Ab3KETAw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 14:00:52 -0500
In-Reply-To: <20131105181617.228320b251ab24cce48d3b1c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org

On 11/04/13 23:16, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20131104:


on i386:

drivers/tty/serial/xilinx_uartps.c: In function 'xuartps_isr':
drivers/tty/serial/xilinx_uartps.c:247:13: error: 'struct uart_port' has no member named 'sysrq'


-- 
~Randy
