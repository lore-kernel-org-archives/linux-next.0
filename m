From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: + arc-convert-to-dma_map_ops.patch added to -mm tree
Date: Tue, 24 Nov 2015 17:09:53 +0530
Message-ID: <56544C89.7060302@synopsys.com>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
 <20151124075047.GA29572@lst.de>
 <C2D7FE5348E1B147BCA15975FBA23075F44D3928@IN01WEMBXA.internal.synopsys.com>
 <1448362882.32654.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:50094 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbbKXLla (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2015 06:41:30 -0500
In-Reply-To: <1448362882.32654.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, "hch@lst.de" <hch@lst.de>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Anton Kolesov <Anton.Kolesov@synopsys.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Guenter Roeck <linux@roeck-us.net>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Francois Bedard <Francois.Bedard@synopsys.com>

Hi Michael,

On Tuesday 24 November 2015 04:31 PM, Michael Ellerman wrote:
> On Tue, 2015-11-24 at 09:46 +0000, Vineet Gupta wrote:
>> > On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
>>> > > Hi Vineet,
>>> > > 
>>> > > the original version went through the buildbot, which succeeded.  It seems
>>> > > like the official buildbot does not support arc, and might benefit from
>>> > > helping to set up an arc environment. 
>> > 
>> > I have in the past asked kisskb service folks - but haven't heard back from them.
>> > Stephan, Michael could you please add ARC toolchain to kisskb build service. I can
>> > buy you guys a beer (or some other beverage of choice) next time we meet :-)
> Sure, where do I get a toolchain? Can I just build upstream binutils + GCC?
> 
> chers

We are in the process of revamping upstream support for GNU tools (they were added
many years ago, bit-rotted and now are being redone again).

The current tools are hoisted on github.
https://github.com/foss-for-synopsys-dwc-arc-processors/

You could use upstream buildroot which automatically picks up relevant tools
branches from our github repos.

Please note that ARC cores are based off two ISA: ARCompact and recently announced
ARCv2. Thus it would be awesome if we could build following kernel configs on
regular basis:
 - axs101_defconfig
 - axs103_smp_defconfig

This however needs 2 toolchain installs as we don't have multilibed tools which
support both ISA.

You can do following to generate the tools (this first pass builds the kernel as
well which can be disabled if u so wish).

$ wget http://buildroot.uclibc.org/downloads/buildroot-2015.08.1.tar.gz
$ tar -xvf buildroot-2015.08.1.tar.gz
$ cd buildroot-2015.08.1; mkdir arcv2 arcomp

$ make O=arcv2 snps_axs103_defconfig ; cd arcv2; make ; cd .. # for ARCv2 tools
$ make O=arcomp snps_axs101_defconfig ; cd arcomp; make # for ARCompact tools

There's another way to build them by hand - with finer grainer control of specific
tools branches, target flags and so forth. Let me know if you prefer that and I
can point you to same (they in toolchain repo on github)

Many thx for looking into this. Please let me know if you run into any issues with
above.

-Vineet
