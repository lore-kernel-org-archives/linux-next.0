From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 18
Date: Thu, 18 Oct 2018 08:29:42 -0700
Message-ID: <20181018152942.GA5540@roeck-us.net>
References: <20181018180216.25e6fb79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181018180216.25e6fb79@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Joel Fernandes <joel@joelfernandes.org>, Hannes Reinecke <hare@suse.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Trond Myklebust <trond.myklebust@hammerspace.com>, Jens Axboe <axboe@kernel.dk>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 18, 2018 at 06:02:16PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> News: I will not be doing linux-next releases next week.  Unfortunately
> this will probably be the first week of the merge window. :-(
> 

Note: Every individual on Cc: might want to have a look. Either one of
your patches or one you approved causes at least one of the problems.

Build results:
	total: 135 pass: 120 fail: 15
Failed builds: 
	alpha:allmodconfig 
	arm:allmodconfig 
	arm64:allmodconfig 
	i386:allyesconfig 
	i386:allmodconfig 
	m68k:allmodconfig 
	mips:allmodconfig 
	nds32:allmodconfig 
	parisc:allmodconfig 
	powerpc:allmodconfig 
	powerpc:ppc6xx_defconfig
	s390:allmodconfig 
	sh:dreamcast_defconfig 
	sparc64:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 318 pass: 318 fail: 0

Build failures:

allmodconfig for all architectures:

fs/pstore/platform.o: In function `pstore_compression_late_init':
fs/pstore/.tmp_platform.o:(.init.text+0x0): multiple definition of `init_module'
fs/pstore/inode.o:(.init.text+0x0): first defined here

i386 (and probably other 32-bit builds):

ERROR: "__udivdi3" [drivers/scsi/myrs.ko] undefined!

powerpc:ppc6xx_defconfig:

net/sunrpc/auth_gss/gss_krb5_seal.c: In function 'gss_seq_send64_fetch_and_inc':
net/sunrpc/auth_gss/gss_krb5_seal.c:144:14: error: implicit declaration of function 'cmpxchg64'

sh:dreamcast_defconfig:

drivers/cdrom/gdrom.c: In function 'probe_gdrom':
drivers/cdrom/gdrom.c:797:3: error: 'rc' undeclared

Guenter
