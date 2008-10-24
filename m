From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: S3 sleep no longer works on x86_64 in 2.6.27
Date: Thu, 23 Oct 2008 19:44:39 -0700
Message-ID: <49013697.2040902@zytor.com>
References: <20081023122405.GC14838@redhat.com> <20081023125104.GA9506@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:37740 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752427AbYJXCqk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 22:46:40 -0400
In-Reply-To: <20081023125104.GA9506@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, stable@kernel.org
Cc: Gleb Natapov <gleb@redhat.com>, gcosta@redhat.com, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Gleixner <tglx@linutronix.de>

Ingo Molnar wrote:
> * Gleb Natapov <gleb@redhat.com> wrote:
> 
>> Hi,
>>
>> S3 sleep no longer works on x86_64 (at least in KVM, but it looks like 
>> this is the kernel bug). Kernel 2.6.26 works. I think that the commit 
>> that caused the problem is a939098af, but I can't be 100% sure since 
>> compilation is broken at this point.
>>
>> Triple fault happens during S3 resume. It happens in 
>> arch/x86/kernel/head_64.S during access to GDT after it was loaded on 
>> line 213 (lgdt early_gdt_descr(%rip)) early_gdt_descr points to 
>> per_cpu__gdt_page and this address contains valid GDT entries during a 
>> regular boot, but on S3 resume in contains garbage. It seems that 
>> per_cpu area is reallocated somewhere, but I don't understand this 
>> magic enough to fix it. Can somebody look at this and explain what 
>> happens?
> 
> could you check whether the (post-v2.6.27) upstream fix below does the 
> trick for you?
> 
> 	Ingo
> 
> From 3038edabf48f01421c621cb77a712b446d3a5d67 Mon Sep 17 00:00:00 2001
> From: Rafael J. Wysocki <rjw@sisk.pl>
> Date: Fri, 17 Oct 2008 01:26:27 +0200
> Subject: [PATCH] x86 ACPI: fix breakage of resume on 64-bit UP systems with SMP kernel
> 
> x86 ACPI: Fix breakage of resume on 64-bit UP systems with SMP kernel
> 

Is this patch scheduled for 2.6.27-stable?  If not, it sounds like it 
should be.

	-hpa
