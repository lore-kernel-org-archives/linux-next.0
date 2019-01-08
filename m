From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 8 Jan 2019 10:24:18 +0530
Message-ID: <78f2ee4a-9851-2b5c-18c6-ba3f3e6bd302@arm.com>
References: <20190108131141.730e9c4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108131141.730e9c4f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 01/08/2019 07:41 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (native
> perf) failed like this:
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
> Caused by commit
> 
>   3856193d8452 ("tools/: replace open encodings for NUMA_NO_NODE")
> 
> [BTW, I did not write that patch, just added fixes last time]

Yes I had consolidated parts from the original patch into the build failure fix.


> [BTW 2, there are lots of cc's that probably no longer apply since this
> was split form the previous patch]

Hmm. I had sent it as a series. So the second patch just carried over all the CC
for the first one as well.

> 
> I have applied the following fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Jan 2019 13:08:32 +1100
> Subject: [PATCH] tools/: fix for replace open encodings for NUMA_NO_NODE
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  tools/perf/bench/numa.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
> index e0ad5f1de226..98ad783efc69 100644
> --- a/tools/perf/bench/numa.c
> +++ b/tools/perf/bench/numa.c
> @@ -34,6 +34,7 @@
>  #include <sys/types.h>
>  #include <linux/kernel.h>
>  #include <linux/time64.h>
> +#include <linux/numa.h>
>  
>  #include <numa.h>

Just curious why the NUMA_NO_NODE definition did not get resolved from the local
numa.h which had the same ones copied over from linux/numa.h but anyways the fix
looks okay.
