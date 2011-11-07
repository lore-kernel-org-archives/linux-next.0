From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 5(7) [x86/platform/ts5500_adc.c]
Date: Mon, 07 Nov 2011 09:22:19 -0800
Message-ID: <4EB813CB.8060508@xenotime.net>
References: <20111107141319.b1d38ed603420631274515e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:55684 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754932Ab1KGRXW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2011 12:23:22 -0500
In-Reply-To: <20111107141319.b1d38ed603420631274515e6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jonas Fonseca <jonas.fonseca@savoirfairelinux.com>

On 11/06/2011 07:13 PM, Stephen Rothwell wrote:
> Hi all,


When CONFIG_HWMON=m and CONFIG_TS5500_ADC=y (since it is bool):

ts5500_adc.c:(.devinit.text+0x322): undefined reference to `hwmon_device_register'

You could make CONFIG_TS5500_ADC depend on CONFIG_HWMON=y ...
or add loadable module support for ts5500 drivers/modules.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
