From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Tue, 28 Nov 2017 23:41:11 +0000
Message-ID: <20171128234111.GB19925@flint.armlinux.org.uk>
References: <20171129101637.1e4c7af3@canb.auug.org.au>
 <20171128231959.GU8052@flint.armlinux.org.uk>
 <20171129103805.767cc813@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129103805.767cc813@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Pitre <nico@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 29, 2017 at 10:38:05AM +1100, Stephen Rothwell wrote:
> Hi Russell,
> 
> On Tue, 28 Nov 2017 23:19:59 +0000 Russell King <rmk@armlinux.org.uk> wrote:
> >
> > Stephen, which binutils version are you using?
> 
> GNU ld (GNU Binutils) 2.25.2
> 
> built from upstream source some time ago.

Hmm, so slightly younger than mine (2.25) which also generates the
warnings.

-- 
Russell King
ARM architecture Linux Kernel maintainer
