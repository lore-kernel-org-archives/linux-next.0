From: Guenter Roeck <linux@roeck-us.net>
Subject: linux-next: New build failures in Sep 25 tree
Date: Thu, 25 Sep 2014 13:25:59 -0700
Message-ID: <20140925202559.GA1750@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Build results:
	total: 133 pass: 115 fail: 18
=46ailed builds:
	alpha:defconfig
	alpha:allmodconfig
	arc:defconfig
	i386:allyesconfig
	i386:allmodconfig
	m68k:allmodconfig
	mips:allmodconfig
	openrisc:defconfig
	powerpc:cell_defconfig
	powerpc:ppc6xx_defconfig
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	powerpc:cell_defconfig
	powerpc:ppc6xx_defconfig
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	tile:tilegx_defconfig
	xtensa:allmodconfig

---

New build failures:

---
arc:defconfig

arch/arc/kernel/setup.c: In function 'customize_machine':
arch/arc/kernel/setup.c:354: error: implicit declaration of function 'o=
f_clk_init'

---
mips:allmodconfig

arch/mips/net/bpf_jit.c: In function 'build_body':
arch/mips/net/bpf_jit.c:762:6: error: unused variable 'tmp' [-Werror=3D=
unused-variable]

---
openrisc-defconfig

In file included from arch/openrisc/kernel/signal.c:31:0:
=2E/arch/openrisc/include/asm/syscall.h: In function 'syscall_get_arch'=
:
=2E/arch/openrisc/include/asm/syscall.h:77:9: error: 'EM_OPENRISC' unde=
clared

---
tile:defconfig

In file included from sound/pci/cs46xx/dsp_spos.c:25:0:
include/linux/pm.h: In function =E2=80=98dev_pm_domain_attach=E2=80=99:
include/linux/pm.h:631:10: error: =E2=80=98ENODEV=E2=80=99 undeclared
make[3]: *** [sound/pci/cs46xx/dsp_spos.o] Error 1

---

Guenter
