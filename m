From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Dec 3 (mm/Kconfig)
Date: Thu, 5 Dec 2013 15:14:31 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1312051512490.7717@chino.kir.corp.google.com>
References: <CAL8k4FwmVmCq8jPWNoRXKPtnSdRc3pwaMCE+AZoq_VoZphpR_A@mail.gmail.com> <alpine.DEB.2.02.1312041558280.6329@chino.kir.corp.google.com> <CAL8k4FzPYZ1Ar1w2rbR7_UWzvvCKRqXMWwJLLFNBNg=VRS3riQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAL8k4FzPYZ1Ar1w2rbR7_UWzvvCKRqXMWwJLLFNBNg=VRS3riQ@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Sima Baymani <sima.baymani@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, tangchen@cn.fujitsu.com, akpm@linux-foundation.org, linux-mm@kvack.org, aquini@redhat.com, linux-kernel@vger.kernel.org, gang.chen@asianux.com, aneesh.kumar@linux.vnet.ibm.com, isimatu.yasuaki@jp.fujitsu.com, kirill.shutemov@linux.intel.com, sjenning@linux.vnet.ibm.com, darrick.wong@oracle.com
List-Id: linux-next.vger.kernel.org

On Thu, 5 Dec 2013, Sima Baymani wrote:

> > CONFIG_HWPOISON_INJECT is unrelated, it already depends on CONFIG_PROC_FS.
> >
> > CONFIG_PROC_PAGE_MONITOR is obviously only useful for CONFIG_PROC_FS, so
> > the correct fix would be to make CONFIG_MEM_SOFT_DIRTY depend on
> > CONFIG_PROC_FS.
> >
> > Want to try sending a patch?
> 
> You bet!
> 
> However, I have the slightest confusion:
> I tested what you suggested by running "make oldconfig", and it does
> eliminate the error. However, I can't figure out why it's enough with
> adding the dependency for PROC_FS in MEM_SOFT_DIRTY, if
> PROC_PAGE_MONITOR depends on both?
> 

"select" will force the option to be selected regardless of its 
dependencies, so in this case you have CONFIG_MEM_SOFT_DIRTY set and
CONFIG_PROC_FS unset and CONFIG_MEM_SOFT_DIRTY enables PROC_PAGE_MONITOR 
which depends on CONFIG_PROC_FS.  The warning you're fixing shows the 
missing dependency.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
