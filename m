From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 27 Feb 2012 21:24:59 +0000
Message-ID: <20120227212459.01f50b76@pyramind.ukuu.org.uk>
References: <20120227180601.bc286be07ce32fcf01725410@canb.auug.org.au>
	<20120227211748.GB18418@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120227211748.GB18418@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, 27 Feb 2012 13:17:48 -0800
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Feb 27, 2012 at 06:06:01PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the final tree, today's linux-next build (sparc32 defconfig)
> > failed like this:
> > 
> > drivers/tty/vt/keyboard.c: In function 'vt_do_diacrit':
> > drivers/tty/vt/keyboard.c:1500:3: error: implicit declaration of function 'put_user' [-Werror=implicit-function-declaration]
> > drivers/tty/vt/keyboard.c:1502:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
> > drivers/tty/vt/keyboard.c:1545:3: error: implicit declaration of function 'get_user' [-Werror=implicit-function-declaration]
> > drivers/tty/vt/keyboard.c:1556:4: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
> > 
> > Caused by commit 247ff8e610cb ("vt: lock the accent table") from the tty
> > tree.
> > 
> > I have reverted that patch for today.
> 
> Odd.  Alan, a simple:
> 	#include <linux/uaccess.h>
> in that file should solve this, right?

Yep.. I guess other archs have a lucky include path to it already. Sorry
about that.

Alan
