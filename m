From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 10:55:30 +0100
Message-ID: <AANLkTinVO8Mf4LnSj5fbtpHXHtwc8Wf306XEDgaqH437@mail.gmail.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
	<AANLkTikbiART+SX_JwM=pcAg0NJffVgX1oU=aO42dmbC@mail.gmail.com>
	<20101227201155.ee8cd1ab.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101227201155.ee8cd1ab.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 27, 2010 at 10:11 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi,
>
> On Mon, 27 Dec 2010 09:04:06 +0100 Sedat Dilek <sedat.dilek@googlemai=
l.com> wrote:
>>
>> Can you try to upload/push via IPADDR?
>
> I can only upload to master.kernel.org, the rest is done by the mirro=
ring
> software. =C2=A0I have no access to any of the other kernel.org machi=
nes.
>

I was wondering about still "slow mirrors" as also checking out before
Xmas was very slow.
Now, seeing from an end-users point, the checking-out is just fine.
I tried to clone
"$GIT_MIRROR/pub/scm/linux/kernel/git/npiggin/linux-npiggin.git" where
GIT_MIRROR was:

1. git://130.239.17.7
2. git://199.6.1.166
3. git//git.kernel.org
4. git//git.eu.kernel.org

All checkouts had around 680-690KiB/s.

[...]

>> Can you please upload the patch-diff to
>> <http://www.kernel.org/pub/linux/kernel/v2.6/next/>?
>
> If you mean for next-20101223, then there wasn't one. =C2=A0I ran out=
 of time
> and just threw away what I had done.
>
> If you mean generally, then (see above) it depends on the mirroring
> software.
>

Dunno what you mean with "mirroring software", but I am primarily
interested in the patch-v2.6.37-rc7-next-20101227 than in an updated
linux-next GIT repo.
IMHO, it should be possible to generate this patch from your local GIT
repo and upload the diff-patch to whereever is fast and accessible by
you.
My kernel-build-system has as base a vanilla upstream (here:
2.6.37-rc7) against which I apply an individual patch-series incl. the
linux-next diff-patch.
Hope this helps a bit to understand what I was talking about.

- Sedat -
