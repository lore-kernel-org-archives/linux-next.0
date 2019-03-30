From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Fixes tag needs some work in the tty.current tree
Date: Sat, 30 Mar 2019 08:13:01 +0100
Message-ID: <20190330071301.GB5068@kroah.com>
References: <20190328072734.2093d03c@canb.auug.org.au>
 <20190329194718.GE12004@kroah.com>
 <20190330162529.65805441@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190330162529.65805441@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Razvan Stefanescu <razvan.stefanescu@microchip.com>
List-Id: linux-next.vger.kernel.org

On Sat, Mar 30, 2019 at 04:25:29PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Fri, 29 Mar 2019 20:47:18 +0100 Greg KH <greg@kroah.com> wrote:
> >
> > Is there a script somewhere that I can use to run on my tree before I
> > push it out, much like I do now for the signed-off-by checks?
> 
> Attached is what I use ...

Nice, thanks!

Perhaps this should be added to checkpatch someday :)

greg k-h
