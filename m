From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 3 (fonts.c & vivi)
Date: Mon, 03 Jun 2013 13:34:58 -0700
Message-ID: <51ACFDF2.4040600@infradead.org>
References: <20130603163717.a6f78476e57d92fadd6f6a23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39183 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757620Ab3FCUf7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Jun 2013 16:35:59 -0400
In-Reply-To: <20130603163717.a6f78476e57d92fadd6f6a23@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-fbdev@vger.kernel.org

On 06/02/13 23:37, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130531:
> 


on x86_64:

warning: (VIDEO_VIVI && USB_SISUSBVGA && SOLO6X10) selects FONT_SUPPORT which has unmet direct dependencies (HAS_IOMEM && VT)
warning: (VIDEO_VIVI && FB_VGA16 && FB_S3 && FB_VT8623 && FB_ARK && USB_SISUSBVGA_CON && SOLO6X10) selects FONT_8x16 which has unmet direct dependencies (HAS_IOMEM && VT && FONT_SUPPORT)


drivers/built-in.o: In function `vivi_init':
vivi.c:(.init.text+0x1a3da): undefined reference to `find_font'

when CONFIG_VT is not enabled.

Just make CONFIG_VIDEO_VIVI depend on VT ?


-- 
~Randy
