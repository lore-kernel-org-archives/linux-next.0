From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: unable to fetch the arm tree
Date: Mon, 14 Nov 2016 10:22:19 +0000
Message-ID: <20161114102219.GE17314@flint.armlinux.org.uk>
References: <20161114092922.2963d6d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161114092922.2963d6d8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 14, 2016 at 09:29:22AM +1100, Stephen Rothwell wrote:
> Hi Russell,
> 
> I could not fetch the arm or arm-current trees
> (git://git.armlinux.org.uk/~rmk/linux-arm.git) this morning:
> 
> fatal: remote error: access denied or repository not exported: ~rmk/linux-arm.git
> 
> I will use the previous versions that I have.

Gah, that's down to selinux having an argument over how the repository
should be labelled - different parts of the system want different
labels on that.  selinux is sometimes a nightmare.

Should be fixed now.

-- 
Russell King
ARM architecture Linux Kernel maintainer
