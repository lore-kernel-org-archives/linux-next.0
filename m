From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: manual merge of the usb tree with the tip tree
Date: Thu, 20 Aug 2009 14:31:29 -0500
Message-ID: <4A8DA491.2090205@windriver.com>
References: <20090819175901.59f1af9e.sfr@canb.auug.org.au> <20090819233818.GD2875@kroah.com> <4A8CB6CF.3010109@windriver.com> <20090820024839.GA4121@kroah.com> <1250747857.8282.114.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:40913 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbZHTTcr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2009 15:32:47 -0400
In-Reply-To: <1250747857.8282.114.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Getz <rgetz@blackfin.uclinux.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Peter Zijlstra wrote:
> On Wed, 2009-08-19 at 19:48 -0700, Greg KH wrote:
>   
>> On Wed, Aug 19, 2009 at 09:37:03PM -0500, Jason Wessel wrote:
>>     
>>> Greg KH wrote:
>>>       
>>>> On Wed, Aug 19, 2009 at 05:59:01PM +1000, Stephen Rothwell wrote:
>>>>   
>>>>         
>>>>> Hi Greg,
>>>>>
>>>>> Today's linux-next merge of the usb tree got a conflict in
>>>>> kernel/printk.c between commit 4d09161196c9a836eacea4b36e2f217bc34894cf
>>>>> ("printk: Enable the use of more than one CON_BOOT (early console)") from
>>>>> the tip tree and commit e289e7dc72eb6bfce70e2722d97a00f5e02893e8 ("USB:
>>>>> printk: early_printk,console: Allow more than one early console") from
>>>>> the usb tree.
>>>>>
>>>>> I assume that these are trying to do (more or less) the same thing.  I
>>>>> have dropped the one from the usb tree for today.  Please sort this out -
>>>>> at least remove the usb tree one until you have done so, thanks.
>>>>>     
>>>>>           
>>>> Jason, any thoughts?  I'm going to drop your printk stuff from my tree
>>>> now, care to sort it out and resend your whole series?
>>>>
>>>>   
>>>>         
>>> I will investigate, re-test and send a new series to Greg KH later in
>>> the week.  The preliminary result shows the problem is a result of a
>>> clash with two different patches in the tip tree.   My patch set and the
>>> two patches it collides with context wise fix different things.
>>>
>>> In order to resolve this it appears that the series will need to get
>>> split into something for the tip tree and something for the USB tree, or
>>> we wait for the next pull of the tip branch into the Linus's tree.
>>>       
>> Hm, I'd prefer to get this in before that :)
>>
>> Let me know what you find.  If there are conflicts, we can work it out.
>>     
>
> Maybe Robin can help out, since he authored one of the conflicting
> patches? 
>   


No need.  I have adjusted the context and removed the sections which
stepped on each other.

I'll post a new usb dbgp patch series off to Greg KH shortly.  Now that
nothing collides we can leave the USB dbgp / early_printk patch series
in the usb branch.  The new series touches nothing in the kernel core,
and only files in the usb tree.

The only file in the x86 tree which is touched is
drivers/usb/early/ehci-dbgp.c and it is for 2 reasons.

1) Remove the limit of 1 on earlyprintk devices
2) Move the usb dbgp device out of the this tree and into the usb early
driver area

Thanks,
Jason.
