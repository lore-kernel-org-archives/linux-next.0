From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Fri, 25 Apr 2014 13:52:30 -0700
Message-ID: <535ACB0E.4070600@infradead.org>
References: <20140424200837.727695A407C@corp2gmr1-2.hot.corp.google.com>	<535992DD.3060808@infradead.org> <20140425100459.7824f676@annuminas.surriel.com> <535AC91A.1070504@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <535AC91A.1070504@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rik van Riel <riel@redhat.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, umgwanakikbuti@gmail.com
List-Id: linux-next.vger.kernel.org

On 04/25/14 13:44, Randy Dunlap wrote:
> On 04/25/14 07:04, Rik van Riel wrote:
>> On Thu, 24 Apr 2014 15:40:29 -0700
>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>> uml on x86_64 defconfig:
>>>
>>> drivers/built-in.o: In function `__handle_sysrq':
>>> drivers/tty/sysrq.c:514: undefined reference to `rcu_sysrq_start'
>>> drivers/tty/sysrq.c:558: undefined reference to `rcu_sysrq_end'
>>
>> Randy, does the patch below fix it?

CONFIG_TINY_RCU=y

tiny.c does not provide these functions...  Paul...

> Hm, no, it does not.  I'll look into it.
> 
>> Mike, this patch should also address your concerns.
>>
>> Andrew, this can be a -fix patch for the sysctl-rcu patch,
>> assuming it fixes things :)
>>
>> Signed-off-by: Rik van Riel <riel@redhat.com
>> ---
>>  drivers/tty/sysrq.c | 1 +
>>  kernel/rcu/update.c | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
>> index dd53af9..0867433 100644
>> --- a/drivers/tty/sysrq.c
>> +++ b/drivers/tty/sysrq.c
>> @@ -46,6 +46,7 @@
>>  #include <linux/jiffies.h>
>>  #include <linux/syscalls.h>
>>  #include <linux/of.h>
>> +#include <linux/rcupdate.h>
>>  
>>  #include <asm/ptrace.h>
>>  #include <asm/irq_regs.h>
>> diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
>> index 2ac3289..d22309c 100644
>> --- a/kernel/rcu/update.c
>> +++ b/kernel/rcu/update.c
>> @@ -322,7 +322,8 @@ int rcu_jiffies_till_stall_check(void)
>>  
>>  void rcu_sysrq_start(void)
>>  {
>> -	rcu_cpu_stall_suppress = 2;
>> +	if (!rcu_cpu_stall_suppress)
>> +		rcu_cpu_stall_suppress = 2;
>>  }
>>  
>>  void rcu_sysrq_end(void)
>>
> 
> 


-- 
~Randy
