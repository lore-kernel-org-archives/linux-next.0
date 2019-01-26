From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: linux-next: Fixes tag needs some work in the input-current tree
Date: Sat, 26 Jan 2019 10:16:25 +0100
Message-ID: <3d51c2e2936c5901ac2c4ecf96f217e4449addc3.camel@v3.sk>
References: <20190124220954.2147f1da@canb.auug.org.au>
         <CAKdAkRRBVDd80e4zjmwqqMH-dt4-1paVdrriu2Fn=-Zv+7qgrg@mail.gmail.com>
         <CAKdAkRTzN+Zg-9LSdx2uSAV6_u8ytQZCVxJyRaKhKSNf+3teRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKdAkRTzN+Zg-9LSdx2uSAV6_u8ytQZCVxJyRaKhKSNf+3teRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2019-01-25 at 15:58 -0800, Dmitry Torokhov wrote:
> On Fri, Jan 25, 2019 at 3:56 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > Hi Stephen,
> > 
> > On Thu, Jan 24, 2019 at 3:09 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Hi Dmitry,
> > > 
> > > In commit
> > > 
> > >   ec87da107d11 ("Input: olpc_apsp - assign priv->dev earlier")
> > > 
> > > Fixes tag
> > > 
> > >   Fixes: commit af518342effd ("Input: olpc_apsp - check FIFO status on open(), not probe()")
> > > 
> > > has these problem(s):
> > > 
> > >   - No SHA1 recognised
> > > 
> > > The "commit" at the start of the tag value was unexpected.
> > 
> > Hmm, this is really weird:
> > 
> > dtor@dtor-ws:~/kernel/master (for-linus)$ git log --oneline --
> > drivers/input/serio/olpc_apsp.c
> > ec87da107d11 Input: olpc_apsp - assign priv->dev earlier
> > 2a58dd767bf9 Input: olpc_apsp - remove set but not used variable 'np'
> > ed22cee91a88 Input: olpc_apsp - enable the SP clock
> > af518342effd Input: olpc_apsp - check FIFO status on open(), not probe()
> > 
> > As you can see there is that SHA1 in question present in my for-linus branch.
> 
> Argh, I see what you mean, the word "commit" should be omitted. Oh
> well, it's in the branch that I loath to rebase, so it will have to
> stay as is.

Sorry for this. I included the word "commit" because checkpatch.pl
actually complains when it's missing when a commit is referenced
outside the tags in the commit message.

I actually did a quick search for /Fixes: commit/ in the git log at the
time, but apparently it's a common mistake to make...

Perhaps I can see if I can teach checkpatch.pl to warn about this in
future.

Lubo
