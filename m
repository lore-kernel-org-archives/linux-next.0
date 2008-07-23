From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 17:28:37 +0100
Message-ID: <20080723172837.3d784d85@lxorguk.ukuu.org.uk>
References: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0807231436310.1185@anakin>
	<20080723154610.348ffc07@lxorguk.ukuu.org.uk>
	<Pine.LNX.4.64.0807231748250.20868@anakin>
	<20080723164731.00c163f1@lxorguk.ukuu.org.uk>
	<Pine.LNX.4.64.0807231838470.21737@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53568 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752029AbYGWQp4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 12:45:56 -0400
In-Reply-To: <Pine.LNX.4.64.0807231838470.21737@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

> Update all drivers when making core tty infrastructure changes?
> Thanks!

I don't have an Amiga with that board, I don't have an obscure VME 68K
board. The changes required at this point would be tricky to verify
without hardware, and the upcoming changes will require significant
changes to all the hardware drivers, which will need someone to actually
maintain the drivers, or to drop them.

I expect to drop several PC serial drivers at the same time as they also
don't appear to have any users.
