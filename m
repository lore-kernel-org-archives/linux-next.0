From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 10:18:59 +0000
Message-ID: <20091126101859.GA27562@rakim.wolfsonmicro.main>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>
 <200911261016.58810.peter.ujfalusi@nokia.com>
 <4B0E467A.8080201@kernel.org>
 <200911261131.15155.peter.ujfalusi@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42274 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1759703AbZKZKSy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 05:18:54 -0500
Content-Disposition: inline
In-Reply-To: <200911261131.15155.peter.ujfalusi@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Cc: ext Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

On Thu, Nov 26, 2009 at 11:31:15AM +0200, Peter Ujfalusi wrote:

> For a quick fix, I can convert the tlv320dac33 driver to use this, and revisit 
> later, if it does not fulfill the timing requirements for the HW.

If there are problems then creating a dedicated thread you can wake
would probably do the job.
