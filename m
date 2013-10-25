From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the h8300-remove tree
Date: Fri, 25 Oct 2013 15:03:40 +0200
Message-ID: <1382706224-8859-2-git-send-email-treding@nvidia.com>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
 <1382706224-8859-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382706224-8859-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Mark Salter <msalter@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next tree of the h8300-remove tree got a conflict in

	drivers/parport/Kconfig

caused by commits e9783b0 (Revert "drivers: parport: Kconfig: exclude h8300
for PARPORT_PC") and d90c3eb (Kconfig cleanup (PARPORT_PC dependencies)).

I fixed it up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc drivers/parport/Kconfig
index f536685,dc82ef0..2225237
--- a/drivers/parport/Kconfig
+++ b/drivers/parport/Kconfig
@@@ -41,8 -35,10 +41,7 @@@ if PARPOR
  
  config PARPORT_PC
  	tristate "PC-style hardware"
 -	depends on (!SPARC64 || PCI) && !SPARC32 && !M32R && !FRV && !S390 && \
 -		(!M68K || ISA) && !MN10300 && !AVR32 && !BLACKFIN && \
 -		!XTENSA && !CRIS
 -
 +	depends on ARCH_MIGHT_HAVE_PC_PARPORT
- 
  	---help---
  	  You should say Y here if you have a PC-style parallel port. All
  	  IBM PC compatible computers and some Alphas have PC-style
