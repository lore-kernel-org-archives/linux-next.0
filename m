From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm-soc
 tree
Date: Mon, 7 Mar 2016 12:19:34 +0000
Message-ID: <56DD71D6.8040406@arm.com>
References: <20160307150402.191ba735@canb.auug.org.au>
 <CAOesGMjD51rNqd3V8BE6xHkYZQdB8nc_Azppk1U+m8GwrtUv6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:54917 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146AbcCGMTi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Mar 2016 07:19:38 -0500
In-Reply-To: <CAOesGMjD51rNqd3V8BE6xHkYZQdB8nc_Azppk1U+m8GwrtUv6w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sudeep Holla <sudeep.holla@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fu Wei <fu.wei@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>

Hi Olof,

On 07/03/16 05:41, Olof Johansson wrote:
> Hi Wim,
>
> It's much easier for us if all DTS changes go in through the arm-soc
> trees, to avoid these kind of conflicts. Is this on a branch where you
> can easily drop it and we pick it up instead, or is it on a now-stable
> branch?
>

Sorry for that. Since the patch series was still under discussion and
v14 was posted 3 days ago, I had not checked with Fu Wei on his plans
for DTS changes.

Let me know if you want to pick up this single patch directly or want me
to send PR for that if Wim drops it from his branch. I might have couple
of DTS warning fixes for juno/vexpress(though I need to wait for Rob's
acks to them), so I can bundle them together.

-- 
Regards,
Sudeep
