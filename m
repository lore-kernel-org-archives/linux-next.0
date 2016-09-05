From: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 05 Sep 2016 14:49:12 -0300
Message-ID: <8826558.sWXQPuNUpI@hactar>
References: <20160905191917.4ca6dd56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160905191917.4ca6dd56@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Montag, 05 September 2016, 19:19:17 schrieb Stephen Rothwell:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> powerpc-linux-ld: arch/powerpc/purgatory/purgatory.o: compiled for a big
> endian system and target is little endian powerpc-linux-ld: failed to
> merge target specific data of file arch/powerpc/purgatory/purgatory.o
> powerpc-linux-ld: arch/powerpc/purgatory/printf.o: compiled for a big
> endian system and target is little endian powerpc-linux-ld: failed to
> merge target specific data of file arch/powerpc/purgatory/printf.o
> 
> and so on ...
> 
> Presumably caused by commit
> 
>   b26db279958b ("powerpc: add purgatory for kexec_file_load
> implementation")
> 
> I added this patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 5 Sep 2016 19:12:42 +1000
> Subject: [PATCH] disable KEXEC_FILE on powerpc for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 41300c3a1bfe..86ea07d7ead2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -467,6 +467,7 @@ config KEXEC_FILE
>  	depends on PPC64
>  	depends on CRYPTO=y
>  	depends on CRYPTO_SHA256=y
> +	depends on BROKEN
>  	help
>  	  This is a new version of the kexec system call. This call is
>  	  file based and takes in file descriptors as system call arguments


Sorry about that. The change below to arch/powerpc/purgatory/Makefile
fixes the cross build from ppc64 BE to ppc64 LE.

I also noticed that building the purgatory during archprepare is not necessary,
so I also made the change below to arch/powerpc/Makefile.

I'm preparing a v8 of the kexec_file_load implementation for powerpc series
with those changes and will send it shortly.

-- 
[]'s
Thiago Jung Bauermann
IBM Linux Technology Center


diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c91c496cfc64..0fb28cc8eb38 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -378,9 +378,6 @@ archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
 archprepare: checkbin
-ifeq ($(CONFIG_KEXEC_FILE),y)
-	$(Q)$(MAKE) $(build)=arch/powerpc/purgatory arch/powerpc/purgatory/kexec-purgatory.c
-endif
 
 # Use the file '.tmp_gas_check' for binutils tests, as gas won't output
 # to stdout and these checks are run even on install targets.
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 4bda7f5a346a..fea0308c7f01 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -23,10 +23,12 @@ KBUILD_AFLAGS := -fno-exceptions -msoft-float -m$(CONFIG_WORD_SIZE) \
 		-D__ASSEMBLY__
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
-KBUILD_CFLAGS += $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
-KBUILD_AFLAGS += $(call cc-option,-mabi=elfv2)
+KBUILD_CFLAGS += $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc)) \
+		-mlittle-endian
+KBUILD_AFLAGS += $(call cc-option,-mabi=elfv2) -mlittle-endian
 else
-KBUILD_CFLAGS += $(call cc-option,-mcall-aixdesc)
+KBUILD_CFLAGS += $(call cc-option,-mcall-aixdesc) -mbig-endian
+KBUILD_AFLAGS += -mbig-endian
 endif
 
 $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
