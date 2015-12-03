From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 10:52:46 +0100
Message-ID: <566010EE.6050806@bjorling.me>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
 <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:36247 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932496AbbLCJwt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 04:52:49 -0500
Received: by wmww144 with SMTP id w144so13572383wmw.1
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2015 01:52:48 -0800 (PST)
In-Reply-To: <20151203090638.GA14329@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

On 12/03/2015 10:06 AM, Christoph Hellwig wrote:
> On Thu, Dec 03, 2015 at 09:39:01AM +0100, Matias Bj=F8rling wrote:
>> A little crazy yes. The reason is that the NVMe admin queues and NVM=
e user
>> queues are driven by different request queues. Previously this was p=
atched
>> up with having two queues in the lightnvm core. One for admin and an=
other
>> for user. But was later merged into a single queue.
>
> Why?  If you look at the current structure we have the admin queue
> which is always allocated by the Low level driver, although it could =
and
> should move to the core eventually.  And then we have Command set spe=
cific
> request_queues for the I/O queues.  One per NS for NVM currenly, eith=
er
> one per NS or one globally for LightNVM, and in Fabrics I currently
> have another magic one :)  Due to the tagset pointer in struct nvme_c=
trl
> that's really easy to handle.
>

The identify geometry command and bad block commands are part of the=20
admin command set. Surely, as all these take a ns id, they can be moved=
=20
and be accessed naturally through the user queues.

Let me send out a revert for that patch.
