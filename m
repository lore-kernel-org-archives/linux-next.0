From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 30 Nov 2018 15:57:35 +0530
Message-ID: <8df82787-3baa-3f3f-a0ed-313db11c4122@arm.com>
References: <20181130163008.7d2b213f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130163008.7d2b213f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 11/30/2018 11:00 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc_le perf)
> failed like this:
> 
> bench/numa.c: In function 'bind_to_node':
> bench/numa.c:301:21: error: 'NUMA_NO_NODE' undeclared (first use in this function); did you mean 'NUMA_NUM_NODES'?
>   if (target_node == NUMA_NO_NODE) {
>                      ^~~~~~~~~~~~
>                      NUMA_NUM_NODES
> bench/numa.c:301:21: note: each undeclared identifier is reported only once for each function it appears in
> bench/numa.c: In function 'bind_to_memnode':
> bench/numa.c:342:14: error: 'NUMA_NO_NODE' undeclared (first use in this function); did you mean 'NUMA_NUM_NODES'?
>   if (node == NUMA_NO_NODE)
>               ^~~~~~~~~~~~
>               NUMA_NUM_NODES
> bench/numa.c: In function 'init_thread_data':
> bench/numa.c:1366:19: error: 'NUMA_NO_NODE' undeclared (first use in this function); did you mean 'NUMA_NUM_NODES'?
>    td->bind_node = NUMA_NO_NODE;
>                    ^~~~~~~~~~~~
>                    NUMA_NUM_NODES
> 
> Caused by patch
> 
>   "mm: replace all open encodings for NUMA_NO_NODE"
> 
> I applied the following partial revert for today:

I had skipped this particular file because it includes 'numa.h'. But that does not
seem to pull in <linux/numa.h> though. Could we please add <linux/numa.h> instead
of reverting the actual changes from the patch. I can send out another version of
the patch if required.

- Anshuman
