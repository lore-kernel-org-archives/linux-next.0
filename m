From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Fixes tag needs some work in the driver-core tree
Date: Mon, 11 Feb 2019 08:44:02 +0100
Message-ID: <20190211074402.GA7356@kroah.com>
References: <20190211074052.2407f1e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190211074052.2407f1e3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 11, 2019 at 07:40:52AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> In commit
> 
>   344c0152d878 ("selftests: firmware: fix verify_reqs() return value")
> 
> Fixes tag
> 
>   Fixes: a6a9be9270c87 ("selftests: firmware: return Kselftest Skip code for for skipped tests")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject

I don't understand, what is wrong with the fixes: tag here?

$ git show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n" a6a9be9270c87
a6a9be9270c8 ("selftests: firmware: return Kselftest Skip code for skipped tests")

How does that not match up?

Ah, an extra "for" in there.  Luis, you need to fix up your scripts, and
not be forced to manually type in those lines :)

thanks,

greg k-h
