From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Fri, 26 Feb 2016 13:34:30 -0600
Message-ID: <CAErSpo4d_roPQO2XmSvCDexDy_wm-L0GReh_TT6ZR-gdLAyVkw@mail.gmail.com>
References: <E1aYsmb-0006qb-76@optimist> <20160226030411.GK18327@sirena.org.uk>
 <20160226090830.41a63a86@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:33256 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561AbcBZTev (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2016 14:34:51 -0500
Received: by mail-yw0-f174.google.com with SMTP id u200so77224319ywf.0
        for <linux-next@vger.kernel.org>; Fri, 26 Feb 2016 11:34:50 -0800 (PST)
In-Reply-To: <20160226090830.41a63a86@free-electrons.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-next list <linux-next@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>

On Fri, Feb 26, 2016 at 2:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Mark,
>
> On Fri, 26 Feb 2016 12:04:11 +0900, Mark Brown wrote:
>
>> Today's -next fails to build an arm64 allmodconfig due to:
>>
>> >     arm64-allmodconfig
>> > ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
>> > ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
>> > ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
>> > ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
>> > ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
>>
>> caused by b4f596b19624 (arm64: add mvebu architecture entry) which
>> enables MVBEU on arm64, the commit was present for a little while and
>> the error cropped up but didn't get reported due to other things masking
>> it.  This looks like the driver needs modernization and probably ought
>> to have a !ARM64 dependency for now.
>
> This has already been fixed by:
>
>         [PATCH] PCI: mvebu: Restrict build to 32-bit ARM
>
> submitted by Thierry Redding. I'm Cc'ing Bjorn, who is the one in
> charge of merging this fix.

I applied Thierry's patch ("PCI: mvebu: Restrict build to 32-bit ARM")
to my for-linus branch, so it should appear in Linus' tree before
v4.5.

Bjorn
