From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build warning after merge of the tty.current tree
Date: Tue, 27 Apr 2010 00:37:22 +0100
Message-ID: <20100427003722.2bc89d10@lxorguk.ukuu.org.uk>
References: <20100427092346.12c4ecaa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:42130 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753349Ab0DZXcX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2010 19:32:23 -0400
In-Reply-To: <20100427092346.12c4ecaa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Tue, 27 Apr 2010 09:23:46 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the tty.current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/char/isicom.c: In function 'isicom_open':
> drivers/char/isicom.c:875: warning: unused variable 'card'
> 
> Introduced by commit 746b212efb4664117612c7f43f880d230588d617 ("tty: Fix
> regressions in the char driver conversion").

I'll fix that tomorrow and send it to Greg
