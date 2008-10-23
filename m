From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: build failure at x86/kernel/pci-dma.c with !CONFIG_PCI
Date: Fri, 24 Oct 2008 03:58:23 +0400
Message-ID: <a4423d670810231658i6e7a9146je64240e99c1c512a@mail.gmail.com>
References: <a4423d670810231609h76323d2fqa4ed7d9ba0a46e3b@mail.gmail.com>
	 <20081023235100.GA2192@linux-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.242]:50062 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754769AbYJWX62 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 19:58:28 -0400
Received: by an-out-0708.google.com with SMTP id d40so69448and.103
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 16:58:27 -0700 (PDT)
In-Reply-To: <20081023235100.GA2192@linux-os.sc.intel.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Woodhouse, David" <david.woodhouse@intel.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, mingo@elte.hu, fujita.tomonori@lab.ntt.co.jp, adobriyan@gmail.com

2008/10/24 Fenghua Yu <fenghua.yu@intel.com>:
> On Thu, Oct 23, 2008 at 04:09:52PM -0700, Alexander Beregalov wrote:
>> arch/x86/kernel/built-in.o: In function `iommu_setup':
>> pci-dma.c:(.init.text+0x36ad): undefined reference to `forbid_dac'
>> pci-dma.c:(.init.text+0x36cc): undefined reference to `forbid_dac'
>> pci-dma.c:(.init.text+0x3711): undefined reference to `forbid_dac
>>
>> commit 5b6985ce8ec7127b4d60ad450b64ca8b82748a3b
>> Author: Fenghua Yu <fenghua.yu@intel.com>
>> Date:   Thu Oct 16 18:02:32 2008 -0700
>>
>>     intel-iommu: IA64 support
>
> Could you please try the following fix patch?
>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
It works fine for me on x86_32
