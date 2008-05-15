From: Olaf Hering <olaf@aepfle.de>
Subject: Re: linux-next: powercp-next build failure
Date: Thu, 15 May 2008 09:06:51 +0200
Message-ID: <20080515070651.GA22079@aepfle.de>
References: <20080515145913.5436adb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:37043 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752633AbYEOHGz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 May 2008 03:06:55 -0400
Content-Disposition: inline
In-Reply-To: <20080515145913.5436adb9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, David Miller <davem@davemloft.net>

On Thu, May 15, Stephen Rothwell wrote:

> Today's linux-next build (sparc64 defconfig) fails like this:
> 
> drivers/of/device.c: In function `modalias_show':
> drivers/of/device.c:66: error: implicit declaration of function `of_device_get_modalias'
> 
> Caused by commit 140b932f8cb6cced10b96860651a198b1b89cbb9 ("[POWERPC]
> Create modalias file in sysfs for of_platform bus") from the powerpc-next
> tree as there is a definition and declaration of of_device_get_modalias
> only for powerpc.  I reverted that commit for today.

Better fix it up because my patch was for 2.6.25, and I cant follow
mainline due to time constraints.
