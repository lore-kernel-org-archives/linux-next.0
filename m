From: Borislav Petkov <bp@amd64.org>
Subject: Re: linux-next: Tree for Feb 1 (mce_amd.c)
Date: Thu, 2 Feb 2012 15:26:28 +0100
Message-ID: <20120202142628.GA1052@aftab>
References: <20120201171643.cbf8263eded709a75e92f4ad@canb.auug.org.au>
 <4F298A6C.6010101@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F298A6C.6010101@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, Borislav Petkov <bp@amd64.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 01, 2012 at 10:54:36AM -0800, Randy Dunlap wrote:
> On 01/31/2012 10:16 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20120131:
> 
> 
> mce_amd.c:(.cpuinit.text+0x4723): undefined reference to `cpu_llc_shared_map'

Yeah, -rc2 has that problem too with your randconfig. The issue is with
CONFIG_SMP not being set.

The following chunk should cure it:

--
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5bed94e..63fcb8a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -897,7 +897,7 @@ config X86_MCE_INTEL
 config X86_MCE_AMD
 	def_bool y
 	prompt "AMD MCE features"
-	depends on X86_MCE && X86_LOCAL_APIC
+	depends on X86_MCE && X86_LOCAL_APIC && SMP
 	---help---
 	   Additional support for AMD specific MCE features such as
 	   the DRAM Error Threshold.
--

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
