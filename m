From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/2] USB webcam gadget driver fix for linux-next
Date: Thu,  4 Oct 2012 02:32:40 +0200
Message-ID: <1349310762-14209-1-git-send-email-laurent.pinchart@ideasonboard.com>
References: <506B554A.70102@xenotime.net>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:47532 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932965Ab2JDAcF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Oct 2012 20:32:05 -0400
In-Reply-To: <506B554A.70102@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-usb@vger.kernel.org
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi,

The first patch in this series should fix the UVC gadget compilation errors in
linux-next. The second patch should make sure I'll be notified next time a
patch tries to break it :-)

Both patches are based on Linus' tree.

Laurent Pinchart (2):

  usb: gadget: Make webcam gadget select USB_LIBCOMPOSITE
  MAINTAINERS: Add maintainer entry for the USB webcam gadget

 MAINTAINERS                |    7 +++++++
 drivers/usb/gadget/Kconfig |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

-- 
Regards,

Laurent Pinchart
