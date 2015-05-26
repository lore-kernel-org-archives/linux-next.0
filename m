From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Tue, 26 May 2015 12:08:13 +0100
Message-ID: <20150526110813.GC3999@e103592.cambridge.arm.com>
References: <20150525181938.278a605c@canb.auug.org.au>
 <20150525162821.GI9772@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150525162821.GI9772@kroah.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jakub Kicinski <kubakici@wp.pl>
List-Id: linux-next.vger.kernel.org

On Mon, May 25, 2015 at 05:28:21PM +0100, Greg KH wrote:
> On Mon, May 25, 2015 at 06:19:38PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the tty tree got a conflict in
> > drivers/tty/serial/amba-pl011.c between commit 43dd1f9a5b05
> > ("serial/amba-pl011: Unconditionally poll for FIFO space before each TX
> > char") from the tty.current tree and commit 1e84d22322ce
> > ("serial/amba-pl011: Refactor and simplify TX FIFO handling") from the
> > tty tree.
> > 
> > I fixed it up (I just used the version from the tty tree) and can carry
> > the fix as necessary (no action is required).
> 
> Thanks, that's the correct fix, Dave predicted this would happen :)

Agreed (and thanks to Stephen for flagging up the mismerge affecting
these patches the first time around).

Cheers
---Dave
