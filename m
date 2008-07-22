From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] serial: fix struct uart_info change fallout
Date: Tue, 22 Jul 2008 03:00:11 +0100
Message-ID: <20080722030011.6b0d8137@lxorguk.ukuu.org.uk>
References: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
	<20080722003814.GA14809@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:49755 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753866AbYGVCSE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Jul 2008 22:18:04 -0400
In-Reply-To: <20080722003814.GA14809@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>

On Mon, 21 Jul 2008 20:38:14 -0400
Dave Jones <davej@redhat.com> wrote:

> On Tue, Jul 22, 2008 at 10:25:20AM +1000, Stephen Rothwell wrote:
>  > Hi Linus, Alan,
>  > 
>  > Today's linux-next (actually just Linus' tree) build (powerpc
>  > ppc64_defconfig) failed like this:
>  > 
>  > drivers/serial/serial_txx9.c: In function 'receive_chars':
>  > drivers/serial/serial_txx9.c:275: error: 'struct uart_info' has no member named 'tty'
>  > drivers/serial/icom.c: In function 'recv_interrupt':
>  > drivers/serial/icom.c:733: error: 'struct uart_info' has no member named 'tty'
> 
> That's the same pair of patches I sent earlier, which apparently were
> "Already in the ttydev tree" which should be in linux-next ?

And are in Linux next, and would be in the Linus submission queue except
that everyone keeps patching tty files from other trees.

<mutter>

Alan
