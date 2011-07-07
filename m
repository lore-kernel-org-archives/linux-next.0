From: J Freyensee <james_p_freyensee@linux.intel.com>
Subject: Re: linux-next: Tree for July 4 (misc/pti)
Date: Thu, 07 Jul 2011 09:29:59 -0700
Message-ID: <4E15DF07.4010507@linux.intel.com>
References: <20110704170952.1024e89b.sfr@canb.auug.org.au> <20110704134541.9adfd4f1.randy.dunlap@oracle.com> <20110707081441.a4a64e59.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110707081441.a4a64e59.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/07/2011 08:14 AM, Randy Dunlap wrote:
> On Mon, 4 Jul 2011 13:45:41 -0700 Randy Dunlap wrote:
>
>> On Mon, 4 Jul 2011 17:09:52 +1000 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20110701:
>>
>> when CONFIG_PCI is not enabled:
>>
>> drivers/misc/pti.c:410: error: implicit declaration of function 'pci_release_region'
>> drivers/misc/pti.c:859: error: implicit declaration of function 'pci_request_region'
>>
>>
>> Stubs for these 2 functions could be added to include/linux/pci.h, but it would
>> make more sense to me just to make the driver depend on PCI since it seems to rely
>> on so many PCI functions.  or are the PCI pieces optional?
>
> ping.  still a problem in linux-next 20110706.

Thanks for the ping.

Is there something you need me to do or look at?

For Intel-Atom architectures, the MIPI PTI module does sit on the PCI 
bus.  It's very much dependent upon the PCI bus for working 
functionality and it's not optional.  So yes, it makes sense for the 
driver to depend on PCI to be there and if PCI is not enabled on the 
system, don't build the pti driver.

Maybe it's a Kconfig dependency?

Thanks,
Jay
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
