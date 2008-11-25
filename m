From: "stephane eranian" <eranian@googlemail.com>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 15:40:20 +0100
Message-ID: <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
	 <20081125102234.GA4281@elte.hu>
Reply-To: eranian@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.158]:10999 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282AbYKYOkW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 09:40:22 -0500
Received: by fg-out-1718.google.com with SMTP id 19so1872fgg.17
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 06:40:21 -0800 (PST)
In-Reply-To: <20081125102234.GA4281@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

Hi,


I looked at the modifications to entry_32.S and entry_64.S generated
by perfmon in 2.6.28-rc6
and they are quite minimal:

--- a/arch/x86/kernel/entry_32.S
+++ b/arch/x86/kernel/entry_32.S
@@ -513,7 +513,7 @@ ENDPROC(system_call)
        ALIGN
        RING0_PTREGS_FRAME              # can't unwind into user space anyway
 work_pending:
-       testb $_TIF_NEED_RESCHED, %cl
+       testw $(_TIF_NEED_RESCHED|_TIF_PERFMON_WORK), %cx
        jz work_notifysig
 work_resched:
        call schedule
diff --git a/arch/x86/kernel/entry_64.S b/arch/x86/kernel/entry_64.S
index b86f332..b6f061e 100644
--- a/arch/x86/kernel/entry_64.S
+++ b/arch/x86/kernel/entry_64.S
@@ -869,7 +869,13 @@ END(error_interrupt)
 ENTRY(spurious_interrupt)
        apicinterrupt SPURIOUS_APIC_VECTOR,smp_spurious_interrupt
 END(spurious_interrupt)
-
+
+#ifdef CONFIG_PERFMON
+ENTRY(pmu_interrupt)
+       apicinterrupt LOCAL_PERFMON_VECTOR,smp_pmu_interrupt
+END(pmu_interrupt)
+#endif
+
 /*
  * Exception entry points.
  */


Looking at Stephen's tree, looks like there were some new macros introduced to
declare the lowest level interrupt handler for entry_64. There is not much I can
do in advance to avoid this kind of problems. The handler is part of perfmon not
some generic x86 modification. Same thing for entry_32.S.

So I am not sure I understand your point about submitting the changes to the x86
tree first.




On Tue, Nov 25, 2008 at 11:22 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi Stephane,
>>
>> Today's linux-next merge of the perfmon3 tree got a conflict in
>> arch/x86/kernel/entry_64.S between commit
>> 322648d1ba75280d62f114d47048beb0b35f5047 ("x86: include ENTRY/END in
>> entry handlers in entry_64.S") from the x86 tree and commit
>> 3511a04973eaac18ee386f0db8c109e589019511 ("perfmon: x86-64 hooks")
>> from the perfmon3 tree.
>
> very emphatic NAK on carrying such x86 changes in the perfmon tree,
> and putting that into linux-next!
>
> Those perfmon changes should be submitted to the x86 tree. The code it
> touches is sensitive and the design questions matter a lot as well.
>
>        Ingo
>
