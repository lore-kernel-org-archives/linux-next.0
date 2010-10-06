From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb tree with the trivial tree
Date: Wed, 6 Oct 2010 09:19:27 +0300
Message-ID: <20101006061927.GA2659@legolas.emea.dhcp.ti.com>
References: <20101006141414.abf7431f.sfr@canb.auug.org.au>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:51274 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758316Ab0JFGTq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Oct 2010 02:19:46 -0400
Content-Disposition: inline
In-Reply-To: <20101006141414.abf7431f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Jiri Kosina <jkosina@suse.cz>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, "Balbi, Felipe" <balbi@ti.com>

On Tue, Oct 05, 2010 at 10:14:14PM -0500, Stephen Rothwell wrote:
>Hi Greg,
>
>Today's linux-next merge of the usb tree got a conflict in
>drivers/usb/musb/musb_gadget.c between commit
>7f26b3a7533bbc1ddd88b297c935ee4da8f74cea ("drivers/usb: Remove
>unnecessary return's from void functions") from the trivial tree and

funny that I wasn't CCed to that one :-(

-- 
balbi
