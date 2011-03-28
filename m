From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] Fix build failure when CONFIG_NLS is set to 'm' by
 allmodconfig
Date: Mon, 28 Mar 2011 09:17:32 -0700
Message-ID: <20110328091732.12e7d850@jbarnes-desktop>
References: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
	<20110223131734.GA6275@srcf.ucam.org>
	<20110304101509.7eef7475@jbarnes-desktop>
	<20110328080220.1390d28e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:59562 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751744Ab1C1QRl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2011 12:17:41 -0400
In-Reply-To: <20110328080220.1390d28e.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Narendra_K@Dell.com, viro@zeniv.linux.org.uk, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Shyam_Iyer@Dell.com, Matt_Domsch@Dell.com, Charles_Rose@Dell.com, Jordan_Hargrave@Dell.com

On Mon, 28 Mar 2011 08:02:20 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> This driver still has build failures in linux-next 20110328.
> 
> pci-label.c:(.text+0x9a40): undefined reference to `utf16s_to_utf8s'
> 
> CONFIG_NLS=m

Narenda, please send a fix asap.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
