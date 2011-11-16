From: David Vrabel <david.vrabel@citrix.com>
Subject: Re: [PATCH] mm: Fix alloc_vm_area for noMMU system
Date: Wed, 16 Nov 2011 14:01:28 +0000
Message-ID: <4EC3C238.40103@citrix.com>
References: <1321429862-17703-1-git-send-email-monstr@monstr.eu> <20111116135900.GB6958@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:12185 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757119Ab1KPOBn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2011 09:01:43 -0500
In-Reply-To: <20111116135900.GB6958@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michal Simek <monstr@monstr.eu>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>

On 16/11/11 13:59, Konrad Rzeszutek Wilk wrote:
> On Wed, Nov 16, 2011 at 08:51:02AM +0100, Michal Simek wrote:
>> Patch:
>> "xen: map foreign pages for shared rings by updating the PTEs directly"
>> (sha1: 5149c0d53f6959d6ab87b4702d544b17ebdc783e) changed number
>> of argument for alloc_vm_area but forget to change it for noMMU systems.
>> This patch fix it.
> 
> Duh!
>>
>> CC: David Vrabel <david.vrabel@citrix.com>
>> CC: Andrew Morton <akpm@linux-foundation.org>
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> 
> Yes, please. Thank you!

Konrad, I would suggest folding this into the original patch to avoid
breaking bisects for noMMU users unnecessarily.

David

>> Signed-off-by: Michal Simek <monstr@monstr.eu>
>>
>> ---
>> It is for linux-next tree.
>>
>> Michal
>> ---
>>  mm/nommu.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/mm/nommu.c b/mm/nommu.c
>> index 73419c5..b982290 100644
>> --- a/mm/nommu.c
>> +++ b/mm/nommu.c
>> @@ -454,7 +454,7 @@ void  __attribute__((weak)) vmalloc_sync_all(void)
>>   *	between processes, it syncs the pagetable across all
>>   *	processes.
>>   */
>> -struct vm_struct *alloc_vm_area(size_t size)
>> +struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
>>  {
>>  	BUG();
>>  	return NULL;
>> -- 
>> 1.7.5.4
