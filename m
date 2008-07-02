From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 09:05:13 +0100
Message-ID: <20080702090513.0517ac58@lxorguk.ukuu.org.uk>
References: <20080702150827.4dd6305b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:42665 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751139AbYGBIWt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 04:22:49 -0400
In-Reply-To: <20080702150827.4dd6305b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2 Jul 2008 15:08:27 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/serial/pmac_zilog.c: In function 'pmz_receive_chars':
> drivers/serial/pmac_zilog.c:245: error: 'struct uart_info' has no member named 'tty'
> drivers/serial/pmac_zilog.c:250: error: 'struct uart_info' has no member named 'tty'
> 
> I applied the patch below (which builds but may, or may not, be correct).

Your patch is correct. Sorry about that. I need to set up a PPC cross
build clearly.
