From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] s390: add missing module.h/export.h includes
Date: Sat, 30 Jul 2011 14:50:32 -0400
Message-ID: <4E345278.4060807@windriver.com>
References: <20110730072515.GA2641@osiris.boeblingen.de.ibm.com>	<4E344260.8070100@windriver.com> <20110730113135.1f93e253.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:61319 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271Ab1G3SvK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 14:51:10 -0400
In-Reply-To: <20110730113135.1f93e253.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On 11-07-30 02:31 PM, Randy Dunlap wrote:
> On Sat, 30 Jul 2011 13:41:52 -0400 Paul Gortmaker wrote:
> 
>> On 11-07-30 03:25 AM, Heiko Carstens wrote:
>>> Subject: [PATCH] s390: add missing module.h/export.h includes
>>>
>>> From: Heiko Carstens <heiko.carstens@de.ibm.com>
>>>
>>> Fix several compile errors on s390 caused by splitting module.h.
>>
>> Thanks, I'll put this on the branch today.
> 
> Hi Paul,
> 
> Did you see the 10 (I think) patches that I posted in reply to
> Stephen's linux-next 20110729 announcement?
> [that I did not copy you on :( ]
> 
> They add linux/module.h or linux/export.h (and 1 for linux/sysfs.h)
> to multiple files to fix build errors.
> 
> You can see them as replies to https://lkml.org/lkml/2011/7/29/52
> or I can send them directly to you if you want me to do that...

I'll grab them from existing e-mails as appropriate.  For any ones
that I flag as new files only existing in next, we'll need the maintainer
to do the appropriate module.h addition.  Since their tree won't have
an export.h, they won't have any choice but to take the larger header
for now.  I plan on doing later sweeps to see if there are any lingering
optimizations via "downsizing" more module.h users, so we'll convert
any lingering few like this later.

Thanks for chipping in, it turned out to be quite the task in the end.
Paul.

> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
