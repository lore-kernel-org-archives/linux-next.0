From: Laurent Pinchart <laurent.pinchart@skynet.be>
Subject: Re: strncat() misuse (was: Re: dm_attr_{name,uuid}_show buffer overflow? (was: Re: linux-next: Tree for January 5))
Date: Wed, 7 Jan 2009 15:39:35 +0100
Message-ID: <200901071539.35810.laurent.pinchart@skynet.be>
References: <20090105173517.deeff918.sfr@canb.auug.org.au> <Pine.LNX.4.64.0901052225400.5451@anakin> <Pine.LNX.4.64.0901052259420.5451@anakin>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay005.isp.belgacom.be ([195.238.6.171]:11072 "EHLO
	mailrelay005.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751893AbZAGOji (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 09:39:38 -0500
In-Reply-To: <Pine.LNX.4.64.0901052259420.5451@anakin>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Milan Broz <mbroz@redhat.com>, Alasdair G Kergon <agk@redhat.com>, Jaya Kumar <jayakumar.video@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Gene Sally <Gene.Sally@timesys.com>, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Geert,

On Monday 05 January 2009, Geert Uytterhoeven wrote:
>
> A quick `git grep strncat' shows a few more misusers of strncat() that may
>
> cause buffer overflows and should be converted to strlcat():
> | drivers/media/video/uvc/uvc_driver.c:
> | 	strncat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",

Thanks for the report. As both the source length is fixed and the destination 
buffer length known, I'll just replace strncat with strcat.

Best regards,

Laurent Pinchart
