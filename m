From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] powerpc: select MEMORY for FSL_IFC to not break existing
 .config files
Date: Wed, 19 Feb 2014 17:25:46 -0500
Message-ID: <53052F6A.4050400@windriver.com>
References: <1392847641-63777-1-git-send-email-paul.gortmaker@windriver.com> <1392848350.6733.809.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:58234 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029AbaBSWZI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2014 17:25:08 -0500
In-Reply-To: <1392848350.6733.809.camel@snotra.buserror.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Scott Wood <scottwood@freescale.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Prabhakar Kushwaha <prabhakar@freescale.com>

On 14-02-19 05:19 PM, Scott Wood wrote:
> On Wed, 2014-02-19 at 17:07 -0500, Paul Gortmaker wrote:
>> commit d2ae2e20fbdde5a65f3a5a153044ab1e5c53f7cc ("driver/memory:Move
>> Freescale IFC driver to a common driver") introduces this build
>> regression into the mpc85xx_defconfig:
>>
>>  drivers/built-in.o: In function `fsl_ifc_nand_remove':
>>  drivers/mtd/nand/fsl_ifc_nand.c:1147: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/mtd/nand/fsl_ifc_nand.c:1147: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/built-in.o: In function `fsl_ifc_nand_probe':
>>  drivers/mtd/nand/fsl_ifc_nand.c:1031: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/mtd/nand/fsl_ifc_nand.c:1031: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/built-in.o: In function `match_bank':
>>  drivers/mtd/nand/fsl_ifc_nand.c:1013: undefined reference to `convert_ifc_address'
>>  drivers/built-in.o: In function `fsl_ifc_nand_probe':
>>  drivers/mtd/nand/fsl_ifc_nand.c:1059: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/mtd/nand/fsl_ifc_nand.c:1080: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/mtd/nand/fsl_ifc_nand.c:1069: undefined reference to `fsl_ifc_ctrl_dev'
>>  drivers/mtd/nand/fsl_ifc_nand.c:1069: undefined reference to `fsl_ifc_ctrl_dev'
>>  make: *** [vmlinux] Error 1
>>
>> This happens because there is nothing to descend us into the
>> drivers/memory directory in the mpc85xx_defconfig.  It wasn't
>> selecting CONFIG_MEMORY.  So we never built drivers/memory/fsl_ifc.o
>> even with CONFIG_FSL_IFC=y, and so we have nothing to link against.
>>
>> In order to remain compatible with old config files and to avoid
>> such build failures, make CONFIG_FSL_IFC select CONFIG_MEMORY.
>> Also fix the whitespace issue (spaces vs. a tab) in the Kconfig.
>>
>> Cc: Prabhakar Kushwaha <prabhakar@freescale.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> ---
>>
>> [This probably makes sense to go in via Greg's char-misc/char-misc-next
>>  (vs. powerpc-next) since that is where the regression was introduced.]
>>
>>  arch/powerpc/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 957bf344c0f5..d2d8d8f50610 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -738,7 +738,8 @@ config FSL_LBC
>>  
>>  config FSL_IFC
>>  	bool
>> -        depends on FSL_SOC
>> +	depends on FSL_SOC
>> +	select MEMORY
> 
> Why do we still have FSL_IFC in arch/powerpc/Kconfig if the driver has
> been moved?  The NAND driver and other selectors of FSL_IFC can select
> MEMORY.

At the risk of a slightly larger footprint to the regression fix,
I'd agree that is a better overall solution.  I'll code that up.

Unless folks want the regression fix as-is, and then the move?

Paul.
--

> 
> -Scott
> 
> 
