From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 20 (amd64_edac)
Date: Wed, 20 May 2009 09:16:09 -0700
Message-ID: <4A142CC9.4050904@oracle.com>
References: <20090520170807.b75a9d86.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:48526 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063AbZETQNv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 12:13:51 -0400
In-Reply-To: <20090520170807.b75a9d86.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, borislav.petkov@amd.com, dougthompson@xmission.com

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090519:
> 
> Undropped tree:
> 	edac-amd
> 
> The edac-amd tree lost its build failure.


When K8_NB is not enabled:

drivers/built-in.o: In function `amd64_edac_init':
amd64_edac.c:(.init.text+0x254f6): undefined reference to `cache_k8_northbridges'
amd64_edac.c:(.init.text+0x25c38): undefined reference to `num_k8_northbridges'


Error with EDAC_AMD64 =y or =m.
Error on both i386 and on x86_64.


Comments on Kconfig for EDAC_AMD64:

config EDAC_AMD64
	tristate "AMD64 (Opteron, Athlon64) K8, F10h, F11h"
	depends on EDAC_MM_EDAC && X86 && PCI
	default m
	help
	Support for error detection and correction on the AMD 64
	Families of Memory Controllers (K8, F10h and F11h)


Does this actually apply to X86_32 or should the depends be on
X86_64 instead of X86?

The default y on EDAC_MM_EDAC and default m on EDAC_AMD64 should
be removed.

The 2 lines of help text should be indented by 2 spaces.

Would be Good to have the amd64_edac maintainer(s) email addresses
in MAINTAINERS file, please.

-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
