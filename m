From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of i2c tree
Date: Tue, 17 Jun 2008 14:10:04 +0200
Message-ID: <20080617141004.1fe78ebc@hyperion.delvare>
References: <20080617142821.88d73657.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:9207 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755297AbYFQMKR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jun 2008 08:10:17 -0400
In-Reply-To: <20080617142821.88d73657.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Stephen,

On Tue, 17 Jun 2008 14:28:21 +1000, Stephen Rothwell wrote:
> Today's linux-next merge if the i2c tree got a conflict in
> drivers/i2c/i2c-core.c between commit
> 5f38434efd52cd113a6bd278d9765f11e63005d7
> ("i2c-use-class_for_each_device") from the driver-core tree and commits
> 30b96672f3860f0b45b4347b0b0280523ca2a5d1 ("i2c: Use
> list_for_each_entry_safe"), d6d4d5deddec521bbac62860338237c448adc5d7
> ("i2c: Simplify i2c_del_driver()") and
> a7e4e16fe30eb27f6d0975d9cd97af157bf7576d ("i2c: Add detection capability
> to new-style drivers") from the i2c tree.
> 
> I fixed it up as best I could. Please check after I publish the tree,
> thanks.  I took the i2c tree version except that class_for_each_device
> now has an extra argument.

Yes, you did the right thing.

Is there a way Greg and/or I could make your life easier?

>From my point of view, patch "i2c-use-class_for_each_device.patch" in
Greg's tree does two things: it makes i2c-core use
class_for_each_device instead of walking the list manually, and it adds
a parameter to class_for_each_device. The former is something I have
also done in my tree (with a slightly different implementation), the
latter is something I can't do in my tree (as it depends of
driver-core-add-ability-for-class_for_each_device-to-start-in-middle-of-list.patch
in Greg's tree.)

If Greg would pick _my_ i2c-use-class_for_each_device.patch, and would
apply it before his
driver-core-add-ability-for-class_for_each_device-to-start-in-middle-of-list.patch,
and would update that patch to add the extra parameter to the calls in
i2c-core, then we would have a patch in common. Wouldn't it be easier
for Stephen to notice that and discard the redundant copy?

Or this could even be brought one step further. If I know that Greg has
my patch in his tree, and his tree gets sequenced before mine in
linux-next, then I could stop exporting the patch in question to
linux-next (using adequate marks in my series file), so there wouldn't
even be the need to spot the duplicate, and no conflict to solve. My
tree would apply smoothly on top of Greg's.

This would probably help not only Stephen for linux-next, but also Greg
and myself for the next merge window. If Greg merges before me (very
likely) then I simply drop the patch we have in common from my own tree
before I merge it, instead of having to rebase it.

If everyone agrees with this plan, then Greg please:
* Delete your own i2c-use-class_for_each_device.patch, download
  http://khali.linux-fr.org/devel/linux-2.6/jdelvare-i2c/i2c-use-class_for_each_device.patch
  as a replacement, and sequence it before
  driver-core-add-ability-for-class_for_each_device-to-start-in-middle-of-list.patch
  in your tree.
* Fold the following patch into
  driver-core-add-ability-for-class_for_each_device-to-start-in-middle-of-list.patch
  . That's the fixup Stephen had to apply manually so far.

--- linux-2.6.26-rc6/drivers/i2c/i2c-core.c	2008-06-17 13:53:52.000000000 +0200
+++ linux-2.6.26-rc6-next/drivers/i2c/i2c-core.c	2008-06-17 12:58:56.000000000 +0200
@@ -709,7 +709,8 @@
 
 	INIT_LIST_HEAD(&driver->clients);
 	/* Walk the adapters that are already present */
-	class_for_each_device(&i2c_adapter_class, driver, __attach_adapter);
+	class_for_each_device(&i2c_adapter_class, NULL, driver,
+				__attach_adapter);
 
 	mutex_unlock(&core_lock);
 	return 0;
@@ -769,7 +770,8 @@
 {
 	mutex_lock(&core_lock);
 
-	class_for_each_device(&i2c_adapter_class, driver, __detach_adapter);
+	class_for_each_device(&i2c_adapter_class, NULL, driver,
+				__detach_adapter);
 
 	driver_unregister(&driver->driver);
 	pr_debug("i2c-core: driver [%s] unregistered\n", driver->driver.name);


-- 
Jean Delvare
