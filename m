From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build failure
Date: Mon, 7 Dec 2009 09:36:41 -0800
Message-ID: <20091207173640.GA998@core.coreip.homeip.net>
References: <20091207200344.01323cb5.sfr@canb.auug.org.au> <4B1D2C80.4060202@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:53632 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935467AbZLGRgn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2009 12:36:43 -0500
Content-Disposition: inline
In-Reply-To: <4B1D2C80.4060202@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 07, 2009 at 08:25:36AM -0800, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi Dmitry,
> > 
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> > 
> > drivers/input/sparse-keymap.c:101: error: __ksymtab_sparse_keymap_setkeycode causes a section type conflict
> > 
> > Caused by commit a2dd9f7ceeb28f495587834aa5778c721611d61b ("Input: add
> > generic support for sparse keymaps").
> > 
> > static functions should not given to EXPORT_SYMBOL().
> > 
> > I have reverted that commit for today.
> 
> (DT:) Is that what causes wistron_btns builds to fail also?
> 

Umm... Wistron and dm355evm_keys now using sparse keymap library so if
it is missing they would fail to compile.

I removed the stray EXPORT_SYMBOL(), shold be good now.

-- 
Dmitry
