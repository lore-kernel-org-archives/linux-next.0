From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree import failure
Date: Fri, 10 Jul 2009 00:47:43 +0100
Message-ID: <20090710004743.202b36e5@lxorguk.ukuu.org.uk>
References: <20090710091408.67c4da53.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:50725 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750726AbZGIXqt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2009 19:46:49 -0400
In-Reply-To: <20090710091408.67c4da53.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 10 Jul 2009 09:14:08 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next import of the ttydev tree failed like this:
> 
> tty-usb-mos7720-modem
> error: usb/serial/mos7720.c: does not exist in index
> 
> It looks like a -p0 patch was included in the comments?  I removed the
> -p0 patch (hopefully that was the correct one).

Interesting - stgit seems totally happy with it all (and applied it to
the right place). I'll have a poke and sort it out.
