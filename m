From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Feb 13 (staging/zsmalloc)
Date: Mon, 13 Feb 2012 09:46:01 -0800
Message-ID: <4F394C59.2000604@xenotime.net>
References: <20120213172613.be7258c4c34431ff31dcbbef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:55268 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755652Ab2BMRqg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2012 12:46:36 -0500
In-Reply-To: <20120213172613.be7258c4c34431ff31dcbbef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Nitin Gupta <ngupta@vflare.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

On 02/12/2012 10:26 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120210:


zsmalloc-main.c should #include <linux/mmzone.h> to fix this build error:


drivers/staging/zsmalloc/zsmalloc-main.c: In function 'obj_location_to_handle':
drivers/staging/zsmalloc/zsmalloc-main.c:254:32: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
drivers/staging/zsmalloc/zsmalloc-main.c: In function 'obj_handle_to_location':
drivers/staging/zsmalloc/zsmalloc-main.c:266:10: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
