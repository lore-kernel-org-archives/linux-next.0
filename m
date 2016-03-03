From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 3
Date: Thu, 3 Mar 2016 04:04:52 -0800
Message-ID: <56D82864.6030904@roeck-us.net>
References: <20160303170926.05390033@canb.auug.org.au>
 <20160303105910.GA2652@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38519 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331AbcCCMEy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2016 07:04:54 -0500
In-Reply-To: <20160303105910.GA2652@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/03/2016 03:00 AM, Sudip Mukherjee wrote:
> On Thu, Mar 03, 2016 at 05:09:26PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160302:
>
> With next-20160301 and next-20160302 I am having problem in allmodconfig
> build of x86_64. The error being:
>
> In file included from builtin-check.c:32:0:
> elf.h:22:18: fatal error: gelf.h: No such file or directory
> compilation terminated.
> In file included from elf.c:30:0:
> elf.h:22:18: fatal error: gelf.h: No such file or directoryIn file
> included from special.h:22:0,
> 	                  from special.c:26:
> elf.h:22:18: fatal error: gelf.h: No such file or directory
> compilation terminated.
>
> I have intsalled libelf-dev and now make allmodconfig && make -j8 works
> but if I am trying make O=nextbuild allmodconfig && make O=nextbuild -j8
> it again fails with the error:
> scripts/Makefile.include:3: *** O=nextbuild does not exist.  Stop.
>
> But this has been my normal workflow and I do have a valid directory
> called nextbuild.
>
> Am i the only one hitting this error? Do i need to bisect or it is a
> known issue?
>

Same problem here.

Guenter
