From: Greg KH <greg@kroah.com>
Subject: linux-staging status for June 10, 2008
Date: Tue, 10 Jun 2008 12:06:31 -0700
Message-ID: <20080610190631.GB25066@kroah.com>
References: <20080610190540.GA25066@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:37843 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756819AbYFJUMy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jun 2008 16:12:54 -0400
Content-Disposition: inline
In-Reply-To: <20080610190540.GA25066@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Here is a list of the current patches in the linux-staging tree, and
their current status.

 - 17 patches
 - 192 files changed, 131073 insertions(+), 651 deletions(-)

---------
Patch: aectc: add the aectc driver
Contact: Brandon Philips <brandon@ifup.org>

Status:
  Being reworked to use the UIO interface instead of char driver
  Part of the linuxdriverproject.org development effort.

---------
Patch: DVB: add firesat driver
Contact: Manu Abraham <manu@linuxtv.org> and Greg KH <greg@kroah.com>

Status:
  Currently waiting for more DVB tuner development to finish off the
  remaining features.  Will be submitted to the DVB developers for
  inclusion in the kernel tree soon, as waiting for that effort might be
  a while.
  Part of the linuxdriverproject.org development effort.

---------
Patch: Framebuffer: add the VIA framebuffer driver
Contact: Benjamin Pan <BenjaminPan@viatech.com> and Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: Input: add appleir driver
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  looks like this is not needed at all, but still need to determine the
  proper HID quirk.
  Part of the linuxdriverproject.org development effort.

---------
Patch: me4000: add pci data collection driver
Patch: me4000 firmware file
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: NET: add Alacritech slicoss driver
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: NET: add et131x driver
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: novfs: Add the Novell filesystem client kernel module
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: OMS: add OMS MAXp driver
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: USB: add USB test and measurement class drive
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  many TODOs still left to finish (see patch for details)
  Part of the linuxdriverproject.org development effort.

---------
Patch: USB: add option HSO driver
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  Minor bugfixes waiting to be merged in
  will be resubmited to the netdev list afterward
  Part of the linuxdriverproject.org development effort.

---------
Patch: USB: add Sensoray 2255 v4l driver
Contact: Dean Anderson <dean@sensoray.com> and Greg Kroah-Hartman <greg@kroah.com>

Status:
  review cycle cleanup already happened, will be resubmitted to v4l
  developers shortly.

---------
Patch: via agp driver (3 patches)
Contact: Greg Kroah-Hartman <greg@kroah.com>

Status:
  Still waiting for VIA to produce their xorg driver
  portions have already gone into the drm and agp tree
  Part of the linuxdriverproject.org development effort.

---------

