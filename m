From: Guenter Roeck <private@roeck-us.net>
Subject: Re: next: Build errors due to 'MIPS: Add probing & defs for VZ &
 guest features'
Date: Sat, 14 May 2016 09:16:13 -0700
Message-ID: <57374F4D.70305@roeck-us.net>
References: <57374216.10307@roeck-us.net>
 <20160514155206.GE1124@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55679 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752112AbcENQQX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 14 May 2016 12:16:23 -0400
In-Reply-To: <20160514155206.GE1124@jhogan-linux.le.imgtec.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

Hi James,

On 05/14/2016 08:52 AM, James Hogan wrote:
> On Sat, May 14, 2016 at 08:19:50AM -0700, Guenter Roeck wrote:
>> James,
>>
>> your patch 'MIPS: Add probing & defs for VZ & guest features' causes build errors
>> in -next when using gcc 4.7.4 / binutils 2.24. This affects almost all mips builds.
> Thanks Guenter. Hmm, I thought virt extensions were supported since
> binutils 2.24, odd.

Actually, turns out it was binutils 2.22 (from the compiler that came with poky 1.3).
Sorry for the confusion.

Guenter
