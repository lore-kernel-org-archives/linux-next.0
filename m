From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 25 (efi_64.c)
Date: Mon, 25 Jun 2018 09:19:29 -0700
Message-ID: <c75cfdf9-fc2c-52c3-81a4-8584923b85a7@infradead.org>
References: <20180625154317.7a55dd19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625154317.7a55dd19@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/24/2018 10:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180622:
> 

on x86_64: (randconfig)

  CC      arch/x86/platform/efi/efi_64.o
In file included from ../include/linux/kernel.h:10:0,
                 from ../arch/x86/platform/efi/efi_64.c:21:
../arch/x86/platform/efi/efi_64.c: In function 'efi_sync_low_kernel_mappings':
../include/linux/compiler.h:319:20: error: call to '__compiletime_assert_277' declared with attribute error: BUILD_BUG_ON failed: p4d_index(EFI_VA_END) != p4d_index(MODULES_END)
    prefix ## suffix();    \
                    ^
../include/linux/compiler.h:327:2: note: in expansion of macro '__compiletime_assert'
  __compiletime_assert(condition, msg, prefix, suffix)
  ^
../include/linux/compiler.h:339:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
../include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
../include/linux/build_bug.h:69:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^
../arch/x86/platform/efi/efi_64.c:277:2: note: in expansion of macro 'BUILD_BUG_ON'
  BUILD_BUG_ON(p4d_index(EFI_VA_END) != p4d_index(MODULES_END));
  ^
../scripts/Makefile.build:317: recipe for target 'arch/x86/platform/efi/efi_64.o' failed
make[4]: *** [arch/x86/platform/efi/efi_64.o] Error 1



-- 
~Randy
