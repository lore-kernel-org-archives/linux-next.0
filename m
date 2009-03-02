From: Michael Krufky <mkrufky@linuxtv.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Sun, 01 Mar 2009 19:08:49 -0500
Message-ID: <49AB2391.3020200@linuxtv.org>
References: <20090302110549.38778423.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.hauppauge.com ([167.206.143.4]:4260 "EHLO
	mail.hauppauge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751275AbZCBAYX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Mar 2009 19:24:23 -0500
In-Reply-To: <20090302110549.38778423.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org

Stephen,

Thanks for the heads up -- I fixed that a few days ago:

http://linuxtv.org/hg/v4l-dvb/raw-rev/eae32c526e78

I'm sure the fix will be included with Mauro's next push.

Regards,

Mike Krufky

Stephen Rothwell wrote:
> Hi Mauro,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> ERROR: "sms_dbg" [drivers/media/dvb/siano/smsusb.ko] undefined!
> ERROR: "sms_dbg" [drivers/media/dvb/siano/smsdvb.ko] undefined!
>
> Probably caused by commit 33b67084d284779ee2a30deebd2115f79b8435b9
> ("V4L/DVB (10751): sms1xxx: fix checkpatch.pl violations introduced by
> previous changeset").
>
> I have dropped the v4l-dvb tree for today.
>   
