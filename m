From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 6 (MTD)
Date: Tue, 06 Jan 2009 08:29:15 -0800
Message-ID: <496386DB.8090606@oracle.com>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754791AbZAFQ3r@vger.kernel.org>
In-Reply-To: <20090106182311.525e4b14.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Korolev Alexey <akorolev@infradead.org>, Vasiliy Leonenko <vasiliy.leonenko@gmail.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> This tree will not build a powerpc ppc4xx_defconfig due to a kvm problem.
> 
> Changes since 20090105:
> 
> New tree:
> 	squashfs
> 
> Undropped tree:
> 	usb
> 	staging
> 
> Dropped trees (temporarily):
> 	rr (build problem)
> 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> 	cpu_alloc (build problem)
> 	audit (difficult conflicts)
> 
> 
> The mtd tree lost 3 conflicts.

drivers/built-in.o: In function `lpddr_probe':
(.text+0x95ddc): undefined reference to `lpddr_cmdset'

with
# CONFIG_MTD_LPDDR is not set
CONFIG_MTD_QINFO_PROBE=y

There appears to be too little control/coordination between those
two kconfig symbols.  Surely one of them (MTD_QINFO_PROBE) should
depend on the other (MTD_LPDDR).  And why even build 2 modules
when MTD_QINFO_PROBE is enabled?  Why not combine the code into
one module?


-- 
~Randy
