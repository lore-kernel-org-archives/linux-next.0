From: Theodore Tso <tytso@mit.edu>
Subject: Re: next-20090310: ext4 hangs
Date: Tue, 10 Mar 2009 11:47:45 -0400
Message-ID: <20090310154745.GF23075@mit.edu>
References: <a4423d670903100517y42f342d4pd73c4c36f5c64dd7@mail.gmail.com> <20090310124658.GE8840@mit.edu> <a4423d670903100718w1a532143he767782ae598d0fb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-ext4-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a4423d670903100718w1a532143he767782ae598d0fb@mail.gmail.com>
Sender: linux-ext4-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 10, 2009 at 05:18:55PM +0300, Alexander Beregalov wrote:
> > Thanks for reporting this; does it show up on stock 2.6.29-rc7?
> No, I can not reproduce it.
> It is a slow system, I would not like to bisect it, only if it is the
> last possibility.

Just to be clear; you weren't able to reproduce it on stock 2.6.29-rc7
---- does it reproduce easily on linux-next?

Next question --- does the system hang completely, or just the dbench
process (and probably any process that tries touching the filesystem
that's hung up)?  Do you have a serial console, or someone of
recording all of the dumps coming from sysrq-t?  The two stack traces
you gave weren't the ones causing the problem, but rather the ones
waiting for the journal lock.  

I don't think is related to BZ #12579, although some of the symptoms
look superficially the same.

							- Ted

P.S.  What are your dbench parameters, and how big is your filesystem,
so I can try to reproduce it on my side?  And how long do you
typically need to run before this triggers?  Thanks!
