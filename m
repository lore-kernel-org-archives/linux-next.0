From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 6 (staging/vme)
Date: Tue, 06 Dec 2011 12:58:54 -0800
Message-ID: <4EDE820E.5040006@xenotime.net>
References: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:35954 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752845Ab1LFT7k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2011 14:59:40 -0500
In-Reply-To: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Martyn Welch <martyn.welch@ge.com>

On 12/05/2011 08:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111205:


When CONFIG_GPIOLIB is not enabled:

drivers/staging/vme/devices/vme_pio2.h:237:19: error: field 'gc' has incomplete type

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
