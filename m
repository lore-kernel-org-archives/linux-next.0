From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] serial: fix struct uart_info change fallout
Date: Mon, 21 Jul 2008 20:38:14 -0400
Message-ID: <20080722003814.GA14809@redhat.com>
References: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:52416 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754939AbYGVApU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 20:45:20 -0400
Content-Disposition: inline
In-Reply-To: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>

On Tue, Jul 22, 2008 at 10:25:20AM +1000, Stephen Rothwell wrote:
 > Hi Linus, Alan,
 > 
 > Today's linux-next (actually just Linus' tree) build (powerpc
 > ppc64_defconfig) failed like this:
 > 
 > drivers/serial/serial_txx9.c: In function 'receive_chars':
 > drivers/serial/serial_txx9.c:275: error: 'struct uart_info' has no member named 'tty'
 > drivers/serial/icom.c: In function 'recv_interrupt':
 > drivers/serial/icom.c:733: error: 'struct uart_info' has no member named 'tty'

That's the same pair of patches I sent earlier, which apparently were
"Already in the ttydev tree" which should be in linux-next ?

	Dave
 
-- 
http://www.codemonkey.org.uk
