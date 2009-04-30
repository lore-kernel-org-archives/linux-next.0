From: David Vrabel <david.vrabel@csr.com>
Subject: Re: [PATCH -next] wusb: hwa-hc: Drop unused pci_suspend/resume hooks.
Date: Thu, 30 Apr 2009 09:48:10 +0100
Message-ID: <49F965CA.2050704@csr.com>
References: <20090430084101.GA11696@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fizeau.zen.co.uk ([212.23.8.67]:57642 "EHLO fizeau.zen.co.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbZD3Iuj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 04:50:39 -0400
In-Reply-To: <20090430084101.GA11696@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>

Paul Mundt wrote:
>   CC      drivers/usb/host/hwa-hc.o
> drivers/usb/host/hwa-hc.c:601: warning: initialization from incompatible pointer type
> drivers/usb/host/hwa-hc.c:602: warning: initialization from incompatible pointer type
> 
> The prototype for these changed, so the message itself was dropped. As the only
> thing these hooks were doing was printing out the message for debugging, there
> is not much point in keeping them around. So, just kill them off.

Acked-by: David Vrabel <david.vrabel@csr.com>

Greg, can you pick this one up, please.

David
