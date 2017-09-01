From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2017-08-31-16-13 uploaded (x86/kernel/eisa.c)
Date: Thu, 31 Aug 2017 22:11:11 -0700
Message-ID: <43a5f1af-2135-191e-4640-9f9cc50b34ca@infradead.org>
References: <59a8982c.FwLJY62HB+esikOu%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59a8982c.FwLJY62HB+esikOu%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

On 08/31/17 16:13, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2017-08-31-16-13 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.


from linux-next.patch:

on i386:

  CC      arch/x86/kernel/eisa.o
../arch/x86/kernel/eisa.c: In function 'eisa_bus_probe':
../arch/x86/kernel/eisa.c:11:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
  void __iomem *p = ioremap(0x0FFFD9, 4);
  ^
../arch/x86/kernel/eisa.c:11:20: warning: initialization makes pointer from integer without a cast [enabled by default]
  void __iomem *p = ioremap(0x0FFFD9, 4);
                    ^
../arch/x86/kernel/eisa.c:13:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
  if (readl(p) == 'E' + ('I'<<8) + ('S'<<16) + ('A'<<24))
  ^
../arch/x86/kernel/eisa.c:15:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
  iounmap(p);
  ^




-- 
~Randy
