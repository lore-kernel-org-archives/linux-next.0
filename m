From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next: Tree for December 9
Date: Thu, 11 Dec 2008 09:15:45 +1100
Message-ID: <18752.16273.604044.142078@notabene.brown>
References: <20081209185237.8bb715d7.sfr@canb.auug.org.au>
	<20081209153418.4628723d.akpm@linux-foundation.org>
	<ac3eb2510812091606k5615135fn87d35aaa16834ea8@mail.gmail.com>
	<20081209161511.15fe8cdb.akpm@linux-foundation.org>
	<ac3eb2510812091631j3b350ac6t9429e01171a96228@mail.gmail.com>
	<20081209173048.18382f6d.akpm@linux-foundation.org>
	<16e59424891c03bfe31eb0898fedeac9.squirrel@neil.brown.name>
	<20081210111636.688cd882.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45896 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751567AbYLJWPx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 17:15:53 -0500
In-Reply-To: message from Andrew Morton on Wednesday December 10
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kay.sievers@vrfy.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, adobriyan@gmail.com, greg@kroah.com

On Wednesday December 10, akpm@linux-foundation.org wrote:
> On Wed, 10 Dec 2008 12:42:58 +1100 (EST)
> "NeilBrown" <neilb@suse.de> wrote:
> 
> > On Wed, December 10, 2008 12:30 pm, Andrew Morton wrote:
> > > On Wed, 10 Dec 2008 01:31:13 +0100 "Kay Sievers" <kay.sievers@vrfy.org>
> > > wrote:
> > >
> > >> > akpm2:/home/akpm# udevmonitor
> > >> > udevmonitor prints the received event from the kernel [UEVENT]
> > >> > and the event which udev sends out after rule processing [UDEV]
> > >> >
> > >> > UDEV  [1228867146.103334] add@/class/bdi/9:0
> > >> > UDEV  [1228867146.107566] remove@/block/md0
> > >> > UDEV  [1228867146.111969] remove@/class/bdi/9:0
> > >> > UEVENT[1228867146.119889] add@/block/md0
> > >> > UEVENT[1228867146.119964] add@/class/bdi/9:0
> > >> > UEVENT[1228867146.120162] remove@/class/bdi/9:0
> > >> > UEVENT[1228867146.120205] remove@/block/md0
> > >> > UDEV  [1228867146.122839] add@/block/md0
> > >> > UDEV  [1228867146.129125] add@/class/bdi/9:0
> > >> > UDEV  [1228867146.133459] remove@/block/md0
> > >> > UDEV  [1228867146.137813] remove@/class/bdi/9:0
> > >> > UEVENT[1228867146.145652] add@/block/md0
> > >>
> > >> Weird loop, something is accessing /dev/md0, i guess, which creates
> > >> the kernel device, and the event, which accesses /dev/md0 again and it
> > >> goes crazy. Maybe caused by changes Neil did.
> > >
> > > I knew an Australian was to blame - it's just a matter of determining
> > > which one.
> > 
> > Let's not count our chickens .... :-)
> > 
> > Can you get me
> >    tar czvf - /lib/udev /etc/udev | mail neilb
> > 
> > so I can see exactly what FC6 is likely to try to do when an
> > md device appears or disappears?
> 
> Is at http://userweb.kernel.org/~akpm/udev.tar.gz, thanks.

Thanks.
That udev code does no special handling of md device, and runs vol-id
on every device that appears to see what it contains.

So if an md device is ever opened and closed immediately - as
typically happens at boot to sent the AUTO_RUN ioctl to do in-kernel
autodetection - then it will start a loop:

loop:
  The open causes an ADD event to udev.
  By the time udev handles it the device is closed, so when
   udev opens the device (via vol-id), the device is re-created
   triggering another ADD event.
  vol-id then closes the device and it disappears.
  Goto loop

So it isn't safe to destroy the md device as soon as it is closed.
Next best option is to destroy it after close providing at least one
ioctl has been made (or similar change via writing to sysfs).
This means that in most cases the device will disappear when not
needed, but in the particular case of some code which doesn't really
understand 'md' opening the device, it will hang around to avoid
causing confusion.

I have just pushed out an updated for-next branch.
The incremental patch is below.

Thanks,
NeilBrown


diff --git a/drivers/md/md.c b/drivers/md/md.c
index 89700b5..bef91b8 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -262,7 +262,7 @@ static mddev_t * mddev_find(dev_t unit)
 		if (new) {
 			list_add(&new->all_mddevs, &all_mddevs);
 			spin_unlock(&all_mddevs_lock);
-			new->hold_active = UNTIL_CLOSE;
+			new->hold_active = UNTIL_IOCTL;
 			return new;
 		}
 	} else if (new) {
@@ -3487,6 +3487,8 @@ md_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 	rv = mddev_lock(mddev);
+	if (mddev->hold_active == UNTIL_IOCTL)
+		mddev->hold_active = 0;
 	if (!rv) {
 		rv = entry->store(mddev, page, length);
 		mddev_unlock(mddev);
@@ -5160,6 +5162,9 @@ static int md_ioctl(struct block_device *bdev, fmode_t mode,
 
 done_unlock:
 abort_unlock:
+	if (mddev->hold_active == UNTIL_IOCTL &&
+	    err != -EINVAL)
+		mddev->hold_active = 0;
 	mddev_unlock(mddev);
 
 	return err;
@@ -5209,8 +5214,6 @@ static int md_release(struct gendisk *disk, fmode_t mode)
 
 	BUG_ON(!mddev);
 	atomic_dec(&mddev->openers);
-	if (mddev->hold_active == UNTIL_CLOSE)
-		mddev->hold_active = 0;
 	mddev_put(mddev);
 
 	return 0;
diff --git a/include/linux/raid/md_k.h b/include/linux/raid/md_k.h
index 19756d7..dac4217 100644
--- a/include/linux/raid/md_k.h
+++ b/include/linux/raid/md_k.h
@@ -138,7 +138,7 @@ struct mddev_s
 
 	struct kobject			kobj;
 	int				hold_active;
-#define	UNTIL_CLOSE	1
+#define	UNTIL_IOCTL	1
 #define	UNTIL_STOP	2
 
 	/* Superblock information */
