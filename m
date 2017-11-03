From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2017-11-03-13-00 uploaded
Date: Fri, 3 Nov 2017 15:41:35 -0700
Message-ID: <7137ff17-e194-2896-f471-91395b447f59@infradead.org>
References: <59fccb0b.sRkbr0rZ7jKYyY01%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <59fccb0b.sRkbr0rZ7jKYyY01%akpm@linux-foundation.org>
Content-Language: en-US
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/03/2017 01:01 PM, akpm@linux-foundation.org wrote:
> 
> This mmotm tree contains the following patches against 4.14-rc7:
> (patches marked "*" will be included in linux-next)
> 
>   origin.patch
origin.patch has a problem.  When CONFIG_SMP is not enabled (on x86_64 e.g.):

-	if (cpu_has(c, X86_FEATURE_TSC))
+	if (cpu_has(c, X86_FEATURE_TSC)) {
+		unsigned int freq = arch_freq_get_on_cpu(cpu);


arch/x86/kernel/cpu/proc.o: In function `show_cpuinfo':
proc.c:(.text+0x13d): undefined reference to `arch_freq_get_on_cpu'
/local/lnx/mmotm/mmotm-2017-1103-1300/Makefile:994: recipe for target 'vmlinux' failed


-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
