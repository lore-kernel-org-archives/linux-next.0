From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sony-laptop should depend on RFKILL
Date: Wed, 1 Apr 2009 21:59:17 +0900
Message-ID: <20090401125917.GC9650@kamineko.org>
References: <20090331223407.GA10676@orion> <20090331223555.GA31066@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:58063
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757616AbZDAM7U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2009 08:59:20 -0400
Content-Disposition: inline
In-Reply-To: <20090331223555.GA31066@srcf.ucam.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 31, 2009 at 11:35:55PM +0100, Matthew Garrett wrote:
> On Wed, Apr 01, 2009 at 02:34:07AM +0400, Alexander Beregalov wrote:
> > Fixes this build error when RFKILL is not set:
> > 
> > drivers/platform/x86/sony-laptop.c:1050: undefined reference to `rfkill_unregister'
> > and so on..
> > 
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> 
> Acked-by: Matthew Garrett <mjg@redhat.com>

Thanks, applied and forwarding it to Len now with other fixes for
2.6.30.
-- 
mattia
:wq!
