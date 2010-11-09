From: Greg KH <greg@kroah.com>
Subject: Movement of the USB, TTY, Staging, and driver core trees for
 linux-next
Date: Tue, 9 Nov 2010 09:23:21 -0800
Message-ID: <20101109172321.GA10927@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-serial-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

As discussed at the kernel summit, I've moved the USB, TTY, Staging, and
driver core trees into git instead of using quilt.

Previously you had been pulling in the quilt trees from kernel.org, so
this should hopefully be easier.

The location of the trees are now at:
 USB:
	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb-2.6.git
	with the usb-next and usb-linus branches
 TTY:
	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty-2.6.git
	with the tty-next and tty-linus branches
 driver core:
	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core-2.6.git
	with the driver-core-next and driver-core-linus branches
 staging:
	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging-2.6.git
	with the staging-next and staging-linus branches

Note the staging tree has moved from before, it used to be in a
staging-next-2.6.git/ tree, and now it is together with the main staging
development tree in just "staging-2.6.git/"

There are no known interdependancies between these trees, unlike my
previous quilt trees, so merges should be fine (if not, I should find
them as well.)

If there are any problems with this, please let me know.

thanks,

greg k-h
