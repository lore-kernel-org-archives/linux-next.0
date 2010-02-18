From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 18 (media/video/gspca)
Date: Thu, 18 Feb 2010 08:35:40 -0800
Message-ID: <4B7D6C5C.4010908@oracle.com>
References: <20100218204937.54a613d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:23904 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757462Ab0BRQg5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2010 11:36:57 -0500
In-Reply-To: <20100218204937.54a613d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On 02/18/10 01:49, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100217:


when CONFIG_INPUT is not enabled:

drivers/media/video/gspca/gspca.c:2345: error: 'struct gspca_dev' has no member named 'input_dev'
drivers/media/video/gspca/gspca.c:2347: error: 'struct gspca_dev' has no member named 'input_dev'


-- 
~Randy
