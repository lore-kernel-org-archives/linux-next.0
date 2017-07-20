From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Thu, 20 Jul 2017 14:12:03 +1000
Message-ID: <20170720141203.53dff686@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the char-misc tree, yesterday's linux-next build (i386
defconfig) produced this warning:

In file included from /home/sfr/next/next/arch/x86/entry/vdso/vma.c:25:0:
/home/sfr/next/next/arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]  
 static inline hyperv_cleanup(void) {}
               ^

Introduced by commit

  2e252fbf777d ("x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set")

-- 
Cheers,
Stephen Rothwell
