From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: tm6000 compilation breakage on linux-next
Date: Mon, 03 May 2010 14:01:54 -0300
Message-ID: <4BDF0182.9040903@redhat.com>
References: <4BDEFAE4.1060700@redhat.com> <20100503164857.GA5750@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15566 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754434Ab0ECRCG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 May 2010 13:02:06 -0400
In-Reply-To: <20100503164857.GA5750@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

Greg KH wrote:
> On Mon, May 03, 2010 at 01:33:40PM -0300, Mauro Carvalho Chehab wrote:
>> Hi Stephen,
>>
>> Randy reported a breakage while compiling drivers/staging/tm6000, due to
>> this change:
>>     commit 1c1b78bee1a94f98deeb9c24b21c4812e191646c
>>     Author: Greg Kroah-Hartman <gregkh@suse.de>
>>     Date:   Thu Apr 29 15:46:07 2010 -0700
>>
>>     USB: remove unused usb_buffer_alloc and usb_buffer_free macros
>>     
>>     Now that all callers are converted over, remove the compatibility
>>     functions and all is good.
>>     
>>     Cc: Daniel Mack <daniel@caiaq.de>
>>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
>>
>> A fix patch is as simple as:
>> 	s/usb_buffer_alloc/usb_alloc_coherent/
>> 	s/usb_buffer_free/usb_free_coherent/
>>
>> The problem is that, if I apply such patch on my tree, it will break compilation
>> with upstream.
> 
> Not anymore.  Those functions are now in Linus's tree, so you can safely
> make the change in your tree now, and all is good :)

Ah, that makes life easier, thanks!

-- 

Cheers,
Mauro
