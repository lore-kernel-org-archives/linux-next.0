From: Lin Ming <ming.m.lin@intel.com>
Subject: Re: FW: next-20090724: null pointer dereference from
 ibm_find_acpi_device
Date: Mon, 03 Aug 2009 09:17:43 +0800
Message-ID: <1249262263.20105.8.camel@minggr.sh.intel.com>
References: <4911F71203A09E4D9981D27F9D8308582EE836AE@orsmsx503.amr.corp.intel.com>
	 <1248685437.3166.28.camel@minggr.sh.intel.com>
	 <1248972952.23004.0.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:52094 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753295AbZHCBSM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Aug 2009 21:18:12 -0400
In-Reply-To: <1248972952.23004.0.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: "Moore, Robert" <robert.moore@intel.com>, "Brown, Len" <len.brown@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, 2009-07-31 at 00:55 +0800, Thomas Meyer wrote:
> Am Montag, den 27.07.2009, 17:03 +0800 schrieb Lin Ming: 
> > Hi, Thomas
> > 
> > Would you please try below patch?
> 
> Yes. The patch below makes the NULL pointer dereference go away. Is the
> hardware_id.string accessibly thru sysfs?

It's shown thru sysfs if it's not NULL.

See acpi_device_setup_files.

static int acpi_device_setup_files(struct acpi_device *dev)
{
 	....

        if (dev->flags.hardware_id) {
                result = device_create_file(&dev->dev, &dev_attr_hid);
                if (result)
                        goto end;
        }

	....
}

Lin Ming

> 
> > 
> > info->hardware_id.string[sizeof(info->hardware_id.length) - 1] = '\0' is
> > not needed anymore because acpi_get_object_info already handles it.
> > 
> >         /* Allocate a buffer for the HID */
> > 
> >         hid =
> >             ACPI_ALLOCATE_ZEROED(sizeof(struct acpica_device_id) +
> >                                  (acpi_size) length);
> > 
> > And it would cause null pointer deference if info->hardware_id.string is
> > NULL.
> > 
> > So delete it.
> > 
> > diff --git a/drivers/pci/hotplug/acpiphp_ibm.c b/drivers/pci/hotplug/acpiphp_ibm.c
> > index a9d926b..e7be66d 100644
> > --- a/drivers/pci/hotplug/acpiphp_ibm.c
> > +++ b/drivers/pci/hotplug/acpiphp_ibm.c
> > @@ -406,7 +406,6 @@ static acpi_status __init ibm_find_acpi_device(acpi_handle handle,
> >  			__func__, status);
> >  		return retval;
> >  	}
> > -	info->hardware_id.string[sizeof(info->hardware_id.length) - 1] = '\0';
> >  
> >  	if (info->current_status && (info->valid & ACPI_VALID_HID) &&
> >  			(!strcmp(info->hardware_id.string, IBM_HARDWARE_ID1) ||
> > 
> > 
> > On Mon, 2009-07-27 at 13:09 +0800, Moore, Robert wrote:
> > > Lin Ming,
> > > 
> > > Can you take a look at this?
> > > 
> > > Thanks
> > > Bob
> > > 
> > > 
> > > -----Original Message-----
> > > From: Thomas Meyer [mailto:thomas@m3y3r.de] 
> > > Sent: Sunday, July 26, 2009 3:15 AM
> > > To: Moore, Robert; Brown, Len; linux-next@vger.kernel.org
> > > Subject: next-20090724: null pointer dereference from ibm_find_acpi_device
> > > 
> > > Hi.
> > > 
> > > Probably caused by commit fbe8cddd2d85979d273d7937a2b8a47498694d91.
> > > 
> > > See attached screenshot.
> > > 
> > 
> 
