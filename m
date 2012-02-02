From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Feb 1 (mce_amd.c)
Date: Thu, 02 Feb 2012 09:53:03 -0800
Message-ID: <4F2ACD7F.2020506@xenotime.net>
References: <20120201171643.cbf8263eded709a75e92f4ad@canb.auug.org.au> <4F298A6C.6010101@xenotime.net> <20120202142628.GA1052@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120202142628.GA1052@aftab>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@amd64.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 02/02/2012 06:26 AM, Borislav Petkov wrote:
> On Wed, Feb 01, 2012 at 10:54:36AM -0800, Randy Dunlap wrote:
>> On 01/31/2012 10:16 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20120131:
>>
>>
>> mce_amd.c:(.cpuinit.text+0x4723): undefined reference to `cpu_llc_shared_map'
> 
> Yeah, -rc2 has that problem too with your randconfig. The issue is with
> CONFIG_SMP not being set.
> 
> The following chunk should cure it:


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> --
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5bed94e..63fcb8a 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -897,7 +897,7 @@ config X86_MCE_INTEL
>  config X86_MCE_AMD
>  	def_bool y
>  	prompt "AMD MCE features"
> -	depends on X86_MCE && X86_LOCAL_APIC
> +	depends on X86_MCE && X86_LOCAL_APIC && SMP
>  	---help---
>  	   Additional support for AMD specific MCE features such as
>  	   the DRAM Error Threshold.
> --
> 
> Thanks.
> 


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
