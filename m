From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Mar 20 (vmcore)
Date: Wed, 20 Mar 2013 17:10:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1303201709440.23363@chino.kir.corp.google.com>
References: <20130320160536.54e62fc11a3651494b710e3b@canb.auug.org.au> <5149E813.8060307@infradead.org> <alpine.DEB.2.02.1303201153330.17761@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:40384 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755217Ab3CUAKd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 20:10:33 -0400
Received: by mail-pb0-f50.google.com with SMTP id up1so1740165pbc.23
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 17:10:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1303201153330.17761@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, HATAYAMA Daisuke <d.hatayama@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org

On Wed, 20 Mar 2013, David Rientjes wrote:

> I don't think that's it, linux/kexec.h already gets included indirectly.  
> The problem is that CONFIG_KEXEC isn't set so the definition in kexec.h is 
> meaningless.
> 
> This comes from "vmcore: check NT_VMCORE_PAD as a mark indicating the end 
> of ELF note buffer" merged through the -mm tree.  I've added the patch's 
> author and Andrew to the cc.
> 
> How can this be protected by CONFIG_KEXEC?
> 

These patches were removed from -mm today so it should no longer be a 
problem.

If the patchset is reintroduced, please keep this build failure in the 
back of your mind, thanks.
