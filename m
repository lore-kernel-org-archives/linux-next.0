From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: manual merge of the mfd tree with the v4l-dvb tree
Date: Tue, 16 Apr 2013 10:59:50 -0300
Message-ID: <516D5956.2090409@redhat.com>
References: <20130410134813.b1bff6027f64f14d75d43927@canb.auug.org.au> <20130410064253.GA4874@zurbaran> <20130410064828.6c946ad8@redhat.com> <20130416135137.GA31283@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29733 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935469Ab3DPOl5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Apr 2013 10:41:57 -0400
In-Reply-To: <20130416135137.GA31283@zurbaran>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em 16-04-2013 10:51, Samuel Ortiz escreveu:
> Hi Mauro,
>
> On Wed, Apr 10, 2013 at 06:48:28AM -0300, Mauro Carvalho Chehab wrote:
>> Em Wed, 10 Apr 2013 08:42:53 +0200
>> Samuel Ortiz <sameo@linux.intel.com> escreveu:
>>
>>> Hi Stephen,
>>>
>>> On Wed, Apr 10, 2013 at 01:48:13PM +1000, Stephen Rothwell wrote:
>>>> Hi Samuel,
>>>>
>>>> Today's linux-next merge of the mfd tree got a conflict in
>>>> drivers/mfd/Kconfig between commit 3f8ec5df11aa ("[media] mfd: Add header
>>>> files and Kbuild plumbing for SI476x MFD core") from the v4l-dvb tree and
>>>> commit ab85b120e692 ("mfd: Kconfig alphabetical re-ordering") from the
>>>> mfd tree.
>>> I'm surprised the v4l-dvb tree is carrying this patchset because I haven't
>>> ACKed it.
>>
>> Sorry. Not sure why I understood that you gave your ack. Perhaps I miss-read
>> one of the comments of that thread.
> I haven't heard back from Andrey yet. If I don't get anything from him on
> Wednesday, would you mind reverting this patchset ? I have not ACKed it
> because it breaks bisectability, and it conflicts with mfd-next.

Sure. Just ping me and I'll revert it.

>
> Andrey, any plans to adress my comments from last week ?
>
> Cheers,
> Samuel.
>

Regards,
Mauro
