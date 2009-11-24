From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 24 Nov 2009 10:40:57 +0000
Message-ID: <20091124104057.GA22771@opensource.wolfsonmicro.com>
References: <20091124163753.381d9a83.sfr@canb.auug.org.au> <20091124095715.GA20505@rakim.wolfsonmicro.main> <20091124211433.cd1b7e96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932679AbZKXKkx@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091124211433.cd1b7e96.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 24, 2009 at 09:14:33PM +1100, Stephen Rothwell wrote:

> Sorry, I don't have the actual config (as I overwrite my build directory
> between each merge).  However, if I checkout the mfd tree (alone -
> nothing else in linux-next) and do "make ARCH=x86_64 allmodconfig", I get
> the following in my .config:

> CONFIG_I2C=m
> CONFIG_MFD_CORE=m
> CONFIG_MFD_WM831X=y

Oh, fail.  This is nothing to do with select, it's to do with bool.
Kbuild doesn't propagate the dependency from the boolean (which makes
sense for a lot of uses but not for this one).  The current "fix" used
by other drivers in the same situation is to depend on I2C=y which works
but means that we loose build coverage from allmodconfig.  I'll post a
patch for this shortly.
