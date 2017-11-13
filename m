From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 13 Nov 2017 13:29:47 +0100
Message-ID: <20171113122947.3svmlriqcrbeahyd@dhcp22.suse.cz>
References: <20171113164206.187a790d@canb.auug.org.au>
 <20171113080955.zcdzx2p5kzoa4d7s@dhcp22.suse.cz>
 <CAK8P3a36vx6fnXz=QWxqpCb3TC2XZeKLe3Or7Wvrac5=C3RaxA@mail.gmail.com>
 <20171113115430.pms47vgz5uszqsjm@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752526AbdKMM3t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 07:29:49 -0500
Content-Disposition: inline
In-Reply-To: <20171113115430.pms47vgz5uszqsjm@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon 13-11-17 12:54:30, Michal Hocko wrote:
> On Mon 13-11-17 12:43:08, Arnd Bergmann wrote:
> > On Mon, Nov 13, 2017 at 9:09 AM, Michal Hocko <mhocko@kernel.org> wrote:
> > > On Mon 13-11-17 16:42:06, Stephen Rothwell wrote:
> > >> Hi Andrew,
> > >>
> > >> After merging the akpm-current tree, today's linux-next build (powerpc
> > >> ppc64_defconfig) produced this warning:
> > >>
> > >> In file included from include/linux/mmzone.h:17:0,
> > >>                  from include/linux/mempolicy.h:10,
> > >>                  from mm/mempolicy.c:70:
> > >> mm/mempolicy.c: In function 'mpol_to_str':
> > >> include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
> > >>  #define nodemask_pr_args(maskp) (maskp) ? MAX_NUMNODES : 0, (maskp) ? (maskp)->bits : NULL
> > >>                                          ^
> > >> mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
> > >>            nodemask_pr_args(&nodes));
> > >>            ^
> > >
> > > Hmm, this warning is quite surprising to me. Sure in this particular
> > > case maskp will always be non-NULL so we always expand to
> > >         MAX_NUMNODES, maskp->bits
> > > which is what we want. But we have other users which may be NULL. Does
> > > anybody understan why this warns at all?
> > 
> > As I understand it, the warning tries to address a common typo of accidentally
> > testing the pointer to a stack object for being non-NULL, rather than the object
> > pointed to for being non-zero.
> > 
> > Adding an extra '!= NULL' comparison gets rid of the warning for me:
> > 
> > #define nodemask_pr_args(maskp)  \
> >    ((maskp) != NULL) ? MAX_NUMNODES : 0, \
> >    ((maskp) != NULL) ?(maskp)->bits : NULL
> 
> OK, that is a reasonable workaround. I was talking to our gcc guy and
> he suggested to report a bug for this.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82963

-- 
Michal Hocko
SUSE Labs
