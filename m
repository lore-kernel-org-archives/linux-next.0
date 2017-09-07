From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Fri, 8 Sep 2017 09:25:45 +1000
Message-ID: <20170908092545.15179b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Dmitry V. Levin" <ldv@altlinux.org>
List-Id: linux-next.vger.kernel.org

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/signal.c: In function 'C_SYSC_rt_sigaction':
kernel/signal.c:3405:19: warning: unused variable 'mask' [-Wunused-variable]
   compat_sigset_t mask;
                   ^

Introduced by commit

  fc271087ebcb ("signal: replace sigset_to_compat() with put_compat_sigset()")

-- 
Cheers,
Stephen Rothwell
