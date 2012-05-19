From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Sat, 19 May 2012 10:30:00 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1205191026400.1348-100000@netrider.rowland.org>
References: <4FB6FFBF.6000509@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4FB6FFBF.6000509@xenotime.net>
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
Cc: devel@driverdev.osuosl.org, Frank Mori Hess <fmhess@users.sourceforge.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 18 May 2012, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Add stubs for some usb core functions when CONFIG_USB
> is not enabled.  This fixes these comedi build errors:
> 
> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> ---
> I am only adding the stubs that are needed for comedi to build.
> I expect that more stubs will be needed as more build errors are
> found.  It seems to me that linux/usb.h might need more (major)
> moving of lines to support more stubs in the future.

This doesn't seem like the right thing to do.  If a driver needs to 
register with the USB core then that driver should depend on 
CONFIG_USB.

On the other hand, if the driver is capable of being built without USB 
support then it should use the necessary preprocessor tests to protect 
calls to any USB routines.

Alan Stern
