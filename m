From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Sat, 19 May 2012 09:12:07 -0700
Message-ID: <20120519161207.GA31712@kroah.com>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
 <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com>
 <4FB6FFBF.6000509@xenotime.net> <4FB7AB4D.5040900@mvista.com>
 <4FB7C028.80406@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <4FB7C028.80406@xenotime.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: devel@driverdev.osuosl.org, Frank Mori Hess <fmhess@users.sourceforge.net>, Sergei Shtylyov <sshtylyov@mvista.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, May 19, 2012 at 08:45:44AM -0700, Randy Dunlap wrote:
> On 05/19/2012 07:16 AM, Sergei Shtylyov wrote:
> 
> > Hello.
> > 
> > On 19-05-2012 6:04, Randy Dunlap wrote:
> > 
> >> From: Randy Dunlap<rdunlap@xenotime.net>
> > 
> >> Add stubs for some usb core functions when CONFIG_USB
> >> is not enabled.  This fixes these comedi build errors:
> > 
> >> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
> >> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
> > 
> >> Signed-off-by: Randy Dunlap<rdunlap@xenotime.net>
> >> ---
> >> I am only adding the stubs that are needed for comedi to build.
> >> I expect that more stubs will be needed as more build errors are
> >> found.  It seems to me that linux/usb.h might need more (major)
> >> moving of lines to support more stubs in the future.
> > 
> >>   Documentation/usb/error-codes.txt |    2 ++
> >>   include/linux/usb.h               |   24 +++++++++++++++++++++++-
> >>   2 files changed, 25 insertions(+), 1 deletion(-)
> >>
> >> --- linux-next-20120518.orig/include/linux/usb.h
> >> +++ linux-next-20120518/include/linux/usb.h
> >> @@ -10,7 +10,7 @@
> >>
> >>   #ifdef __KERNEL__
> >>
> >> -#include<linux/errno.h>         /* for -ENODEV */
> >> +#include<linux/errno.h>         /* for -ENODEV, -ENOSYS */
> >>   #include<linux/delay.h>    /* for mdelay() */
> >>   #include<linux/interrupt.h>    /* for in_interrupt() */
> >>   #include<linux/list.h>        /* for struct list_head */
> >> @@ -515,6 +515,8 @@ static inline struct usb_device *interfa
> >>       return to_usb_device(intf->dev.parent);
> >>   }
> >>
> >> +#if defined(CONFIG_USB) || defined(CONFIG_USB_MODULE)
> > 
> >    You can use IS_ENABLED(CONFIG_USB) instead of these two now.
> 
> 
> I know, but I chose not to do that in case the patch
> needs to be applied to some earlier kernels.

If it did, the person doing that would do the change :)

Please use IS_ENABLED().

thanks,

greg k-h
