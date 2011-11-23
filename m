From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (uprobes tree related)
Date: Wed, 23 Nov 2011 16:12:06 +0530
Message-ID: <20111123104206.GB22971@linux.vnet.ibm.com>
References: <20111123144409.7d1816bef960a2f277aaf1b9@canb.auug.org.au>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111123144409.7d1816bef960a2f277aaf1b9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> In file included from include/linux/mm_types.h:15:0,
>                  from include/linux/sched.h:64,
>                  from arch/powerpc/mm/mem.c:21:
> include/linux/uprobes.h:174:49: error: 'struct mm_struct' declared inside parameter list [-Werror]
> include/linux/uprobes.h:174:49: error: its scope is only this definition or declaration, which is probably not what you want [-Werror]
> 
> And many more similar.
> 
> Caused by commit 61fafad13005 ("uprobes_xol" - "uprobes: slot allocation").


Thanks for reporting this. 
I have folded your fix into the patch.

-- 
Thanks and Regards
Srikar
