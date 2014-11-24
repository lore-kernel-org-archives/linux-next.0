From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [-next] cpu cache info in drivers base?
Date: Mon, 24 Nov 2014 16:06:19 +0000
Message-ID: <5473577B.6010708@arm.com>
References: <20141124150048.GD3738@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:57023 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbaKXQFn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2014 11:05:43 -0500
In-Reply-To: <20141124150048.GD3738@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>, Stephen Boyd <sboyd@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Heiko,

On 24/11/14 15:00, Heiko Carstens wrote:
> Hi there,
>
> I'm just wondering what the point of the current cpu cache info
> within drivers/base is?
> If I startup linux-next (as of today) all I get is an error message
> "error detecting cacheinfo..cpu0".

That's correct, I did post a patch[1] to suppress that given not all
architectures might add support.

> Which naturally comes from:
>
> int __weak init_cache_level(unsigned int cpu)
> {
> 	return -ENOENT;
> }
>
> Given that there is no implementation without __weak I'm wondering
> what the point is? Also it looks like no architecture has been
> converted to the new infrastructure, even though such patches have
> been posted in the past?

Yes, I asked Greg to hold off on the architecture patches for next
versions as there may be conflicts(though we can have solve it using
a common baseline, but I thought it was too late to try that). Also
I have not got testing on few other architectures(ppc, ia64, amd). I
will post those patches individually on respective arch lists and
chase after the v3.19-rc1 release. Is that OK ?

Regards,
Sudeep

[1] https://lkml.org/lkml/2014/11/12/351
