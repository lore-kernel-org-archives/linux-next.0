From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: Request inclusion of HYP mode cpu_resume fix into linux-next
Date: Tue, 27 May 2014 11:27:32 +0100
Message-ID: <20140527102732.GA18476@e102568-lin.cambridge.arm.com>
References: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:60330 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbaE0K1k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2014 06:27:40 -0400
In-Reply-To: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christoffer Dall <christoffer.dall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@arm.linux.org.uk>

Hi Stephen,

On Thu, Mar 06, 2014 at 06:43:03PM +0000, Lorenzo Pieralisi wrote:
> Hi Stephen,
> 
> can I ask you please to include the following branch into linux-next:
> 
> git://linux-arm.org/linux-2.6-lp.git arm-kvm-cpuresume
> 
> It contains a patch touching ARM PM core code that requires wider testing
> coverage before I request a pull. It has been already publicly posted,
> reviewed and tested.

Patch now queued for mainline, please drop the branch from -next, it
will reappear soon through the ARM tree.

Thanks,
Lorenzo
