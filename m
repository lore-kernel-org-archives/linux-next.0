From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 2 (xen: events_base.c)
Date: Tue, 2 May 2017 08:34:16 -0700
Message-ID: <cf1e1487-dc87-cccc-5574-3706da37a7e2@infradead.org>
References: <20170502164733.59f7d208@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:33280 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbdEBPeV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 11:34:21 -0400
In-Reply-To: <20170502164733.59f7d208@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org

On 05/01/17 23:47, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v4.13 destined material in your linux-next
> included branches until after v4.12-rc1 has been released.
> 
> Changes since 20170501:
> 

on x86_64:

drivers/built-in.o: In function `set_affinity_irq':
events_base.c:(.text+0x1632c4): undefined reference to `xen_have_vector_callback'
arch/x86/pci/built-in.o: In function `pci_xen_hvm_init':
(.init.text+0x59f): undefined reference to `xen_have_vector_callback'


-- 
~Randy
