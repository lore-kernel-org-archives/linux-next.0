From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 19 (serial/8250/8250_dw.c)
Date: Wed, 19 Jun 2013 19:56:08 -0700
Message-ID: <51C26F48.6080604@infradead.org>
References: <20130619182115.e5786a389561898e8dce178d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57286 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935506Ab3FTC40 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2013 22:56:26 -0400
In-Reply-To: <20130619182115.e5786a389561898e8dce178d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jamie@jamieiles.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>

On 06/19/13 01:21, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130618:
> 


on i386:

drivers/tty/serial/8250/8250_dw.c: In function 'dw8250_serial_inq':
drivers/tty/serial/8250/8250_dw.c:68:2: error: implicit declaration of function '__raw_readq' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c: In function 'dw8250_serial_outq':
drivers/tty/serial/8250/8250_dw.c:79:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]


-- 
~Randy
