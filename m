From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the asm-generic
 tree
Date: Wed, 21 Mar 2018 12:06:27 +0000
Message-ID: <20180321120612.GA16308@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 21, 2018 at 09:38:28AM +0000, Arnd Bergmann wrote:
> On Wed, Mar 21, 2018 at 6:50 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Today's linux-next merge of the arm64 tree got a conflict in:
> >
> >   include/uapi/asm-generic/siginfo.h
> >
> > between commit:
> >
> >   0d7d2a23a347 ("asm-generic: siginfo: define ia64 si_codes unconditionally")
> >
> > from the asm-generic tree and commit:
> >
> >   266da65e9156 ("signal: Add FPE_FLTUNK si_code for undiagnosable fp exceptions")
> >
> > from the arm64 tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> >  +#define __FPE_INVDEC  13      /* invalid decimal digit */
> > - #define NSIGFPE               13
> > + #define FPE_FLTUNK    14      /* undiagnosed floating-point exception */
> > + #define NSIGFPE               14
> 
> The merge looks correct to me. I'm still rebasing my asm-generic tree
> to integrate incoming Acks, so I think we're stuck with this one for a
> bit.

Ack.

There are some overlapping patches here due to Eric's signal rework,
related arch fixes and apparently some other unrelated updates.

IIUC, some patches overlap between arm64's and Eric's -next trees for
dependency reasons, but I believe the affected arm64 patches are due to
merge via Eric's tree for v4.17.

Cheers
---Dave
