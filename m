From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH -next] i2c: fix i2c-ismt.c printk format warning
Date: Fri, 15 Feb 2013 20:48:44 +0100
Message-ID: <20130215194844.GE4351@the-dreams.de>
References: <20130215184255.5ba8a085004f4aadb9faf82c@canb.auug.org.au>
 <511E83BC.3050007@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57914 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751917Ab3BOTsy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Feb 2013 14:48:54 -0500
Content-Disposition: inline
In-Reply-To: <511E83BC.3050007@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Bill E. Brown" <bill.e.brown@intel.com>, Jean Delvare <khali@linux-fr.org>, Seth Heasley <seth.heasley@intel.com>, Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org

On Fri, Feb 15, 2013 at 10:51:40AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix printk format warning.  dma_addr_t can be 32-bit or 64-bit,
> so cast it to long long for printing.  This also matches the
> printk format specifier that is already used.
> 
> drivers/i2c/busses/i2c-ismt.c:532:3: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' [-Wformat]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks, applied to next.
