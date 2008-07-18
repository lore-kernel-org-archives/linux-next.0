From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: import of ttydev tree
Date: Fri, 18 Jul 2008 09:58:02 +0100
Message-ID: <20080718095802.65e0fbdd@the-village.bc.nu>
References: <20080718163004.98ddc67b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:36470 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853AbYGRJiJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 05:38:09 -0400
In-Reply-To: <20080718163004.98ddc67b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, 18 Jul 2008 16:30:04 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Not sure what went wrong, but the second last of your patches
> "tty-synclink_gt-dma-fill" would not apply today, so I left the last two
> out.  I started with commit a3cf859321486f69506326146ab3e2fd15c05c3f and
> used "git quiltimport" to apply them.  The end of the log looks like this:

Strange. I'll redo those. It was objecting to the import of Paul's
patches for some reason so I fixed them up by hand before importing.
Dunno why it didn't apply with git quiltimport as it does apply with
stgit... fun fun

Alan
