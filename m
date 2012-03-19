From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 19 (uml)
Date: Mon, 19 Mar 2012 13:16:31 -0700
Message-ID: <4F67941F.4090302@xenotime.net>
References: <20120319184830.fce597a16eaf7206195a7a45@canb.auug.org.au> <4F674A2D.5080504@xenotime.net> <4F675B78.8060300@nod.at> <20120319164451.GI6589@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:46662 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932279Ab2CSUQc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Mar 2012 16:16:32 -0400
In-Reply-To: <20120319164451.GI6589@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Richard Weinberger <richard@nod.at>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/19/2012 09:44 AM, Al Viro wrote:

> On Mon, Mar 19, 2012 at 05:14:48PM +0100, Richard Weinberger wrote:
>> Looks like this commit introduced the issue:
>>
>> commit 1ed71e0439cba3609d3c69bf04795e0389cd35e4
>> Author: Al Viro <viro@zeniv.linux.org.uk>
>> Date:   Thu Feb 23 01:33:19 2012 -0500
>>
>>     um: embed ->stub_pages[] into mmu_context
>>
>>     seriously, kmalloc() for two-element array of pointers?
>>
>>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>>
>> The size of struct page is not known to all users of asm/mmu.h
> 
> Aaargh...  Dumb braino, fixed in the local queue back in Feb 25, fix
> not folded into commit and missed on cherry-pick ;-/
> 
> It's
>         struct page *stub_pages[2];
> of course...
> 
> OK, fix properly folded into that sucker, for-next repushed.
> --


Thanks, that works.

-- 
~Randy
