From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] mm: Fix alloc_vm_area for noMMU system
Date: Wed, 16 Nov 2011 15:25:30 +0100
Message-ID: <4EC3C7DA.8090600@monstr.eu>
References: <1321429862-17703-1-git-send-email-monstr@monstr.eu> <20111116135900.GB6958@phenom.dumpdata.com> <4EC3C238.40103@citrix.com> <20111116141848.GA29081@phenom.dumpdata.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41810 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757827Ab1KPOZd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2011 09:25:33 -0500
Received: by bke11 with SMTP id 11so611104bke.19
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2011 06:25:32 -0800 (PST)
In-Reply-To: <20111116141848.GA29081@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: David Vrabel <david.vrabel@citrix.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>

Konrad Rzeszutek Wilk wrote:
> On Wed, Nov 16, 2011 at 02:01:28PM +0000, David Vrabel wrote:
>> On 16/11/11 13:59, Konrad Rzeszutek Wilk wrote:
>>> On Wed, Nov 16, 2011 at 08:51:02AM +0100, Michal Simek wrote:
>>>> Patch:
>>>> "xen: map foreign pages for shared rings by updating the PTEs directly"
>>>> (sha1: 5149c0d53f6959d6ab87b4702d544b17ebdc783e) changed number
>>>> of argument for alloc_vm_area but forget to change it for noMMU systems.
>>>> This patch fix it.
>>> Duh!
>>>> CC: David Vrabel <david.vrabel@citrix.com>
>>>> CC: Andrew Morton <akpm@linux-foundation.org>
>>>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>> Yes, please. Thank you!
>> Konrad, I would suggest folding this into the original patch to avoid
>> breaking bisects for noMMU users unnecessarily.
> 
> Can't do. We would lose Michal authership that way and that is not good.
> 

Do it in way you like and it is the best for others. Not sure where exactly your patch
is and it is hard to suggest you how to do it in connection to your merging strategy
Anyway you can add my signed-off-by line to origin patch or keep it single patch

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
