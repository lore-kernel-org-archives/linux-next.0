From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: the drivers-x86 tree has moved?
Date: Wed, 13 Dec 2017 12:00:39 +1100
Message-ID: <20171213120039.31eaff80@canb.auug.org.au>
References: <20171213080227.7b724f39@canb.auug.org.au>
        <20171212234330.GK27831@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752842AbdLMBAl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 20:00:41 -0500
In-Reply-To: <20171212234330.GK27831@fury>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Darren,

On Tue, 12 Dec 2017 15:43:30 -0800 Darren Hart <dvhart@infradead.org> wrote:
>
> On Wed, Dec 13, 2017 at 08:02:27AM +1100, Stephen Rothwell wrote:
> > 
> > I noticed commit
> > 
> >   960652046899 ("MAINTAINERS: Update tree for platform-drivers-x86")
> > 
> > Should I also change linu-next to use the new tree?  
> 
> The new one is the correct location, but the old one points to it. I don't plan
> to destroy the old link, but updating linux-next to use the new one is a good
> idea.
> 
> So, yes - please do :-)

Done.
-- 
Cheers,
Stephen Rothwell
