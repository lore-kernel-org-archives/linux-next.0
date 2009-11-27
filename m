From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: workqueues tree build failure
Date: Fri, 27 Nov 2009 17:42:27 +0900
Message-ID: <4B0F90F3.2010204@kernel.org>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>	<4B0E3677.6000603@kernel.org>	<200911261016.58810.peter.ujfalusi@nokia.com>	<4B0E467A.8080201@kernel.org>	<1259239225.3062.16.camel@palomino.walls.org>	<4B0F3331.3070107@kernel.org> <s5h3a40pdm7.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:38087 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752393AbZK0Imm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 03:42:42 -0500
In-Reply-To: <s5h3a40pdm7.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andy Walls <awalls@radix.net>, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hello,

11/27/2009 05:37 PM, Takashi Iwai wrote:
>> Sounds like it should be using bottom half tasklet not workqueue.
>> Tasklet is exactly designed to handle situations like this.  Is there
>> any reason tasklet can't be used?
> 
> Right now the h/w accessing code is using mutex.  I'm not sure whether
> the deeper part might sleep, though...

Ah... I see.  Using mutex from a handler where response time is
critical is strange tho.  Anyways, I don't really think singlethread
will satisfy the timing requirement under loaded conditions.  IMHO,
update locking and using tasklets would be the best.

Thanks.

-- 
tejun
