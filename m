From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 26 (uml)
Date: Mon, 13 Aug 2012 10:00:16 -0700
Message-ID: <502932A0.3060001@xenotime.net>
References: <20120726150419.0de645e8750e3a15fa0f1aaa@canb.auug.org.au> <50115FCF.4060708@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy12-pub.bluehost.com ([50.87.16.10]:37539 "HELO
	oproxy12-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752667Ab2HMRBp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Aug 2012 13:01:45 -0400
In-Reply-To: <50115FCF.4060708@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, user-mode-linux-devel@lists.sourceforge.net

On 07/26/2012 08:18 AM, Randy Dunlap wrote:

> On 07/25/2012 10:04 PM, Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Please do not add anything to linux-next included branches/series that is
>> destined for v3.7 until after v3.6-rc1 is released.
>>
>> Reminder: do not rebase your branches before asking Linus to pull them ...
>>
>> Changes since 20120725:
>>
> 
> 
> 
> uml on x86_64 (defconfig) build fails with:
> 
>   CC      arch/x86/um/../kernel/module.o
> arch/x86/um/../kernel/module.c:96:5: error: redefinition of 'apply_relocate_add'
> include/linux/moduleloader.h:64:19: note: previous definition of 'apply_relocate_add' was here
> make[2]: *** [arch/x86/um/../kernel/module.o] Error 1
> 
> 
> 



Adding Rusty.


This build error is still happening for uml on x86_64
in linux-next 20120813.


-- 
~Randy
