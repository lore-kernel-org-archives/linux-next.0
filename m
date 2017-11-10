From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: Tree for Nov 7
Date: Fri, 10 Nov 2017 13:30:54 +0100
Message-ID: <20171110123054.5pnefm3mczsfv7bz@dhcp22.suse.cz>
References: <20171107162217.382cd754@canb.auug.org.au>
 <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
 <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Joel,

On Wed 08-11-17 15:20:50, Michal Hocko wrote:
[...]
> > There are a lot of messages on the way up that look like this:
> > 
> > [    2.527460] Uhuuh, elf segement at 000d9000 requested but the
> > memory is mapped already
> > [    2.540160] Uhuuh, elf segement at 000d9000 requested but the
> > memory is mapped already
> > [    2.546153] Uhuuh, elf segement at 000d9000 requested but the
> > memory is mapped already
> > 
> > And then trying to run userspace looks like this:
> 
> Could you please run with debugging patch posted
> http://lkml.kernel.org/r/20171107102854.vylrtaodla63kc57@dhcp22.suse.cz

Did you have chance to test with this debugging patch, please?

-- 
Michal Hocko
SUSE Labs
