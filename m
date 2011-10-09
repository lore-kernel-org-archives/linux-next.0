From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] usb gadget: fix langwell_udc.c build error
Date: Sun, 09 Oct 2011 10:50:56 -0700
Message-ID: <4E91DF00.8060107@xenotime.net>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au> <4E8F67C6.5020603@xenotime.net> <20111008100326.GA24633@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:36904 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751997Ab1JIRu7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Oct 2011 13:50:59 -0400
In-Reply-To: <20111008100326.GA24633@legolas.emea.dhcp.ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: balbi@ti.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 10/08/11 03:03, Felipe Balbi wrote:
> Hi,
> 
> On Fri, Oct 07, 2011 at 01:57:42PM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> Move function to fix langwell_udc.c build error:
>>
>> drivers/usb/gadget/langwell_udc.c: In function 'show_langwell_udc':
>> drivers/usb/gadget/langwell_udc.c:1693:3: error: implicit declaration of function 'lpm_device_speed'
>> drivers/usb/gadget/langwell_udc.c: At top level:
>> drivers/usb/gadget/langwell_udc.c:2637:37: error: conflicting types for 'lpm_device_speed'
>> drivers/usb/gadget/langwell_udc.c:1693:20: note: previous implicit declaration of 'lpm_device_speed' was here
> 
> I don't have this compile error on my branch, did something go in
> without me noticing ?

probably not.  What version of gcc are you using?
I'm using 4.5.1.

> Can you blame a comit which introduced this ?

I don't see such a commit.

> btw, all I have is a warning.

What warning?

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
