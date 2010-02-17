From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] staging/vmwgfx: depends on FB
Date: Tue, 16 Feb 2010 16:05:24 -0800
Message-ID: <4B7B32C4.6070802@oracle.com>
References: <20100216185534.fdc8eed3.sfr@canb.auug.org.au> <4B7B233F.9000507@oracle.com> <20100216230537.GA19450@suse.de> <4B7B270A.2090609@oracle.com> <20100216232216.GA18733@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:18517 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933683Ab0BQAHV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2010 19:07:21 -0500
In-Reply-To: <20100216232216.GA18733@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, David Airlie <airlied@linux.ie>

On 02/16/10 15:22, Greg KH wrote:
> On Tue, Feb 16, 2010 at 03:15:22PM -0800, Randy Dunlap wrote:
>> On 02/16/10 15:05, Greg KH wrote:
>>> On Tue, Feb 16, 2010 at 02:59:11PM -0800, Randy Dunlap wrote:
>>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>>
>>>> vmwfgx uses framebuffer interfaces, so it should depend on FB.
>>>> Otherwise it has these build errors (e.g., when CONFIG_FB=m):
>>>>
>>>> drivers/built-in.o: In function `vmw_fb_close':
>>>> (.text+0x97713): undefined reference to `unregister_framebuffer'
>>>> drivers/built-in.o: In function `vmw_fb_close':
>>>> (.text+0x97754): undefined reference to `framebuffer_release'
>>>> drivers/built-in.o: In function `vmw_fb_init':
>>>> (.text+0x97e1c): undefined reference to `framebuffer_alloc'
>>>> drivers/built-in.o: In function `vmw_fb_init':
>>>> (.text+0x9838d): undefined reference to `register_framebuffer'
>>>> drivers/built-in.o: In function `vmw_fb_init':
>>>> (.text+0x9842a): undefined reference to `framebuffer_release'
>>>>
>>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>>>> ---
>>>>  drivers/gpu/drm/vmwgfx/Kconfig |    2 +-
>>>
>>> This is not a drivers/staging/* file, so there's not much I can do with
>>> it.  It belongs to David Airlie.
>>
>> OK, I'll resend it to him, thanks.
>>
>> I think I was confused by drivers/staging/Kconfig:
>>
>> source "drivers/gpu/drm/vmwgfx/Kconfig"
>>
>> source "drivers/gpu/drm/nouveau/Kconfig"
>>
>>
>> Why are those lines there??
> 
> Because those modules are "hidden" behind the CONFIG_STAGING option.


oh well, that doesn't clarify anything.  :(

-- 
~Randy
