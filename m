From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: hid tree build warning
Date: Fri, 20 Feb 2009 12:55:07 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0902201254100.18874@jikos.suse.cz>
References: <20090220190846.46ec3d76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54850 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752173AbZBTLzK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 06:55:10 -0500
In-Reply-To: <20090220190846.46ec3d76.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

On Fri, 20 Feb 2009, Stephen Rothwell wrote:

> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> drivers/hid/usbhid/hid-core.c:1337: warning: 'hid_reset_resume' defined but not used
> 
> Introduced by commit 8aa650161ced641fec0bc9c38e3dea6a1f315442 ("HID: fix
> USB HID devices after STD with autosuspend") from the hid tree.
> 
> hid_reset_resume() is only used if CONFIG_PM is set.

Thanks a lot for catching this, I have fixed it (moved hid_reset_resume() 
into the ifdef CONFIG_PM part of the source) and pushed the fix to the 
branch you pull into -next.

-- 
Jiri Kosina
SUSE Labs
