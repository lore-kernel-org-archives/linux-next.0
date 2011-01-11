From: <Narendra_K@Dell.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Tue, 11 Jan 2011 20:48:21 +0530
Message-ID: <20110111154214.GA16157@fedora14-r610.oslab.blr.amer.dell.com>
References: <20110110125411.2f45fd2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:33889 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756093Ab1AKPSz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Jan 2011 10:18:55 -0500
In-Reply-To: <20110110125411.2f45fd2f.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: jbarnes@virtuousgeek.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Narendra_K@Dell.com, Jordan_Hargrave@Dell.com, Matt_Domsch@Dell.com

On Mon, Jan 10, 2011 at 07:24:11AM +0530, Stephen Rothwell wrote:
> Hi Jesse,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/built-in.o: In function `T.647':
> pci-label.c:(.text+0x28514): undefined reference to `utf16s_to_utf8s'
> 
> Caused by commit a6247cd4be20cb5439db5cb7b0b6cc67fdc8e2a2 ("PCI: export
> ACPI _DSM provided firmware instance number and string to sysfs").
> 
> I have used the pci tree from next-20110107 for today.

[ It looks like my earlier post did not hit the lists, so reposting ]

Hi, 

I did a git pull of linux-next-20110110 (topmost commit is 
4c897f27ad2668534f719202a3b88abe8ec31011) and applied the patch. With 
CONFIG_DMI and CONFIG_ACPI both set, I did not encounter this build failure. 
The definition for `utf16s_to_utf8s' is available in 'include/linux/nls.h' 
which is included in 'drivers/pci/pci-label.c' and the build succeeded. Sorry 
if I am missing something here.

Stephen,

Could you share the .config which caused this build failure ?

With regards,
Narendra K
