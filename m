From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: linux-next: build failure after merge of the final tree
 (staging tree related))
Date: Wed, 24 Apr 2013 12:53:42 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0021D451A3BC3@AUSP01VMBX24.collaborationhost.net>
References: <20130424175600.df4a7e5307ea813e3afe73ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.bemta8.messagelabs.com ([216.82.243.206]:51425 "EHLO
	mail1.bemta8.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755883Ab3DXSBJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Apr 2013 14:01:09 -0400
In-Reply-To: <20130424175600.df4a7e5307ea813e3afe73ea@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, April 24, 2013 12:56 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:

Ugh.. powerpc probably has CONFIG_ISA_DMA_API but not
CONFIG_VIRT_TO_BUS.

I'm looking for a fix now.

Regards,
Hartley
