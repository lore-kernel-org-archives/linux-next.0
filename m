From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm-ppc tree
Date: Fri, 7 Apr 2017 16:37:01 +1000
Message-ID: <20170407163701.54171e6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54515 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752098AbdDGGhE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 02:37:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bin Lu <lblulb@linux.vnet.ibm.com>

Hi Paul,

After merging the kvm-ppc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kvm/fpu.o:(.opd+0x0): multiple definition of `fps_fres'
arch/powerpc/kvm/fpu.o:(.opd+0x0): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fres':
(.text+0x0): multiple definition of `.fps_fres'
arch/powerpc/kvm/fpu.o:(.text+0x0): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x18): multiple definition of `fps_frsqrte'
arch/powerpc/kvm/fpu.o:(.opd+0x18): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_frsqrte':
(.text+0x20): multiple definition of `.fps_frsqrte'
arch/powerpc/kvm/fpu.o:(.text+0x20): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x30): multiple definition of `fps_fsqrts'
arch/powerpc/kvm/fpu.o:(.opd+0x30): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fsqrts':
(.text+0x40): multiple definition of `.fps_fsqrts'
arch/powerpc/kvm/fpu.o:(.text+0x40): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x48): multiple definition of `fps_fadds'
arch/powerpc/kvm/fpu.o:(.opd+0x48): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fadds':
(.text+0x60): multiple definition of `.fps_fadds'
arch/powerpc/kvm/fpu.o:(.text+0x60): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x60): multiple definition of `fps_fdivs'
arch/powerpc/kvm/fpu.o:(.opd+0x60): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fdivs':
(.text+0x84): multiple definition of `.fps_fdivs'
arch/powerpc/kvm/fpu.o:(.text+0x84): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x78): multiple definition of `fps_fmuls'
arch/powerpc/kvm/fpu.o:(.opd+0x78): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fmuls':
(.text+0xa8): multiple definition of `.fps_fmuls'
arch/powerpc/kvm/fpu.o:(.text+0xa8): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x90): multiple definition of `fps_fsubs'
arch/powerpc/kvm/fpu.o:(.opd+0x90): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fsubs':
(.text+0xcc): multiple definition of `.fps_fsubs'
arch/powerpc/kvm/fpu.o:(.text+0xcc): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0xa8): multiple definition of `fps_fmadds'
arch/powerpc/kvm/fpu.o:(.opd+0xa8): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fmadds':
(.text+0xf0): multiple definition of `.fps_fmadds'
arch/powerpc/kvm/fpu.o:(.text+0xf0): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0xc0): multiple definition of `fps_fmsubs'
arch/powerpc/kvm/fpu.o:(.opd+0xc0): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fmsubs':
(.text+0x118): multiple definition of `.fps_fmsubs'
arch/powerpc/kvm/fpu.o:(.text+0x118): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0xd8): multiple definition of `fps_fnmadds'
arch/powerpc/kvm/fpu.o:(.opd+0xd8): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fnmadds':
(.text+0x140): multiple definition of `.fps_fnmadds'
arch/powerpc/kvm/fpu.o:(.text+0x140): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0xf0): multiple definition of `fps_fnmsubs'
arch/powerpc/kvm/fpu.o:(.opd+0xf0): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fnmsubs':
(.text+0x168): multiple definition of `.fps_fnmsubs'
arch/powerpc/kvm/fpu.o:(.text+0x168): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x108): multiple definition of `fps_fsel'
arch/powerpc/kvm/fpu.o:(.opd+0x108): first defined here
arch/powerpc/kvm/fpu.o: In function `fps_fsel':
(.text+0x190): multiple definition of `.fps_fsel'
arch/powerpc/kvm/fpu.o:(.text+0x190): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x120): multiple definition of `fpd_fsqrts'
arch/powerpc/kvm/fpu.o:(.opd+0x120): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fsqrts':
(.text+0x1f0): multiple definition of `.fpd_fsqrts'
arch/powerpc/kvm/fpu.o:(.text+0x1f0): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x138): multiple definition of `fpd_frsqrtes'
arch/powerpc/kvm/fpu.o:(.opd+0x138): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_frsqrtes':
(.text+0x204): multiple definition of `.fpd_frsqrtes'
arch/powerpc/kvm/fpu.o:(.text+0x204): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x150): multiple definition of `fpd_fres'
arch/powerpc/kvm/fpu.o:(.opd+0x150): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fres':
(.text+0x218): multiple definition of `.fpd_fres'
arch/powerpc/kvm/fpu.o:(.text+0x218): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x168): multiple definition of `fpd_frsp'
arch/powerpc/kvm/fpu.o:(.opd+0x168): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_frsp':
(.text+0x22c): multiple definition of `.fpd_frsp'
arch/powerpc/kvm/fpu.o:(.text+0x22c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x180): multiple definition of `fpd_fctiw'
arch/powerpc/kvm/fpu.o:(.opd+0x180): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fctiw':
(.text+0x240): multiple definition of `.fpd_fctiw'
arch/powerpc/kvm/fpu.o:(.text+0x240): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x198): multiple definition of `fpd_fctiwz'
arch/powerpc/kvm/fpu.o:(.opd+0x198): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fctiwz':
(.text+0x254): multiple definition of `.fpd_fctiwz'
arch/powerpc/kvm/fpu.o:(.text+0x254): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x1b0): multiple definition of `fpd_fsqrt'
arch/powerpc/kvm/fpu.o:(.opd+0x1b0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fsqrt':
(.text+0x268): multiple definition of `.fpd_fsqrt'
arch/powerpc/kvm/fpu.o:(.text+0x268): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x1c8): multiple definition of `fpd_fre'
arch/powerpc/kvm/fpu.o:(.opd+0x1c8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fre':
(.text+0x27c): multiple definition of `.fpd_fre'
arch/powerpc/kvm/fpu.o:(.text+0x27c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x1e0): multiple definition of `fpd_frsqrte'
arch/powerpc/kvm/fpu.o:(.opd+0x1e0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_frsqrte':
(.text+0x290): multiple definition of `.fpd_frsqrte'
arch/powerpc/kvm/fpu.o:(.text+0x290): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x1f8): multiple definition of `fpd_fneg'
arch/powerpc/kvm/fpu.o:(.opd+0x1f8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fneg':
(.text+0x2a4): multiple definition of `.fpd_fneg'
arch/powerpc/kvm/fpu.o:(.text+0x2a4): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x210): multiple definition of `fpd_fabs'
arch/powerpc/kvm/fpu.o:(.opd+0x210): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fabs':
(.text+0x2b8): multiple definition of `.fpd_fabs'
arch/powerpc/kvm/fpu.o:(.text+0x2b8): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x228): multiple definition of `fpd_fadds'
arch/powerpc/kvm/fpu.o:(.opd+0x228): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fadds':
(.text+0x2cc): multiple definition of `.fpd_fadds'
arch/powerpc/kvm/fpu.o:(.text+0x2cc): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x240): multiple definition of `fpd_fsubs'
arch/powerpc/kvm/fpu.o:(.opd+0x240): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fsubs':
(.text+0x2e0): multiple definition of `.fpd_fsubs'
arch/powerpc/kvm/fpu.o:(.text+0x2e0): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x258): multiple definition of `fpd_fdivs'
arch/powerpc/kvm/fpu.o:(.opd+0x258): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fdivs':
(.text+0x2f4): multiple definition of `.fpd_fdivs'
arch/powerpc/kvm/fpu.o:(.text+0x2f4): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x270): multiple definition of `fpd_fmuls'
arch/powerpc/kvm/fpu.o:(.opd+0x270): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmuls':
(.text+0x308): multiple definition of `.fpd_fmuls'
arch/powerpc/kvm/fpu.o:(.text+0x308): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x288): multiple definition of `fpd_fcmpu'
arch/powerpc/kvm/fpu.o:(.opd+0x288): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fcmpu':
(.text+0x31c): multiple definition of `.fpd_fcmpu'
arch/powerpc/kvm/fpu.o:(.text+0x31c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x2a0): multiple definition of `fpd_fcpsgn'
arch/powerpc/kvm/fpu.o:(.opd+0x2a0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fcpsgn':
(.text+0x34c): multiple definition of `.fpd_fcpsgn'
arch/powerpc/kvm/fpu.o:(.text+0x34c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x2b8): multiple definition of `fpd_fdiv'
arch/powerpc/kvm/fpu.o:(.opd+0x2b8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fdiv':
(.text+0x360): multiple definition of `.fpd_fdiv'
arch/powerpc/kvm/fpu.o:(.text+0x360): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x2d0): multiple definition of `fpd_fadd'
arch/powerpc/kvm/fpu.o:(.opd+0x2d0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fadd':
(.text+0x374): multiple definition of `.fpd_fadd'
arch/powerpc/kvm/fpu.o:(.text+0x374): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x2e8): multiple definition of `fpd_fmul'
arch/powerpc/kvm/fpu.o:(.opd+0x2e8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmul':
(.text+0x388): multiple definition of `.fpd_fmul'
arch/powerpc/kvm/fpu.o:(.text+0x388): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x300): multiple definition of `fpd_fcmpo'
arch/powerpc/kvm/fpu.o:(.opd+0x300): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fcmpo':
(.text+0x39c): multiple definition of `.fpd_fcmpo'
arch/powerpc/kvm/fpu.o:(.text+0x39c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x318): multiple definition of `fpd_fsub'
arch/powerpc/kvm/fpu.o:(.opd+0x318): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fsub':
(.text+0x3cc): multiple definition of `.fpd_fsub'
arch/powerpc/kvm/fpu.o:(.text+0x3cc): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x330): multiple definition of `fpd_fmsubs'
arch/powerpc/kvm/fpu.o:(.opd+0x330): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmsubs':
(.text+0x3e0): multiple definition of `.fpd_fmsubs'
arch/powerpc/kvm/fpu.o:(.text+0x3e0): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x348): multiple definition of `fpd_fmadds'
arch/powerpc/kvm/fpu.o:(.opd+0x348): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmadds':
(.text+0x3f4): multiple definition of `.fpd_fmadds'
arch/powerpc/kvm/fpu.o:(.text+0x3f4): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x360): multiple definition of `fpd_fnmsubs'
arch/powerpc/kvm/fpu.o:(.opd+0x360): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fnmsubs':
(.text+0x408): multiple definition of `.fpd_fnmsubs'
arch/powerpc/kvm/fpu.o:(.text+0x408): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x378): multiple definition of `fpd_fnmadds'
arch/powerpc/kvm/fpu.o:(.opd+0x378): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fnmadds':
(.text+0x41c): multiple definition of `.fpd_fnmadds'
arch/powerpc/kvm/fpu.o:(.text+0x41c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x390): multiple definition of `fpd_fsel'
arch/powerpc/kvm/fpu.o:(.opd+0x390): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fsel':
(.text+0x430): multiple definition of `.fpd_fsel'
arch/powerpc/kvm/fpu.o:(.text+0x430): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x3a8): multiple definition of `fpd_fmsub'
arch/powerpc/kvm/fpu.o:(.opd+0x3a8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmsub':
(.text+0x444): multiple definition of `.fpd_fmsub'
arch/powerpc/kvm/fpu.o:(.text+0x444): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x3c0): multiple definition of `fpd_fmadd'
arch/powerpc/kvm/fpu.o:(.opd+0x3c0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fmadd':
(.text+0x458): multiple definition of `.fpd_fmadd'
arch/powerpc/kvm/fpu.o:(.text+0x458): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x3d8): multiple definition of `fpd_fnmsub'
arch/powerpc/kvm/fpu.o:(.opd+0x3d8): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fnmsub':
(.text+0x46c): multiple definition of `.fpd_fnmsub'
arch/powerpc/kvm/fpu.o:(.text+0x46c): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x3f0): multiple definition of `fpd_fnmadd'
arch/powerpc/kvm/fpu.o:(.opd+0x3f0): first defined here
arch/powerpc/kvm/fpu.o: In function `fpd_fnmadd':
(.text+0x480): multiple definition of `.fpd_fnmadd'
arch/powerpc/kvm/fpu.o:(.text+0x480): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x408): multiple definition of `kvm_cvt_fd'
arch/powerpc/kvm/fpu.o:(.opd+0x408): first defined here
arch/powerpc/kvm/fpu.o: In function `kvm_cvt_fd':
(.text+0x494): multiple definition of `.kvm_cvt_fd'
arch/powerpc/kvm/fpu.o:(.text+0x494): first defined here
arch/powerpc/kvm/fpu.o:(.opd+0x420): multiple definition of `kvm_cvt_df'
arch/powerpc/kvm/fpu.o:(.opd+0x420): first defined here
arch/powerpc/kvm/fpu.o: In function `kvm_cvt_df':
(.text+0x4a0): multiple definition of `.kvm_cvt_df'
arch/powerpc/kvm/fpu.o:(.text+0x4a0): first defined here

Caused by commit

  f8513214ac9d ("KVM: PPC: Book3S: Add MMIO emulation for FP and VSX instructions")

I have reverted that commit (and the following three commits) for today.

-- 
Cheers,
Stephen Rothwell
