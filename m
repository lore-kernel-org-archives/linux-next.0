From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] oqo: depends on INPUT_POLLDEV
Date: Fri, 20 Feb 2009 16:36:51 +0000
Message-ID: <20090220163651.GA698@srcf.ucam.org>
References: <20090220083007.7bd0a153.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49580 "EHLO
	vavatch.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752926AbZBTQgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 11:36:55 -0500
Content-Disposition: inline
In-Reply-To: <20090220083007.7bd0a153.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, lenb@kernel.org

On Fri, Feb 20, 2009 at 08:30:07AM -0800, Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> oqo driver uses polled input functions, so make it depend
> on INPUT_POLLDEV.
> 
> ERROR: "input_register_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
> ERROR: "input_allocate_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
> ERROR: "input_free_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
> ERROR: "input_unregister_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc:	Matthew Garrett <mjg59@srcf.ucam.org>

Acked-by: Matthew Garrett <mjg@redhat.com>

I've got a cleaned up version of this written now - I'll push it to Len 
later today.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
