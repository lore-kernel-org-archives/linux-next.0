From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Dec 3 (mm/Kconfig)
Date: Wed, 4 Dec 2013 16:00:19 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1312041558280.6329@chino.kir.corp.google.com>
References: <CAL8k4FwmVmCq8jPWNoRXKPtnSdRc3pwaMCE+AZoq_VoZphpR_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAL8k4FwmVmCq8jPWNoRXKPtnSdRc3pwaMCE+AZoq_VoZphpR_A@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Sima Baymani <sima.baymani@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, tangchen@cn.fujitsu.com, akpm@linux-foundation.org, linux-mm@kvack.org, aquini@redhat.com, linux-kernel@vger.kernel.org, gang.chen@asianux.com, aneesh.kumar@linux.vnet.ibm.com, isimatu.yasuaki@jp.fujitsu.com, kirill.shutemov@linux.intel.com, sjenning@linux.vnet.ibm.com, darrick.wong@oracle.com
List-Id: linux-next.vger.kernel.org

On Wed, 4 Dec 2013, Sima Baymani wrote:

> When generating randconfig, got following warning:
> 
> warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY) selects PROC_PAGE_MONITOR
> which has unmet direct dependencies (PROC_FS && MMU)
> 
> I would have liked to form a patch for it, but not sure whether to
> simply add PROC_FS && MMU as dependencies for HWPOISON_INJECT and
> MEM_SOFT_DIRTY, or if some other fix would be more suitable?
> 

CONFIG_HWPOISON_INJECT is unrelated, it already depends on CONFIG_PROC_FS.

CONFIG_PROC_PAGE_MONITOR is obviously only useful for CONFIG_PROC_FS, so 
the correct fix would be to make CONFIG_MEM_SOFT_DIRTY depend on 
CONFIG_PROC_FS.

Want to try sending a patch?

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
