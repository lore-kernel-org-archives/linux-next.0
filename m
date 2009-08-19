From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: linux-next: usb/pxa trees build failure
Date: Wed, 19 Aug 2009 11:07:03 +0800
Message-ID: <4A8B6C57.2080000@gmail.com>
References: <20090818135852.0b3b648d.sfr@canb.auug.org.au> <20090818114242.GA28534@kroah.com> <4A8AB525.7050404@gmail.com> <20090818145800.GB6074@kroah.com> <4A8B521D.8080901@sdgsystems.com>
Reply-To: eric.y.miao@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f182.google.com ([209.85.216.182]:56498 "EHLO
	mail-px0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751881AbZHSDHZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2009 23:07:25 -0400
In-Reply-To: <4A8B521D.8080901@sdgsystems.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Aric D. Blumer" <aric@sdgsystems.com>
Cc: Greg KH <greg@kroah.com>, Eric Miao <eric.y.miao@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>, Russell King <rmk@arm.linux.org.uk>

Aric D. Blumer wrote:
> Greg KH wrote:
>> On Tue, Aug 18, 2009 at 10:05:25PM +0800, Eric Miao wrote:
>>   
>>> Greg KH wrote:
>>>     
>>>> On Tue, Aug 18, 2009 at 01:58:52PM +1000, Stephen Rothwell wrote:
>>>>       
>>>>> Hi Eric, Greg,
>>>>>
>>>>> The next-20090817 (and a few before) build (arm trizeps4_defconfig)
>>>>> failed like this:
>>>>>
>>>>> drivers/usb/host/ohci-pxa27x.c:507: error: 'pdev' undeclared (first use in this function)
>>>>>
>>>>> Caused by the interaction of commit
>>>>> 6458baec17e19d38b9d4eb1f96c213f91609c0e3 ("USB: ohci-pxa27x: Reconfigure
>>>>> power settings on resume") from the usb tree with commit
>>>>> b8fb7d4317bcea1b48c9560d23dff81121870ece ("[ARM] pxa: update
>>>>> ohci-pxa27x.c to use 'struct dev_pm_ops'"). from the pxa tree.
>>>>>
>>>>> Greg/Aric, maybe that usb tree patch needs to go through the pxa tree?
>>>>> (and maybe "USB: ohci-pxa27x: Allow NOCP and OCPM to be cleared" as well?)
>>>>>
>>>>> [this also broke the following configs: magician_defconfig,
>>>>> em_x270_defconfig and cm_x2xx_defconfig.]
>>>>>         
>>>> Ick, not good.  Aric, should I drop this patch from my tree?
>>>>       
> 
> Looks like it, but I'll let Eric make the call.
> 

Thanks Aric,

Looks like the additional 'if' statement of 'inf' is unnecessary (otherwise
the _probe has already been failed), patch modified a little bit into the
following, please help confirm before I commit:

commit cc6446f6d3e81939dcc1945aab9ad734b175ce66
Author: Aric D. Blumer <aric@sdgsystems.com>
Date:   Thu Jul 30 13:42:30 2009 -0400

    USB: ohci-pxa27x: Reconfigure power settings on resume
    
    On resume, the power-related bits in UHCRHDA were not being set, so
    they would default to the reset state.  For PXA3xx devices, OCPM must
    be cleared, but it was remaining set from resume reset.
    
    Signed-off-by: Aric D. Blumer <aric@sdgsystems.com>
    Cc: David Brownell <dbrownell@users.sourceforge.net>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 6180074..1229cc0 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -497,6 +497,7 @@ static int ohci_hcd_pxa27x_drv_resume(struct device *dev)
 {
        struct usb_hcd *hcd = dev_get_drvdata(dev);
        struct pxa27x_ohci *ohci = to_pxa27x_ohci(hcd);
+       struct pxaohci_platform_data *inf = dev->platform_data;
        int status;
 
        if (time_before(jiffies, ohci->ohci.next_statechange))
@@ -506,6 +507,9 @@ static int ohci_hcd_pxa27x_drv_resume(struct device *dev)
        if ((status = pxa27x_start_hc(ohci, dev)) < 0)
                return status;
 
+       /* Select Power Management Mode */
+       pxa27x_ohci_select_pmm(ohci, inf->port_mode);
+
        ohci_finish_controller_resume(hcd);
        return 0;
 }
