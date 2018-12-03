From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 3 Dec 2018 16:07:03 +0530
Message-ID: <7ddea267-9a62-ae47-03d1-b33b8f1a36d6@arm.com>
References: <20181203180037.0a54279b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203180037.0a54279b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 12/03/2018 12:30 PM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc_le perf)
> failed like this:
> 
> bench/numa.c:37:10: fatal error: linux/numa.h: No such file or directory
>  #include <linux/numa.h>
>           ^~~~~~~~~~~~~~
> 
> Caused by patches
> 
>   "mm: replace all open encodings for NUMA_NO_NODE"
>   "mm-replace-all-open-encodings-for-numa_no_node-fix"
> 
> For linux/numa.h to be generally availble to the tools builds, it must
> be copied into tools/include/linux ...
> 
> I have done that copy for today:
> 
> From 6dabc11d5513510d0ec0a6b0a4aa8b9051b71516 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 3 Dec 2018 17:57:27 +1100
> Subject: [PATCH] linux/numa.h is now needed for the perf build
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Makes sense. Thanks Stephen for taking care of this build failure
more than once.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
