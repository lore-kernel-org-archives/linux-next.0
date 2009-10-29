From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH -next] k8.h: add struct bootnode
Date: Thu, 29 Oct 2009 02:31:23 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.0910290229490.21298@chino.kir.corp.google.com>
References: <20091028190643.627f10aa.sfr@canb.auug.org.au> <20091028160955.d27ccb16.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.33.17]:45671 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751360AbZJ2Jbn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2009 05:31:43 -0400
In-Reply-To: <20091028160955.d27ccb16.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 28 Oct 2009, Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> k8.h uses struct bootnode but does not #include a header file
> for it, so provide a simple declaration for it.
> 
> arch/x86/include/asm/k8.h:13: warning: 'struct bootnode' declared inside parameter list
> arch/x86/include/asm/k8.h:13: warning: its scope is only this definition or declaration, which is probably not what you want
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Acked-by: David Rientjes <rientjes@google.com>

This is probably my fault originating from my patchset in Ingo's x86/mm 
tree with some unexpected config option combination.  Thanks Randy!

> ---
>  arch/x86/include/asm/k8.h |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20091028.orig/arch/x86/include/asm/k8.h
> +++ linux-next-20091028/arch/x86/include/asm/k8.h
> @@ -4,6 +4,7 @@
>  #include <linux/pci.h>
>  
>  extern struct pci_device_id k8_nb_ids[];
> +struct bootnode;
>  
>  extern int early_is_k8_nb(u32 value);
>  extern struct pci_dev **k8_northbridges;
