From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: ARCv2 testing exposure (Re: arc build failures in -next due to
 ARCv2 patch)
Date: Mon, 31 Aug 2015 10:35:40 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075CFB8734F@IN01WEMBXB.internal.synopsys.com>
References: <558DE739.4020804@roeck-us.net>
 <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com>
 <558EB037.1030308@roeck-us.net> <55900FC3.8040101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:37351 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026AbbHaKfp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 06:35:45 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <private@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "arc-linux-dev@synopsys.com" <arc-linux-dev@synopsys.com>, lkml <linux-kernel@vger.kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>

Hi Guenter,

On Sunday 28 June 2015 08:46 PM, Vineet Gupta wrote:
> On Saturday 27 June 2015 07:46 PM, Guenter Roeck wrote:

>>> >> Thx for reporting the issue - I have pushed a fix (also attached) which shd cure
>>> >> it (don't have exactly similar oldish gcc at hand).
>> > 
>> > Not that old, really, it just isn't configured for ARCv2. Question is if I need two
>> > separate compilers or if I can configure it to support both v1 and v2.
>
> The compiler itself can support both - however issue is multilib'ing / libgcc. The
> elf32 compiler is multilib'ed - but we've been using the uclibc compiler (with
> just the right toggles) to build the kernel as well (to avoid having to use 2
> toolchains for kernel / user etc).
> 
> long story short - ATM, we need 2 different compilers to build legacy ARCompact,
> and newer ARCv2.

I was wondering about ARCv2 coverage in your build service. Do you have the needed
2nd toolchain for ARCv2 as well. If not can u add it please.

To build one, you could use upstream buildroot or the legacy scripts at

git@github.com:foss-for-synopsys-dwc-arc-processors/toolchain.git

Or if you so prefer, we also have prebuilt toolchains in github releases.

Thx,
-Vineet
