From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [Xen-devel] linux-next: Tree for May 2 (xen: events_base.c)
Date: Tue, 2 May 2017 11:58:23 -0400
Message-ID: <67b83f68-eaad-20c8-c2ef-44c43d97e0ed@oracle.com>
References: <20170502164733.59f7d208@canb.auug.org.au>
 <cf1e1487-dc87-cccc-5574-3706da37a7e2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:35669 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbdEBP7L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 11:59:11 -0400
In-Reply-To: <cf1e1487-dc87-cccc-5574-3706da37a7e2@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: xen-devel@lists.xenproject.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 05/02/2017 11:34 AM, Randy Dunlap wrote:
> On 05/01/17 23:47, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v4.13 destined material in your linux-next
>> included branches until after v4.12-rc1 has been released.
>>
>> Changes since 20170501:
>>
> on x86_64:
>
> drivers/built-in.o: In function `set_affinity_irq':
> events_base.c:(.text+0x1632c4): undefined reference to `xen_have_vector_callback'
> arch/x86/pci/built-in.o: In function `pci_xen_hvm_init':
> (.init.text+0x59f): undefined reference to `xen_have_vector_callback'
>
>


Can you send me (or to the list) your config file?


Thanks.
-boris
