From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the char-misc
 tree
Date: Wed, 20 Dec 2017 18:22:49 +0100
Message-ID: <20171220172249.GA5736@kroah.com>
References: <20171220071216.096a2d09@canb.auug.org.au>
 <20171220094102.GA18198@kroah.com>
 <6bb2f803-daa2-6b7a-b5a6-9d8037726d12@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6bb2f803-daa2-6b7a-b5a6-9d8037726d12@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 20, 2017 at 12:38:43PM +0000, Srinivas Kandagatla wrote:
> Hi Greg,
> 
> On 20/12/17 09:41, Greg KH wrote:
> > On Wed, Dec 20, 2017 at 07:12:16AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commits
> > > 
> > >    46a2bb5a7f7e ("slimbus: core: Add slim controllers support")
> > >    afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
> > > 
> > > are missing a Signed-off-by from their author.
> Sorry about this!
> 
> > 
> > I am guessing that Linaro doesn't know about the codeveloped-by new tag
> > here :(
> > 
> Do you want me to resend the series with missing Signed-off or
> Codeveloped-by tags?

It's ok, I have at least one signed-off-by on these from someone I can
go kick if something goes wrong :)

thanks,

greg k-h
