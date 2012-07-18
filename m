From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: Trees and MAINTAINERS of random drivers?
Date: Wed, 18 Jul 2012 14:17:09 -0400
Message-ID: <20120718181709.GC22107@thunk.org>
References: <CA+icZUVPS=xkm0+=6JZPGmT9BRJgbGav3AHCgpYuvt-71+xhmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUVPS=xkm0+=6JZPGmT9BRJgbGav3AHCgpYuvt-71+xhmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Matt Mackall <mpm@selenic.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 18, 2012 at 01:09:04PM +0200, Sedat Dilek wrote:
> [3] lists Ted as new random driver maintainer, but in [4] I found Matt
> as maintainer:
> 
> 5656 RANDOM NUMBER DRIVER
> 5657 M:      Matt Mackall <mpm@selenic.com>
> 5658 S:      Maintained
> 5659 F:      drivers/char/random.c
> 
> I do not think that this is still correct and furthermore in Ted's
> random.git#dev tree I see commits changing "drivers/char/random.c"
> file.
> So, that above block should IMHO be dropped and "F:
> drivers/char/random.c" added to [6]?

Oh, I see, I screwed up my update to the MAINTAINERS file and updated
the wrong block.  I'll fix it....

					- Ted
