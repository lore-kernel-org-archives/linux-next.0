From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 09:09:19 +0100
Message-ID: <20080702090919.6c6b1c23@lxorguk.ukuu.org.uk>
References: <20080702151916.9719a473.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:42671 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753448AbYGBI0x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 04:26:53 -0400
In-Reply-To: <20080702151916.9719a473.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, linux-next@vger.kernel.org

On Wed, 2 Jul 2008 15:19:16 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/serial/sunhv.c: In function `receive_chars':
> drivers/serial/sunhv.c:188: error: structure has no member named `tty'
> drivers/serial/sunsu.c: In function `receive_chars':
> drivers/serial/sunsu.c:314: error: structure has no member named `tty'
> drivers/serial/sunsab.c: In function `receive_chars':
> drivers/serial/sunsab.c:121: error: structure has no member named `tty'
> 
> I applied the following patch (which, again, may not be correct).

Indeed correct and applied (although the email patch was mangled).

Alan
