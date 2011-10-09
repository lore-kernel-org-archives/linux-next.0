From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] usb gadget: fix langwell_udc.c build error
Date: Sun, 09 Oct 2011 16:05:46 -0700
Message-ID: <4E9228CA.1060904@xenotime.net>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au> <4E8F67C6.5020603@xenotime.net> <20111008100326.GA24633@legolas.emea.dhcp.ti.com> <4E91DF00.8060107@xenotime.net> <20111009223638.GA29776@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:50412 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751007Ab1JIXFs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Oct 2011 19:05:48 -0400
In-Reply-To: <20111009223638.GA29776@legolas.emea.dhcp.ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: balbi@ti.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Michal Nazarewicz <mina86@mina86.com>

On 10/09/11 15:36, Felipe Balbi wrote:
> git log --pretty=oneline -S'lpm_device_speed' HEAD --	\
> 	drivers/usb/gadget/langwell_udc.c

e538dfdae85244fd2c4231725d82cc1f1bc4942c usb: Provide usb_speed_string() function


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
