From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 7 (arch/x86/mm/tlb.c: events)
Date: Wed, 21 Jun 2017 20:58:38 -0700
Message-ID: <1fd32483-427e-5cb2-9af0-75b1cf2c0fa7@infradead.org>
References: <20170607160734.0de4e056@canb.auug.org.au>
 <fc67a1fe-28b7-59fd-b702-2ff4854c9703@infradead.org>
 <20170622103527.781f7761@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622103527.781f7761@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/21/2017 05:35 PM, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Wed, 7 Jun 2017 09:26:26 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> on i386:
>>
>>   CC      arch/x86/mm/tlb.o
>> In file included from ../include/linux/mm.h:1032:0,
>>                  from ../arch/x86/mm/tlb.c:3:
>> ../arch/x86/mm/tlb.c: In function 'flush_tlb_func_remote':
>> ../arch/x86/mm/tlb.c:251:21: error: 'NR_TLB_REMOTE_FLUSH_RECEIVED' undeclared (first use in this function)
>>   count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>>                      ^
>> ../include/linux/vmstat.h:90:49: note: in definition of macro 'count_vm_tlb_event'
>>  #define count_vm_tlb_event(x)    count_vm_event(x)
>>                                                  ^
>> ../arch/x86/mm/tlb.c:251:21: note: each undeclared identifier is reported only once for each function it appears in
>>   count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>>                      ^
>> ../include/linux/vmstat.h:90:49: note: in definition of macro 'count_vm_tlb_event'
>>  #define count_vm_tlb_event(x)    count_vm_event(x)
>>                                                  ^
>> ../arch/x86/mm/tlb.c: In function 'native_flush_tlb_others':
>> ../arch/x86/mm/tlb.c:258:21: error: 'NR_TLB_REMOTE_FLUSH' undeclared (first use in this function)
>>   count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
>>                      ^
>> ../include/linux/vmstat.h:90:49: note: in definition of macro 'count_vm_tlb_event'
>>  #define count_vm_tlb_event(x)    count_vm_event(x)
>>                                                  ^
>> ../arch/x86/mm/tlb.c: In function 'do_flush_tlb_all':
>> ../arch/x86/mm/tlb.c:326:21: error: 'NR_TLB_REMOTE_FLUSH_RECEIVED' undeclared (first use in this function)
>>   count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>>                      ^
>> ../include/linux/vmstat.h:90:49: note: in definition of macro 'count_vm_tlb_event'
>>  #define count_vm_tlb_event(x)    count_vm_event(x)
>>                                                  ^
>> ../arch/x86/mm/tlb.c: In function 'flush_tlb_all':
>> ../arch/x86/mm/tlb.c:334:21: error: 'NR_TLB_REMOTE_FLUSH' undeclared (first use in this function)
>>   count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
>>                      ^
>> ../include/linux/vmstat.h:90:49: note: in definition of macro 'count_vm_tlb_event'
>>  #define count_vm_tlb_event(x)    count_vm_event(x)
> 
> Do you know if this has been fixed?
> 

I cannot repro it on linux-next of 20170621.

-- 
~Randy
