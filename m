From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: the drivers-x86 tree has moved?
Date: Tue, 12 Dec 2017 15:43:30 -0800
Message-ID: <20171212234330.GK27831@fury>
References: <20171213080227.7b724f39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171213080227.7b724f39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 13, 2017 at 08:02:27AM +1100, Stephen Rothwell wrote:
> Hi Darren,
> 
> I noticed commit
> 
>   960652046899 ("MAINTAINERS: Update tree for platform-drivers-x86")
> 
> Should I also change linu-next to use the new tree?

The new one is the correct location, but the old one points to it. I don't plan
to destroy the old link, but updating linux-next to use the new one is a good
idea.

So, yes - please do :-)

-- 
Darren Hart
VMware Open Source Technology Center
