From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the usb.current
 tree
Date: Tue, 12 Dec 2017 22:14:50 +0100
Message-ID: <20171212211450.GA9919@kroah.com>
References: <20171213075057.41f68b05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171213075057.41f68b05@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 13, 2017 at 07:50:57AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Commit
> 
>   32fd87b3bbf5 ("USB: core: only clean up what we allocated")
> 
> is missing a Signed-off-by from its author.

Yeah, due to how it got to me, that makes sense, thanks for the notice.
I really gotta go install that git hook now...

greg k-h
