From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the mips tree
Date: Tue, 08 Aug 2017 12:33:46 -0500
Message-ID: <87wp6eezgl.fsf@xmission.com>
References: <20170808151004.071d5a6d@canb.auug.org.au>
        <20170808055822.GI3509@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:32854 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbdHHRmL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2017 13:42:11 -0400
In-Reply-To: <20170808055822.GI3509@linux-mips.org> (Ralf Baechle's message of
        "Tue, 8 Aug 2017 07:58:22 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

Ralf Baechle <ralf@linux-mips.org> writes:

> On Tue, Aug 08, 2017 at 03:10:04PM +1000, Stephen Rothwell wrote:
>
> (Maciej added to cc.)
>
>> Hi Eric,
>> 
>> Today's linux-next merge of the userns tree got a conflict in:
>> 
>>   arch/mips/kernel/traps.c
>> 
>> between commit:
>> 
>>   260a789828aa ("MIPS: signal: Remove unreachable code from force_fcr31_sig().")
>> 
>> from the mips tree and commit:
>> 
>>   ea1b75cf9138 ("signal/mips: Document a conflict with SI_USER with SIGFPE")
>> 
>> from the userns tree.
>> 
>> I fixed it up (the former removed the code updated by the latter) and
>> can carry the fix as necessary. This is now fixed as far as linux-next
>> is concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
>
> Eric,
>
> after yesterday's emails on the topic I think commit ea1b75cf9138 ("signal/
> mips: Document a conflict with SI_USER with SIGFPE") should be
> dropped.


I have a follow on change I am about to post and would like to carry
that replaces force_sig_info with force_sig_fault.  So force_fcr31_sig
winds up looking like:

void force_fcr31_sig(unsigned long fcr31, void __user *fault_addr,
		     struct task_struct *tsk)
{
	int si_code;

	if (fcr31 & FPU_CSR_INV_X)
		si_code = FPE_FLTINV;
	else if (fcr31 & FPU_CSR_DIV_X)
		si_code = FPE_FLTDIV;
	else if (fcr31 & FPU_CSR_OVF_X)
		si_code = FPE_FLTOVF;
	else if (fcr31 & FPU_CSR_UDF_X)
		si_code = FPE_FLTUND;
	else if (fcr31 & FPU_CSR_INE_X)
		si_code = FPE_FLTRES;
	else
		si_code = FPE_FIXME;
	force_sig_fault(SIGFPE, si_code, fault_addr, tsk);
}

Which causes gcc to complain if the last else clause is dropped.

Would you be happy if the function wound up looking like:

void force_fcr31_sig(unsigned long fcr31, void __user *fault_addr,
		     struct task_struct *tsk)
{
	int si_code;

	if (fcr31 & FPU_CSR_INV_X)
		si_code = FPE_FLTINV;
	else if (fcr31 & FPU_CSR_DIV_X)
		si_code = FPE_FLTDIV;
	else if (fcr31 & FPU_CSR_OVF_X)
		si_code = FPE_FLTOVF;
	else if (fcr31 & FPU_CSR_UDF_X)
		si_code = FPE_FLTUND;
	else if (fcr31 & FPU_CSR_INE_X)
		si_code = FPE_FLTRES;
	else
		return; /* Broken hardware? */

	force_sig_fault(SIGFPE, si_code, fault_addr, tsk);
}

As it is now clear that code path should never happen I will be happy to
queue change that effectively reverts of ea1b75cf9138 ("signal/mips:
Document a conflict with SI_USER with SIGFPE") and just returns from
force_fcr32_sig in that case.

Eric
