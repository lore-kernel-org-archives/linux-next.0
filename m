From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: build failure after merge of the edac-amd tree
Date: Mon, 1 Jun 2015 11:51:27 +0200
Message-ID: <20150601095127.GA21881@pd.tnic>
References: <20150601170742.626210ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:55910 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751210AbbFAJvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 05:51:32 -0400
Content-Disposition: inline
In-Reply-To: <20150601170742.626210ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Loc Ho <lho@apm.com>, Arnd Bergmann <arnd@arndb.de>

On Mon, Jun 01, 2015 at 05:07:42PM +1000, Stephen Rothwell wrote:
> Hi Borislav,
> 
> After merging the edac-amd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/edac/xgene_edac.c: In function 'xgene_edac_pmd_l2c_version1':
> drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'MIDR_VARIANT' [-Werror=implicit-function-declaration]
>   switch (MIDR_VARIANT(read_cpuid_id())) {
>   ^
> drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'read_cpuid_id' [-Werror=implicit-function-declaration]
> drivers/edac/xgene_edac.c:794:3: error: implicit declaration of function 'MIDR_REVISION' [-Werror=implicit-function-declaration]
>    switch (MIDR_REVISION(read_cpuid_id())) {
>    ^
> drivers/edac/xgene_edac.c:797:4: error: implicit declaration of function 'read_cpuid' [-Werror=implicit-function-declaration]
>     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
>     ^
> drivers/edac/xgene_edac.c:797:40: error: 'REVIDR_EL1' undeclared (first use in this function)
>     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
>                                         ^
> drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINOR_REV'
>   #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
>                                      ^
> drivers/edac/xgene_edac.c:797:40: note: each undeclared identifier is reported only once for each function it appears in
>     switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
>                                         ^
> drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINOR_REV'
>   #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
>                                      ^
> 
> Caused by commit  ("EDAC: Add APM X-Gene SoC EDAC driver").  You can't
> use COMPIlE_TEST for drivers that use arch specific APIs ...

Yeah, the COMPIlE_TEST thing was not such a good idea, after all.

Let's kill it:

---
From: Borislav Petkov <bp@suse.de>
Date: Mon, 1 Jun 2015 11:16:36 +0200
Subject: [PATCH] EDAC, xgene: Drop COMPILE_TEST

Stephen Rothwell reported that x86_64 allmodconfig breaks for him in the
xgene driver. Problem is, it was supposed to be compile-tested for build
coverage on other arches but it uses arch-specific facilities and thus
cannot really be compiled on those other arches.

Remove that dependency.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Loc Ho <lho@apm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Link: http://lkml.kernel.org/r/20150601170742.626210ef@canb.auug.org.au
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/edac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 8677ead2a8e1..1b9f995e353c 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -395,7 +395,7 @@ config EDAC_SYNOPSYS
 
 config EDAC_XGENE
 	tristate "APM X-Gene SoC"
-	depends on EDAC_MM_EDAC && (ARM64 || COMPILE_TEST)
+	depends on EDAC_MM_EDAC && ARM64
 	help
 	  Support for error detection and correction on the
 	  APM X-Gene family of SOCs.
-- 
2.3.5

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
