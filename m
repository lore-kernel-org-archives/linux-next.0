From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the usb tree with the s5p tree
Date: Fri, 11 Mar 2011 16:19:09 +0900
Message-ID: <010b01cbdfbc$a3052460$e90f6d20$%kim@samsung.com>
References: <20110311170912.0fb48cf4.sfr@canb.auug.org.au>
 <4D79C3AC.7090900@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48437 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752491Ab1CKHTV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2011 02:19:21 -0500
In-reply-to: <4D79C3AC.7090900@metafoo.de>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: 'Greg KH' <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Lars-Peter Clausen wrote:
> 
> On 03/11/2011 07:09 AM, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > Today's linux-next merge of the usb tree got a conflict in
> > arch/arm/mach-s3c2440/mach-gta02.c between commit 326d05c15f7f ("ARM:
> > S3C2440: Request usb pullup pin before using it on GTA02") from the s5p
> > tree and commit e27c3c5c7e0f ("ARM: s3c24xx: Switch to common GPIO
> > controlled UDC pullup implementation") from the usb tree.
> >
> > The latter commit removes the function gta02_udc_command() which is
> > modified by the former.  I removed the function.
> >
> 
> Hi
> 
> Kukjin could you drop 326d05c15f7f ("ARM: S3C2440: Request usb pullup pin
> before using it on GTA02") from your tree? It has been superseded by the
> other
> commit in Gregs tree.
> 
Hi,

Ok, I did it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
