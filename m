From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: Tree for Nov 7
Date: Wed, 8 Nov 2017 15:20:50 +0100
Message-ID: <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
References: <20171107162217.382cd754@canb.auug.org.au>
 <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Wed 08-11-17 08:52:24, Joel Stanley wrote:
> Hello Michal,
> 
> On Tue, Nov 7, 2017 at 3:52 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Changes since 20171106:
> >
> > The powerpc tree still had its build failure for which I applied a patch.
> >
> > The crypto tree lost its build failure.
> >
> > The akpm tree still had its build failure for which I reverted a commit.
> >
> > Non-merge commits (relative to Linus' tree): 10912
> >  10165 files changed, 524042 insertions(+), 247066 deletions(-)
> 
> I tried to boot this -next tree built for the ARM platform I maintain,
> and it did not make it to userspace. When I revert your patch
> "fs/binfmt_elf.c: drop MAP_FIXED usage from elf_map" the system boots
> as expected.
> 
> There are a lot of messages on the way up that look like this:
> 
> [    2.527460] Uhuuh, elf segement at 000d9000 requested but the
> memory is mapped already
> [    2.540160] Uhuuh, elf segement at 000d9000 requested but the
> memory is mapped already
> [    2.546153] Uhuuh, elf segement at 000d9000 requested but the
> memory is mapped already
> 
> And then trying to run userspace looks like this:

Could you please run with debugging patch posted
http://lkml.kernel.org/r/20171107102854.vylrtaodla63kc57@dhcp22.suse.cz
-- 
Michal Hocko
SUSE Labs
