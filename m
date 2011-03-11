From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: linux-next: manual merge of the usb tree with the s5p tree
Date: Fri, 11 Mar 2011 07:39:40 +0100
Message-ID: <4D79C3AC.7090900@metafoo.de>
References: <20110311170912.0fb48cf4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailhost.informatik.uni-hamburg.de ([134.100.9.70]:46607 "EHLO
	mailhost.informatik.uni-hamburg.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751278Ab1CKGig (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Mar 2011 01:38:36 -0500
In-Reply-To: <20110311170912.0fb48cf4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 03/11/2011 07:09 AM, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> arch/arm/mach-s3c2440/mach-gta02.c between commit 326d05c15f7f ("ARM:
> S3C2440: Request usb pullup pin before using it on GTA02") from the s5p
> tree and commit e27c3c5c7e0f ("ARM: s3c24xx: Switch to common GPIO
> controlled UDC pullup implementation") from the usb tree.
> 
> The latter commit removes the function gta02_udc_command() which is
> modified by the former.  I removed the function.
> 

Hi

Kukjin could you drop 326d05c15f7f ("ARM: S3C2440: Request usb pullup pin
before using it on GTA02") from your tree? It has been superseded by the other
commit in Gregs tree.

- Lars
