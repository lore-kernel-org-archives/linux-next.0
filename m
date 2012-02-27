From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 27 Feb 2012 13:17:48 -0800
Message-ID: <20120227211748.GB18418@kroah.com>
References: <20120227180601.bc286be07ce32fcf01725410@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:65264 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177Ab2B0VR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 16:17:56 -0500
Received: by pbcup15 with SMTP id up15so2487343pbc.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 13:17:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20120227180601.bc286be07ce32fcf01725410@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Mon, Feb 27, 2012 at 06:06:01PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> drivers/tty/vt/keyboard.c: In function 'vt_do_diacrit':
> drivers/tty/vt/keyboard.c:1500:3: error: implicit declaration of function 'put_user' [-Werror=implicit-function-declaration]
> drivers/tty/vt/keyboard.c:1502:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
> drivers/tty/vt/keyboard.c:1545:3: error: implicit declaration of function 'get_user' [-Werror=implicit-function-declaration]
> drivers/tty/vt/keyboard.c:1556:4: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
> 
> Caused by commit 247ff8e610cb ("vt: lock the accent table") from the tty
> tree.
> 
> I have reverted that patch for today.

Odd.  Alan, a simple:
	#include <linux/uaccess.h>
in that file should solve this, right?

greg k-h
