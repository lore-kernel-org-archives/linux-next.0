From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the tty tree
Date: Fri, 12 Oct 2018 10:22:29 +0200
Message-ID: <20181012082229.GA23069@kroah.com>
References: <20181012191509.4ad4e5a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181012191509.4ad4e5a9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 12, 2018 at 07:15:09PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Commit
> 
>   c9a8e5fce009 ("tty: wipe buffer.")
> 
> is missing a Signed-off-by from its author.

Yes, known issue, I took a patch from Linus that he didn't get the
chance to sign-off on.

thanks,

greg k-h
