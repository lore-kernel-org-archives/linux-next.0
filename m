From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH -next] net: rfkill: Fix build for the CONFIG_RFKILL_LEDS=n
 case.
Date: Tue, 28 Apr 2009 10:05:56 -0500
Message-ID: <49F71B54.1040800@lwfinger.net>
References: <20090428143942.GA25813@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fmailhost02.isp.att.net ([207.115.11.52]:58377 "EHLO
	fmailhost02.isp.att.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758442AbZD1Pq1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2009 11:46:27 -0400
In-Reply-To: <20090428143942.GA25813@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Paul Mundt wrote:
> Commit ("rfkill: Fix broken rfkill LED in 2.6.30-rc1") sprinkles around
> references to rfkill_led_trigger() in the common code, which is only defined
> if CONFIG_RFKILL_LEDS is set:
> 
>   CC      net/rfkill/rfkill.o
> net/rfkill/rfkill.c: In function 'update_rfkill_state':
> net/rfkill/rfkill.c:99: error: implicit declaration of function 'rfkill_led_trigger'
> make[1]: *** [net/rfkill/rfkill.o] Error 1
> make: *** [net/rfkill/rfkill.o] Error 2
> 
> Cc: Larry Finger <Larry.Finger@lwfinger.net>
> Cc: John W. Linville <linville@tuxdriver.com>
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
