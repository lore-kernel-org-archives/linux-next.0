From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: workqueues tree build failure
Date: Fri, 27 Nov 2009 11:02:25 +0900
Message-ID: <4B0F3331.3070107@kernel.org>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>	 <4B0E3677.6000603@kernel.org> <200911261016.58810.peter.ujfalusi@nokia.com>	 <4B0E467A.8080201@kernel.org> <1259239225.3062.16.camel@palomino.walls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:60323 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbZK0CDG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 21:03:06 -0500
In-Reply-To: <1259239225.3062.16.camel@palomino.walls.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Walls <awalls@radix.net>
Cc: Peter Ujfalusi <peter.ujfalusi@nokia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hello,

11/26/2009 09:40 PM, Andy Walls wrote:
>> * If you need to respond fast, wouldn't you be doing that from IRQ
>>   handler or softirq?  Do you need task context?
> 
> I'm not sure doing things like I2C transactions in the in the top half
> of the IRQ handler is generally viable.  On shared IRQ lines, wouldn't
> this hold off the interrupt for another device for too long?
> 
> For example, I already ran across the case of an error path in the ahci
> disk controller driver interrupt handler holding off interrupts from the
> cx18 driver longer than the CX23418 firmware would tolerate on a shared
> interrupt line.

Sounds like it should be using bottom half tasklet not workqueue.
Tasklet is exactly designed to handle situations like this.  Is there
any reason tasklet can't be used?

Thanks.

-- 
tejun
