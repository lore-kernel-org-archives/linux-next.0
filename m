From: Sima Baymani <sima.baymani@gmail.com>
Subject: Re: linux-next: Tree for Dec 3 (mm/Kconfig)
Date: Thu, 5 Dec 2013 19:28:03 +0100
Message-ID: <CAL8k4FzPYZ1Ar1w2rbR7_UWzvvCKRqXMWwJLLFNBNg=VRS3riQ@mail.gmail.com>
References: <CAL8k4FwmVmCq8jPWNoRXKPtnSdRc3pwaMCE+AZoq_VoZphpR_A@mail.gmail.com>
	<alpine.DEB.2.02.1312041558280.6329@chino.kir.corp.google.com>
Reply-To: sima.baymani@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.02.1312041558280.6329@chino.kir.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: David Rientjes <rientjes@google.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, tangchen@cn.fujitsu.com, akpm@linux-foundation.org, linux-mm@kvack.org, aquini@redhat.com, linux-kernel@vger.kernel.org, gang.chen@asianux.com, aneesh.kumar@linux.vnet.ibm.com, isimatu.yasuaki@jp.fujitsu.com, kirill.shutemov@linux.intel.com, sjenning@linux.vnet.ibm.com, darrick.wong@oracle.com
List-Id: linux-next.vger.kernel.org

On Thu, Dec 5, 2013 at 1:00 AM, David Rientjes <rientjes@google.com> wrote:
> On Wed, 4 Dec 2013, Sima Baymani wrote:
>
>> When generating randconfig, got following warning:
>>
>> warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY) selects PROC_PAGE_MONITOR
>> which has unmet direct dependencies (PROC_FS && MMU)
>>
>> I would have liked to form a patch for it, but not sure whether to
>> simply add PROC_FS && MMU as dependencies for HWPOISON_INJECT and
>> MEM_SOFT_DIRTY, or if some other fix would be more suitable?
>>
>
> CONFIG_HWPOISON_INJECT is unrelated, it already depends on CONFIG_PROC_FS.
>
> CONFIG_PROC_PAGE_MONITOR is obviously only useful for CONFIG_PROC_FS, so
> the correct fix would be to make CONFIG_MEM_SOFT_DIRTY depend on
> CONFIG_PROC_FS.
>
> Want to try sending a patch?

You bet!

However, I have the slightest confusion:
I tested what you suggested by running "make oldconfig", and it does
eliminate the error. However, I can't figure out why it's enough with
adding the dependency for PROC_FS in MEM_SOFT_DIRTY, if
PROC_PAGE_MONITOR depends on both?

-Sima

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
