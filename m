From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Thu, 9 Nov 2017 09:34:07 +0100
Message-ID: <20171109083407.GB11420@kroah.com>
References: <20171109150126.3417da53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171109150126.3417da53@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srishti Sharma <srishtishar@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 09, 2017 at 03:01:26PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/pi433/pi433_if.c
> 
> between commit:
> 
>   f81f0b5c9a30 ("pi433: sanitize ioctl")
> 
> from the vfs tree and commit:
> 
>   69af5d92da20 ("Staging: pi433: Fix the position of brace after if")
> 
> from the staging tree.
> 
> I fixed it up (I just used the vfs tree version (for the conflicting bits)
> as suggested by Al) and can carry the fix as necessary.

Sounds like the correct fix, thanks.

greg k-h
