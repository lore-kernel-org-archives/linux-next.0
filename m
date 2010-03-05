From: Tejun Heo <tj@kernel.org>
Subject: Re: -next March 3: Boot failure on x86 (Oops)
Date: Fri, 05 Mar 2010 15:17:56 +0900
Message-ID: <4B90A214.70301@kernel.org>
References: <20100303174603.5be197ba.sfr@canb.auug.org.au> <4B8E83D4.6090507@in.ibm.com> <4B8F0CD0.1040507@kernel.org> <4B8F43DD.10002@in.ibm.com> <4B909FC5.8020800@kernel.org> <4B90A031.8090306@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B90A031.8090306@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hello,

On 03/05/2010 03:09 PM, Tejun Heo wrote:
> On 03/05/2010 03:08 PM, Tejun Heo wrote:
>> Hmmm... this means that on one of the chunks, chunk->list.next was
>> NULL (BTW, the disassembly is from unlinked object, right?).  The main
>> allocation code hasn't seen much change lately.  The only changes are,
>>
>> 22b737f4c75197372d64afc6ed1bccd58c00e549 : just refactoring
>> 833af8427be4b217b5bc522f61afdbd3f1d282c2 : possible but isn't very new
> 
> Can you also please try reverting the above two commits?

Sorry about all the fuss but I think this could be it.  It looks like
I forgot to update need_to_extend logic while adding simultaneous
head/tail split for alignment, so the array might be overrun by one
entry.  Can you please try this one first?

Thanks.

diff --git a/mm/percpu.c b/mm/percpu.c
index 768419d..f1ed9ea 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -373,11 +373,11 @@ static int pcpu_need_to_extend(struct pcpu_chunk *chunk)
 {
 	int new_alloc;
 
-	if (chunk->map_alloc >= chunk->map_used + 2)
+	if (chunk->map_alloc >= chunk->map_used + 3)
 		return 0;
 
 	new_alloc = PCPU_DFL_MAP_ALLOC;
-	while (new_alloc < chunk->map_used + 2)
+	while (new_alloc < chunk->map_used + 3)
 		new_alloc *= 2;
 
 	return new_alloc;

-- 
tejun
