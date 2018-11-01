From: Eial Czerwacki <eial@scalemp.com>
Subject: Re: [PATCH] x86/build: Build VSMP support only if selected
Date: Thu, 1 Nov 2018 15:10:35 +0200
Message-ID: <a8f2ac8e-45dc-1c12-e888-6ad880b1306f@scalemp.com>
References: <20181030230905.xHZmM%akpm@linux-foundation.org>
 <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org>
 <alpine.DEB.2.21.1811011032190.1642@nanos.tec.linutronix.de>
 <SN6PR15MB2366D7688B41535AF0A331F9C3CE0@SN6PR15MB2366.namprd15.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <SN6PR15MB2366D7688B41535AF0A331F9C3CE0@SN6PR15MB2366.namprd15.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: "Shai Fultheim (Shai@ScaleMP.com)" <Shai@ScaleMP.com>, Andrew Morton <akpm@linux-foundation.org>, "broonie@kernel.org" <broonie@kernel.org>, "mhocko@suse.cz" <mhocko@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>, X86 ML <x86@kernel.org>, 'Oren Twaig' <oren@scalemp.com>
List-Id: linux-next.vger.kernel.org

Greetings,

On 11/01/2018 12:39 PM, Shai Fultheim (Shai@ScaleMP.com) wrote:
> On 01/11/18 11:37, Thomas Gleixner wrote:
> 
>> VSMP support is built even if CONFIG_X86_VSMP is not set. This leads to a build
>> breakage when CONFIG_PCI is disabled as well.
>>
>> Build VSMP code only when selected.
> 
> This patch disables detect_vsmp_box() on systems without CONFIG_X86_VSMP, due to
> the recent 6da63eb241a05b0e676d68975e793c0521387141.  This is significant
> regression that will affect significant number of deployments.
> 
> We will reply shortly with an updated patch that fix the dependency on pv_irq_ops,
> and revert to CONFIG_PARAVIRT, with proper protection for CONFIG_PCI.
> 

here is the proper patch which fixes the issue on hand:
>From ebff534f8cfa55d7c3ab798c44abe879f3fbe2b8 Mon Sep 17 00:00:00 2001
From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 1 Nov 2018 15:08:32 +0200
Subject: [PATCH] x86/build: Build VSMP support only if CONFIG_PCI is
selected

vsmp dependency of pv_irq_ops removed some years ago, so now let's clean
it up from vsmp_64.c.

In short, "cap & ctl & (1 << 4)" was always returning 0, as such we can
remove all the PARAVIRT/PARAVIRT_XXL code handling that.

However, the rest of the code depends on CONFIG_PCI, so fix it accordingly.

Signed-off-by: Eial Czerwacki <eial@scalemp.com>
Acked-by: Shai Fultheim <shai@scalemp.com>
---
 arch/x86/Kconfig          |  1 -
 arch/x86/kernel/vsmp_64.c | 80
+++--------------------------------------------
 2 files changed, 5 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index c51c989..4b187ca 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -524,7 +524,6 @@ config X86_VSMP
        bool "ScaleMP vSMP"
        select HYPERVISOR_GUEST
        select PARAVIRT
-       select PARAVIRT_XXL
        depends on X86_64 && PCI
        depends on X86_EXTENDED_PLATFORM
        depends on SMP
diff --git a/arch/x86/kernel/vsmp_64.c b/arch/x86/kernel/vsmp_64.c
index 1eae5af..c6d2b76 100644
--- a/arch/x86/kernel/vsmp_64.c
+++ b/arch/x86/kernel/vsmp_64.c
@@ -26,64 +26,7 @@

 #define TOPOLOGY_REGISTER_OFFSET 0x10

