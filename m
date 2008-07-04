From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Fri, 4 Jul 2008 16:41:43 +0100
Message-ID: <20080704164143.358ce5b6@lxorguk.ukuu.org.uk>
References: <20080704191134.cd8eb23d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:49142 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751665AbYGDP7V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 11:59:21 -0400
In-Reply-To: <20080704191134.cd8eb23d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, 4 Jul 2008 19:11:34 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the hdlc tree got a conflict in
> drivers/char/tty_io.c between commit
> 3e2a078ca6a0d3122bbf2b904cd7ccf21a5ca21d ("tty: Fix inverted logic in
> send_break") from Linus' tree and "77-tty-break-errorhandler" from the
> ttydev tree.
> 
> I made the obvious fixup.  Please redo the patch.

Done but that meant shifting the base of the patch as it is now in
linux-next so can't be relative to it. I've put it on top of the firmware
tree as that should avoid the conflicts I'm aware of
