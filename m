From: Luca Coelho <luca@coelho.fi>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Thu, 12 Oct 2017 22:02:28 +0300
Message-ID: <1507834948.5497.9.camel@coelho.fi>
References: <20171012172512.tlsdjhppfz2hu4vr@sirena.co.uk>
         <1507832196.5497.1.camel@intel.com>
         <20171012182114.fdeiv67ebx7c63te@sirena.co.uk>
         <1507832866.5497.2.camel@intel.com>
         <20171012183505.oo77lgdbmqjevsuo@sirena.co.uk>
         <1507834251.5497.7.camel@coelho.fi>
         <20171012185944.bip4cdk7bd4d6mpc@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012185944.bip4cdk7bd4d6mpc@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, Shahar S Matityahu <shahar.s.matityahu@intel.com>, Wireless <linux-wireless@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2017-10-12 at 19:59 +0100, Mark Brown wrote:
> On Thu, Oct 12, 2017 at 09:50:51PM +0300, Luca Coelho wrote:
> > On Thu, 2017-10-12 at 19:35 +0100, Mark Brown wrote:
> > > With trees like this that don't coordinate with their fixes
> > > branch
> > > there
> > > are frequently multiple conflicts introduced so I generally
> > > report
> > > things file by file without even looking at the new ones.
> > Sorry for the trouble.  But how do you suggest that we "coordinate
> > our
> > fixes branch"? Merge fixes into the main tree?
> 
> That'd be easiest for me!  It's not of necessity a problem if the
> conflicts are easy enough to resolve if you just let things get
> merged
> in -next, it's just more an observation that that's a thing that
> happens
> and that this is how I cope with it.  Stephen may do things a bit
> differently.

Cool, I'll discuss this with Kalle and make sure I note these potential
conflicts early enough so everyone is aware when they're coming.

Thanks for taking over while Stephen is away! I really appreciate it,
since linux-next is a very important part of our process. :)

--
Luca.
