From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Thu, 23 Oct 2008 08:34:06 +0100
Message-ID: <20081023083406.671d4101@lxorguk.ukuu.org.uk>
References: <20081023172938.0460b191.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:33473 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751805AbYJWHe2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 03:34:28 -0400
In-Reply-To: <20081023172938.0460b191.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>

On Thu, 23 Oct 2008 17:29:38 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/char/hvc_console.c: In function 'hvc_set_winsz':
> drivers/char/hvc_console.c:532: warning: passing argument 2 of 'tty_do_resize' from incompatible pointer type
> drivers/char/hvc_console.c:532: error: too many arguments to function 'tty_do_resize'
> 
> Caused by commit eb6ab2d361a49470ca9785c70482772c19e49bec
> ("pty-simplify-resize") from the ttydev tree interacting with commit
> febde3711992a64ea83a47a719f68a90c4b0927a ("hvc_console: Add support for
> tty window resizing").
> 
> The former added another call to the function that the latter changed.
> 
> I applied the following patch

Patch is correct.

Do the hvc patches have dependancies on the PPC tree as well as the tty
tree ?
