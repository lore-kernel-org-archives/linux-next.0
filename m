From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/keucr: update TODO list and ask question
 about it
Date: Tue, 14 Sep 2010 15:41:48 -0700
Message-ID: <20100914154148.826a0334.randy.dunlap@oracle.com>
References: <20100913134302.a77e9a3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100913134302.a77e9a3e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, Al Cho <acho@novell.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Update keucr TODO with additional work items.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Al Cho <acho@novell.com>
---
 drivers/staging/keucr/TODO |    3 +++
 1 file changed, 3 insertions(+)

and I don't understand this TODO comment:
"	- determine if the driver should not be using a duplicate
	  version of the usb-storage scsi interface code, but should
	  be merged into the drivers/usb/storage/ directory and
	  infrastructure instead."

Of course the driver should not use a duplicate of the usb-storage
SCSI interface code.  Did someone seriously think that it should?


--- linux-next-20100913.orig/drivers/staging/keucr/TODO
+++ linux-next-20100913/drivers/staging/keucr/TODO
@@ -6,6 +6,9 @@ TODO:
 	  be merged into the drivers/usb/storage/ directory and
 	  infrastructure instead.
 	- review by the USB developer community
+	- common.h: use kernel swap, le, & be functions
+	- smcommon.h & smilsub.c: use kernel hweight8(), hweight16(),
+		strcmp(), & strcpy()
 
 Please send any patches for this driver to Al Cho <acho@novell.com> and
 Greg Kroah-Hartman <gregkh@suse.de>.
