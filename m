From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 6 (staging/iio)
Date: Tue, 06 Mar 2012 10:51:28 -0800
Message-ID: <4F565CB0.8070301@xenotime.net>
References: <20120306180746.25c595babf8b5072366cdbec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:53674 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S965012Ab2CFSvU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 13:51:20 -0500
In-Reply-To: <20120306180746.25c595babf8b5072366cdbec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org

On 03/05/2012 11:07 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120305:


When CONFIG_DEBUG_FS is not enabled:

drivers/staging/iio/industrialio-core.c:621:11: error: 'iio_read_channel_ext_info' undeclared (first use in this function)
drivers/staging/iio/industrialio-core.c:623:11: error: 'iio_write_channel_ext_info' undeclared (first use in this function)




-- 
~Randy
