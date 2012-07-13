From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Fri, 13 Jul 2012 12:10:53 +0100
Message-ID: <20120713121053.0637219f@pyramind.ukuu.org.uk>
References: <20120713141345.f71b7c01f720d616d74721dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:33163 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755993Ab2GMLHp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jul 2012 07:07:45 -0400
In-Reply-To: <20120713141345.f71b7c01f720d616d74721dd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 13 Jul 2012 14:13:45 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/char/mwave/mwavedd.c: In function 'register_serial_portandirq':
> drivers/char/mwave/mwavedd.c:472:2: error: implicit declaration of function 'serial8250_register_port' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> drivers/misc/ibmasm/uart.c: In function 'ibmasm_register_uart':
> drivers/misc/ibmasm/uart.c:57:2: error: implicit declaration of function 'serial8250_register_port' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 
> Caused by commit 2655a2c76f80 ("8250: use the 8250 register interface not
> the legacy one").  Grep is your friend.

My fault on that one not GregKH's. I'll wrap that into the updated patch
series. I thought I had them all but I forgot to grep off in drivers/misc.

Alan
