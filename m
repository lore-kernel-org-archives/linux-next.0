From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the akpm tree with the staging tree
Date: Thu, 10 Jul 2014 09:12:05 -0700
Message-ID: <20140710161205.GB20239@kroah.com>
References: <20140710162750.60496f52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140710162750.60496f52@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Kamat <sachin.kamat@samsung.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 10, 2014 at 04:27:50PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> drivers/staging/emxx_udc/emxx_udc.c between commit 6de2a1a7b9e2
> ("staging: emxx_udc: Fix build error") from the staging tree and commit
> "drivers/staging/emxx_udc/emxx_udc.c: replace strict_strto() with
> kstrto()" from the akpm tree.
> 
> I fixed it up (I just used the version from the staging tree) and can
> carry the fix as necessary (no action is required).

Sounds good, thanks.

greg k-h
