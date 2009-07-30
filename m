From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: FW: next-20090724: null pointer dereference from
 ibm_find_acpi_device
Date: Thu, 30 Jul 2009 18:55:52 +0200
Message-ID: <1248972952.23004.0.camel@localhost>
References: <4911F71203A09E4D9981D27F9D8308582EE836AE@orsmsx503.amr.corp.intel.com>
	 <1248685437.3166.28.camel@minggr.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:58204 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751209AbZG3Qz6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2009 12:55:58 -0400
In-Reply-To: <1248685437.3166.28.camel@minggr.sh.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lin Ming <ming.m.lin@intel.com>
Cc: "Moore, Robert" <robert.moore@intel.com>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org

Am Montag, den 27.07.2009, 17:03 +0800 schrieb Lin Ming: 
> Hi, Thomas
> 
> Would you please try below patch?

Yes. The patch below makes the NULL pointer dereference go away. Is the
hardware_id.string accessibly thru sysfs?

> 
> info->hardware_id.string[sizeof(info->hardware_id.length) - 1] = '\0' is
> not needed anymore because acpi_get_object_info already handles it.
> 
>         /* Allocate a buffer for the HID */
> 
>         hid =
>             ACPI_ALLOCATE_ZEROED(sizeof(struct acpica_device_id) +
>                                  (acpi_size) length);
> 
> And it would cause null pointer deference if info->hardware_id.string is
> NULL.
> 
> So delete it.
> 
> diff --git a/drivers/pci/hotplug/acpiphp_ibm.c b/drivers/pci/hotplug/acpiphp_ibm.c
> index a9d926b..e7be66d 100644
> --- a/drivers/pci/hotplug/acpiphp_ibm.c
> +++ b/drivers/pci/hotplug/acpiphp_ibm.c
> @@ -406,7 +406,6 @@ static acpi_status __init ibm_find_acpi_device(acpi_handle handle,
>  			__func__, status);
>  		return retval;
>  	}
> -	info->hardware_id.string[sizeof(info->hardware_id.length) - 1] = '\0';
>  
>  	if (info->current_status && (info->valid & ACPI_VALID_HID) &&
>  			(!strcmp(info->hardware_id.string, IBM_HARDWARE_ID1) ||
> 
> 
> On Mon, 2009-07-27 at 13:09 +0800, Moore, Robert wrote:
> > Lin Ming,
> > 
> > Can you take a look at this?
> > 
> > Thanks
> > Bob
> > 
> > 
> > -----Original Message-----
> > From: Thomas Meyer [mailto:thomas@m3y3r.de] 
> > Sent: Sunday, July 26, 2009 3:15 AM
> > To: Moore, Robert; Brown, Len; linux-next@vger.kernel.org
> > Subject: next-20090724: null pointer dereference from ibm_find_acpi_device
> > 
> > Hi.
> > 
> > Probably caused by commit fbe8cddd2d85979d273d7937a2b8a47498694d91.
> > 
> > See attached screenshot.
> > 
> 
