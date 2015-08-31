From: Guenter Roeck <private@roeck-us.net>
Subject: Re: ARCv2 testing exposure (Re: arc build failures in -next due to
 ARCv2 patch)
Date: Mon, 31 Aug 2015 06:58:44 -0700
Message-ID: <55E45D94.4050604@roeck-us.net>
References: <558DE739.4020804@roeck-us.net> <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com> <558EB037.1030308@roeck-us.net> <55900FC3.8040101@gmail.com> <C2D7FE5348E1B147BCA15975FBA23075CFB8734F@IN01WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39549 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085AbbHaN6r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 09:58:47 -0400
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075CFB8734F@IN01WEMBXB.internal.synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "arc-linux-dev@synopsys.com" <arc-linux-dev@synopsys.com>, lkml <linux-kernel@vger.kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>

Hi Vineet,

On 08/31/2015 03:35 AM, Vineet Gupta wrote:
> I was wondering about ARCv2 coverage in your build service. Do you have the needed 2nd toolchain for ARCv2 as well. If not can u add it please. To build one, you could use upstream buildroot or the legacy scripts at git@github.com:foss-for-synopsys-dwc-arc-processors/toolchain.git Or if you so prefer, we also have prebuilt toolchains in github releases. Thx, -Vineet 

Thanks for the information.

I created a toolchain using buildroot, and the build service already covers arcv2.

Guenter
