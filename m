From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: Tree for Feb 24
Date: Wed, 24 Feb 2016 09:37:19 -0500
Message-ID: <20160224143719.GE7382@kvack.org>
References: <20160224163414.260db0ec@canb.auug.org.au> <CA+icZUVeY1-HbhQChpC=vwJO7Fk+3d07UFmDxW13vaoVEUTk9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-aio@kvack.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUVeY1-HbhQChpC=vwJO7Fk+3d07UFmDxW13vaoVEUTk9g@mail.gmail.com>
Sender: owner-linux-aio@kvack.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-aio@kvack.org
List-Id: linux-next.vger.kernel.org

On Wed, Feb 24, 2016 at 07:32:17AM +0100, Sedat Dilek wrote:
> On Wed, Feb 24, 2016 at 6:34 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Changes since 20160223:
> >
> ...
> > The aio tree still had a build failure so I used the version from
> > next-20160111.
> >
> 
> Might be good to poke the maintainer as I am seeing this for a long
> time in Linux-next.

These are architecture code related build failures that arch maintainers 
need to fix.  Avoiding pulling the tree allows people to ignore the issue, 
which isn't going to get things fixed.  I provided an example how to 
implement the 64 bit __get_user() without generating warnings, and it is 
now up to maintainers to adapt it for their architecture.

		-ben

> - Sedat -

-- 
"Thought is the essence of where you are now."

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
