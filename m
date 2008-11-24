From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Mon, 24 Nov 2008 09:59:17 +0000
Message-ID: <20081124095917.40ea6dd2@lxorguk.ukuu.org.uk>
References: <20081124161314.a61de8e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:43577 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751612AbYKXJ71 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2008 04:59:27 -0500
In-Reply-To: <20081124161314.a61de8e9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, 24 Nov 2008 16:13:14 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> I have dropped the ttydev tree for today due to unresolved build issues on
> m68k caused by a bad conversion of drivers/char/vme_scc.c in

I've not gone a viable m68k build tree or time to work on what is
basically a dead port. I will change policy to fit linux-next. That is
old obscure serial ports will not be updated but marked as broken and
then deleted if nobody is willing to maintain them.

Alan
