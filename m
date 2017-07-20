From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 19 (drivers/sfi)
Date: Wed, 19 Jul 2017 17:08:13 -0700
Message-ID: <219ef40d-029a-bad0-1926-f6f332b581f8@infradead.org>
References: <20170719145410.3f527a45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719145410.3f527a45@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: linux-next.vger.kernel.org

On 07/18/2017 09:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170718:
> 

on i386:

../drivers/sfi/sfi_core.c: In function 'sfi_map_memory':
../drivers/sfi/sfi_core.c:104:3: error: implicit declaration of function 'memremap' [-Werror=implicit-function-declaration]
   return memremap(phys, size, MEMREMAP_WB);
   ^
../drivers/sfi/sfi_core.c:104:31: error: 'MEMREMAP_WB' undeclared (first use in this function)
   return memremap(phys, size, MEMREMAP_WB);
                               ^
../drivers/sfi/sfi_core.c:104:31: note: each undeclared identifier is reported only once for each function it appears in
../drivers/sfi/sfi_core.c: In function 'sfi_unmap_memory':
../drivers/sfi/sfi_core.c:115:3: error: implicit declaration of function 'memunmap' [-Werror=implicit-function-declaration]
   memunmap(virt);
   ^
../drivers/sfi/sfi_core.c: In function 'sfi_map_memory':
../drivers/sfi/sfi_core.c:107:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^



-- 
~Randy
