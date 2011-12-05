From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 5 (staging/et131x)
Date: Mon, 05 Dec 2011 10:37:20 -0800
Message-ID: <4EDD0F60.5050201@xenotime.net>
References: <20111205154444.bf59a93a6b03cb4985850d82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:37791 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932546Ab1LERiN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 12:38:13 -0500
In-Reply-To: <20111205154444.bf59a93a6b03cb4985850d82@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Mark Einon <mark.einon@gmail.com>, Greg KH <gregkh@suse.de>

On 12/04/2011 08:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111202:


on i386 (X86_32) builds:

drivers/staging/et131x/et131x.c:2483:8: warning: right shift count >= width of type
drivers/staging/et131x/et131x.c:2531:8: warning: right shift count >= width of type

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
