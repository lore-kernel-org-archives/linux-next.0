From: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 24 Nov 2016 13:02:39 -0200
Message-ID: <9443137.1vHEJqnA2s@morokweng>
References: <20161124160151.20206af7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20161124160151.20206af7@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

Hello Stephen,

Am Donnerstag, 24. November 2016, 16:01:51 BRST schrieb Stephen Rothwell:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> powerpc-linux-ld: unrecognized option '--no-dynamic-linker'
> 
> Caused by patch
> 
>   "powerpc: add purgatory for kexec_file_load implementation"
> 

Sorry about that. --no-dynamic-linker was added in binutils 2.26.
The patch below fixes the problem.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center


diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 2dfb53ac9944..cf6e78b9af86 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -6,8 +6,10 @@ purgatory-y := purgatory.o string.o v2wrap.o purgatory-ppc64.o crtsavres.o \
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 
-LDFLAGS_purgatory.ro := -pie --no-dynamic-linker -e purgatory_start \
-			--no-undefined -nostartfiles -nostdlib -nodefaultlibs
+LDFLAGS_purgatory.ro := -pie -e purgatory_start --no-undefined -nostartfiles \
+			-nostdlib -nodefaultlibs
+LDFLAGS_purgatory.ro += $(call ld-option, --no-dynamic-linker)
+
 targets += purgatory.ro
 
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE), $(KBUILD_CFLAGS))
