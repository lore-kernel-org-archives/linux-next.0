From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: Suspend issues on all latest kernels!
Date: Wed, 07 Jan 2009 21:37:25 +0100
Message-ID: <49651285.1020302@gmail.com>
References: <20090107193559.GA4306@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f17.google.com ([209.85.219.17]:34162 "EHLO
	mail-ew0-f17.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757558AbZAGUha (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 15:37:30 -0500
In-Reply-To: <20090107193559.GA4306@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-20090106@schottelius.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On 01/07/2009 08:35 PM, Nico -telmich- Schottelius wrote:
> Hello!
> 
> Suspend fails on Lenovo X200 with
> 
>   - 2.6.28-next-20090107-ikn
>   - 2.6.28-ikn-06859-gede6f5a
> 
> When doing echo mem > /sys/power/state, the
> "Suspending consoles..." message appears, the "moon" is blinking,
> but the system stays in this state (waited 10 minutes) forever.

Could you test
http://lkml.org/lkml/2009/1/7/67
? If it doesn't help, add no_console_suspend on kernel command line and post the
suspend hang output.

Thanks.
