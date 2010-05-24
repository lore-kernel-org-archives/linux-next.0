From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: build failure after merge of the kgdb tree
Date: Mon, 24 May 2010 15:50:04 -0500
Message-ID: <4BFAE67C.6080000@windriver.com>
References: <20100323150443.608ad7f0.sfr@canb.auug.org.au> <20100524181735.GC6033@core.coreip.homeip.net> <4BFADBC1.9000802@windriver.com> <201005241334.04277.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:63978 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756850Ab0EXUuK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 May 2010 16:50:10 -0400
In-Reply-To: <201005241334.04277.dmitry.torokhov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/24/2010 03:34 PM, Dmitry Torokhov wrote:
> On Monday 24 May 2010 01:04:17 pm Jason Wessel wrote:
>   
>> On 05/24/2010 01:17 PM, Dmitry Torokhov wrote:
>>     
>>> Do we really need to force SysRq on or off? Maybe we should export
>>> __handle_sysrq() instead?
>>>       
>> It seems cleanest to export __handle_sysrq() if that is ok?
>>     
>
> Yes, I think this is the best option. Please feel free to merge through
> your tree.
>   

Will do, I'll add your ack and queue it for the minor -rc1 fixes I am
accumulating for kgdb/kdb.

Thanks,
Jason.
