From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [Next] CPU Hotplug test failures on powerpc
Date: Tue, 15 Dec 2009 19:17:28 +0530
Message-ID: <4B279370.5050800@in.ibm.com>
References: <4B2224C7.1020908@in.ibm.com> <1260786122.4165.142.camel@twins>
	<4B261D7A.9040802@in.ibm.com> <1260793182.4165.223.camel@twins>
	<1260825420.2217.40.camel@pasglop>
	<4B275A6B.9030200@in.ibm.com> <1260873827.4165.362.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1260873827.4165.362.camel@twins>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>
List-Id: linux-next.vger.kernel.org

Peter Zijlstra wrote:
>> I added some debug statements within the above code. 
>> This is a 2 cpu machine.
>>
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 1024 
>> XMON dest_cpu = 1024 . dead_cpu = 1
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 1024 
>> XMON dest_cpu = 1024 . dead_cpu = 1
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 1024 
>> XMON dest_cpu = 1024 . dead_cpu = 1
>>
>> Seems to me that the control is stuck in an infinite loop and hence the
>> machine appears to be in hung state. The dest_cpu value is always 1024
>> and never changes, which result in an infinite loop.
>>
>> In working scenario the o/p is something on the following lines
>>
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 0 
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 0 
>> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
>> XMON dest_cpu = 0 
>>
>> Let me know if i should try to record any specific value ?
>>     
>
> Could you possibly print the two masks themselves? cpumask_scnprintf()
> and friend come in handy for this.
>
> The dest_cpu=1024 thing seem to suggest the intersection between
> p->cpus_allowed and cpu_active_mask is empty for some reason, even
> though we forcefully reset p->cpus_allowed to the full set using
> cpuset_cpus_allowed_locked().
>   
So here is the data related to the two masks.

cpu_active_mask = 00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000
XMON dest_cpu = 1024

while p->cpus_allowed =  00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000001
XMON dest_cpu = 1024

In working scenario the above data looks like

cpu_active_mask = 00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000002
XMON dest_cpu = 1

while p->cpus_allowed =  00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,
00000000,00000000,00000002
XMON dest_cpu = 1


hope i got the data correct.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
