From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 6 (staging/vme)
Date: Mon, 12 Dec 2011 09:24:58 -0800
Message-ID: <4EE638EA.6010909@xenotime.net>
References: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au> <4EDE820E.5040006@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:58751 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751091Ab1LLQZM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2011 11:25:12 -0500
In-Reply-To: <4EDE820E.5040006@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Martyn Welch <martyn.welch@ge.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 12/06/2011 12:58 PM, Randy Dunlap wrote:
> On 12/05/2011 08:44 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20111205:
> 
> 
> When CONFIG_GPIOLIB is not enabled:
> 
> drivers/staging/vme/devices/vme_pio2.h:237:19: error: field 'gc' has incomplete type


This error is still in linux-next of 20111212.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