-#if defined CONFIG_PCI && defined CONFIG_PARAVIRT_XXL
-/*
- * Interrupt control on vSMPowered systems:
- * ~AC is a shadow of IF.  If IF is 'on' AC should be 'off'
- * and vice versa.
- */
-
-asmlinkage __visible unsigned long vsmp_save_fl(void)
-{
-       unsigned long flags = native_save_fl();
-
-       if (!(flags & X86_EFLAGS_IF) || (flags & X86_EFLAGS_AC))
-               flags &= ~X86_EFLAGS_IF;
-       return flags;
-}
-PV_CALLEE_SAVE_REGS_THUNK(vsmp_save_fl);
-
-__visible void vsmp_restore_fl(unsigned long flags)
-{
-       if (flags & X86_EFLAGS_IF)
-               flags &= ~X86_EFLAGS_AC;
-       else
-               flags |= X86_EFLAGS_AC;
-       native_restore_fl(flags);
-}
-PV_CALLEE_SAVE_REGS_THUNK(vsmp_restore_fl);
-
-asmlinkage __visible void vsmp_irq_disable(void)
-{
-       unsigned long flags = native_save_fl();
-
-       native_restore_fl((flags & ~X86_EFLAGS_IF) | X86_EFLAGS_AC);
-}
-PV_CALLEE_SAVE_REGS_THUNK(vsmp_irq_disable);
-
-asmlinkage __visible void vsmp_irq_enable(void)
-{
-       unsigned long flags = native_save_fl();
-
-       native_restore_fl((flags | X86_EFLAGS_IF) & (~X86_EFLAGS_AC));
-}
-PV_CALLEE_SAVE_REGS_THUNK(vsmp_irq_enable);
-
-static unsigned __init vsmp_patch(u8 type, void *ibuf,
-                                 unsigned long addr, unsigned len)
-{
-       switch (type) {
-       case PARAVIRT_PATCH(irq.irq_enable):
-       case PARAVIRT_PATCH(irq.irq_disable):
-       case PARAVIRT_PATCH(irq.save_fl):
-       case PARAVIRT_PATCH(irq.restore_fl):
-               return paravirt_patch_default(type, ibuf, addr, len);
-       default:
-               return native_patch(type, ibuf, addr, len);
-       }
-
-}
-
+#if defined CONFIG_PCI
 static void __init set_vsmp_pv_ops(void)
 {
        void __iomem *address;
@@ -109,28 +52,12 @@ static void __init set_vsmp_pv_ops(void)
        }
 #endif

-       if (cap & ctl & (1 << 4)) {
-               /* Setup irq ops and turn on vSMP  IRQ fastpath handling */
-               pv_ops.irq.irq_disable = PV_CALLEE_SAVE(vsmp_irq_disable);
-               pv_ops.irq.irq_enable = PV_CALLEE_SAVE(vsmp_irq_enable);
-               pv_ops.irq.save_fl = PV_CALLEE_SAVE(vsmp_save_fl);
-               pv_ops.irq.restore_fl = PV_CALLEE_SAVE(vsmp_restore_fl);
-               pv_ops.init.patch = vsmp_patch;
-               ctl &= ~(1 << 4);
-       }
        writel(ctl, address + 4);
        ctl = readl(address + 4);
        pr_info("vSMP CTL: control set to:0x%08x\n", ctl);

        early_iounmap(address, 8);
 }
-#else
-static void __init set_vsmp_pv_ops(void)
-{
-}
-#endif
-
-#ifdef CONFIG_PCI
 static int is_vsmp = -1;

 static void __init detect_vsmp_box(void)
@@ -164,11 +91,14 @@ static int is_vsmp_box(void)
 {
        return 0;
 }
+static void __init set_vsmp_pv_ops(void)
+{
+}
 #endif

 static void __init vsmp_cap_cpus(void)
 {
-#if !defined(CONFIG_X86_VSMP) && defined(CONFIG_SMP)
+#if !defined(CONFIG_X86_VSMP) && defined(CONFIG_SMP) && defined(CONFIG_PCI)
        void __iomem *address;
        unsigned int cfg, topology, node_shift, maxcpus;

-- 
2.7.4
