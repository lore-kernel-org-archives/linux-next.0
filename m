From: Stefan Kriwanek <mail@stefankriwanek.de>
Subject: Re: linux-next: build failure after merge of the hid tree
Date: Wed, 08 Jun 2011 09:26:10 +0200
Message-ID: <4DEF2412.3040707@stefankriwanek.de>
References: <20110608130334.58c62a7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wp123.webpack.hosteurope.de ([80.237.132.130]:58703 "EHLO
	wp123.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754632Ab1FHHu6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2011 03:50:58 -0400
In-Reply-To: <20110608130334.58c62a7d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

I can only guess that this has to do with my patch not made by `git --diff` but simply `diff -up /dev/null/linux-2.6.39-speedlink/drivers/hid/hid-speedlink.c`

--- /dev/null	2011-05-27 13:53:55.863652998 +0200
+++ linux-2.6.39-speedlink/drivers/hid/hid-speedlink.c	2011-05-27 18:00:34.719863577 +0200

I am sorry if I caused the disturbance. However, after reading Documentation/SubmittitingPatches etc. I didn't know of any special measure to undertake when adding new files - If so, maybe one should consider updating the documention?.

Regards,
Stefan

Am 08.06.2011 05:03, schrieb Stephen Rothwell:
> Hi Jiri,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> make[3]: *** No rule to make target `drivers/hid/hid-speedlink.c', needed by `drivers/hid/hid-speedlink.o'.  Stop.
> 
> Caused by commit b5eb65d64f91 ("HID: Add driver to fix Speedlink VAD
> Cezanne support").
> 
> I have used the hid tree from next-20110607 for today.
