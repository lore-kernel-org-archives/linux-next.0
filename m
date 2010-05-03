From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: tm6000 compilation breakage on linux-next
Date: Mon, 03 May 2010 10:23:31 -0700
Message-ID: <4BDF0693.40505@oracle.com>
References: <4BDEFAE4.1060700@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:53233 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752511Ab0ECRX5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2010 13:23:57 -0400
In-Reply-To: <4BDEFAE4.1060700@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, greg KH <greg@kroah.com>

On 05/03/10 09:33, Mauro Carvalho Chehab wrote:
> Hi Stephen,
> 
> Randy reported a breakage while compiling drivers/staging/tm6000, due to
> this change:
>     commit 1c1b78bee1a94f98deeb9c24b21c4812e191646c
>     Author: Greg Kroah-Hartman <gregkh@suse.de>
>     Date:   Thu Apr 29 15:46:07 2010 -0700
> 
>     USB: remove unused usb_buffer_alloc and usb_buffer_free macros
>     
>     Now that all callers are converted over, remove the compatibility
>     functions and all is good.
>     
>     Cc: Daniel Mack <daniel@caiaq.de>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> A fix patch is as simple as:
> 	s/usb_buffer_alloc/usb_alloc_coherent/
> 	s/usb_buffer_free/usb_free_coherent/

Patch:
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


Thanks.
-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
