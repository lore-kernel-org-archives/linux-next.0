From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the tip tree
Date: Mon, 15 Oct 2018 00:49:49 -0500
Message-ID: <87d0sbpxmq.fsf@xmission.com>
References: <20181015151159.5ce4faa5@canb.auug.org.au>
        <20181015153437.70179aaf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015153437.70179aaf@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 15 Oct 2018 15:34:37 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Mon, 15 Oct 2018 15:11:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the userns tree got a conflict in:
>> 
>>   arch/x86/mm/fault.c
>> 
>> between commit:
>> 
>>   164477c2331b ("x86/mm: Clarify hardware vs. software "error_code"")
>> (and others from that series)
>> 
>> from the tip tree and commits:
>> 
>>   768fd9c69bb5 ("signal/x86: Remove pkey parameter from bad_area_nosemaphore")
>>   25c102d803ea ("signal/x86: Remove pkey parameter from mm_fault_error")
>> 
>> from the userns tree.
>> 
>> I fixed it up (I think - see below) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>> 
>> diff --cc arch/x86/mm/fault.c
>> index c2e3e5127ebc,8d77700a7883..000000000000
>> --- a/arch/x86/mm/fault.c
>> +++ b/arch/x86/mm/fault.c
>>  +/* Handle faults in the user portion of the address space */
>>  +static inline
>>  +void do_user_addr_fault(struct pt_regs *regs,
>>  +			unsigned long hw_error_code,
>>  +			unsigned long address)
>>  +{
>>  +	unsigned long sw_error_code;
>>  +	struct vm_area_struct *vma;
>>  +	struct task_struct *tsk;
>>  +	struct mm_struct *mm;
>>  +	vm_fault_t fault, major = 0;
>>  +	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>>  +	u32 pkey;
>
> I missed removing the above line.

Yes.  At first glance with the above change it looks like you got it.

Eric
