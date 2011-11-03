From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Oct 25 (agp/intel-gtt.c)
Date: Thu, 03 Nov 2011 14:21:53 -0700
Message-ID: <4EB305F1.10600@xenotime.net>
References: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au> <4EA75596.3020301@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:39126 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751381Ab1KCVWf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Nov 2011 17:22:35 -0400
In-Reply-To: <4EA75596.3020301@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Dave Jones <davej@redhat.com>

On 10/25/2011 05:34 PM, Randy Dunlap wrote:
> On 10/25/11 02:36, Stephen Rothwell wrote:
>> Hi all,
> 
> 
> ERROR: "intel_iommu_gfx_mapped" [drivers/char/agp/intel-gtt.ko] undefined!
> 
> Full randconfig file is attached.


This still fails on linux-next of 2011-1102 (was it fixed for 1103?
I haven't checked those builds yet.)

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
