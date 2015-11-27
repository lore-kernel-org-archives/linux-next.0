From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the modules tree
Date: Fri, 27 Nov 2015 12:26:23 +1100
Message-ID: <20151127122623.06c052fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Rusty,

After merging the modules tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/kexec.h:26:0,
                 from include/linux/crash_dump.h:5,
                 from arch/powerpc/platforms/powernv/pci-ioda.c:16:
include/linux/module.h:770:15: error: return type defaults to 'int' [-Werror=return-type]
 static inline module_enable_ro(const struct module *mod) { }
               ^

and many many more of these :-(

Caused by commit

  ccd6497a60e5 ("module: clean up RO/NX handling")

I have used the modules tree from next-20151126 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
