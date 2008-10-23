From: Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
Subject: Re: linux-next: ttydev tree build failure
Date: Thu, 23 Oct 2008 12:28:05 +0200
Message-ID: <20081023102805.GA4197@cetus.boeblingen.de.ibm.com>
References: <20081023172938.0460b191.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.uk.ibm.com ([195.212.29.141]:36567 "EHLO
	mtagate8.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbYJWK32 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 06:29:28 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate8.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m9NAS7Mg199726
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 10:28:07 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id m9NAS7t14210774
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 11:28:07 +0100
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m9NAS6DD029096
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 11:28:07 +0100
Content-Disposition: inline
In-Reply-To: <20081023172938.0460b191.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>

On Thu, Oct 23, 2008 at 05:29:38PM +1100, Stephen Rothwell wrote:
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
In linux-next, the pty-simplify-resize patch has changed the
tty_do_resize() signature; and therefore the hvc patch did not compile.

> I applied the following patch.
The patch is correct.
Thanks.

Acked-by: Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

-- 
Regards
Hendrik

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Martin Jetter
Geschaeftsfuehrung: Erich Baier
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
