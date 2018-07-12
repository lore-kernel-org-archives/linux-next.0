From: Pavel Tatashin <pasha.tatashin@oracle.com>
Subject: Re: Boot failures with "mm/sparse: Remove CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER"
 on powerpc (was Re: mmotm 2018-07-10-16-50 uploaded)
Date: Thu, 12 Jul 2018 11:09:20 -0400
Message-ID: <CAGM2reb=KeLH7KKUP+7-u27nJxvTcBskhtS2cDH8SwiiEZ1jNQ@mail.gmail.com>
References: <20180710235044.vjlRV%akpm@linux-foundation.org>
 <87lgai9bt5.fsf@concordia.ellerman.id.au> <20180711133737.GA29573@techadventures.net>
 <CAGM2reYsSi5kDGtnTQASnp1v49T8Y+9o_pNxmSq-+m68QhF2Tg@mail.gmail.com>
 <CAOXBz7ixEK85S-029XrM4+g4fxtSY6_tke0gcQ-hOXFCb7wcZg@mail.gmail.com>
 <87efg981rd.fsf@concordia.ellerman.id.au> <20180712095002.GA5342@techadventures.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712095002.GA5342@techadventures.net>
Sender: linux-kernel-owner@vger.kernel.org
To: osalvador@techadventures.net
Cc: mpe@ellerman.id.au, osalvador.vilardaga@gmail.com, Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org, mhocko@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, mm-commits@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bhe@redhat.com, aneesh.kumar@linux.ibm.com, khandual@linux.vnet.ibm.com
List-Id: linux-next.vger.kernel.org

On Thu, Jul 12, 2018 at 5:50 AM Oscar Salvador
<osalvador@techadventures.net> wrote:
>
> > > I just roughly check, but if I checked the right place,
> > > vmemmap_populated() checks for the section to contain the flags we are
> > > setting in sparse_init_one_section().
> >
> > Yes.
> >
> > > But with this patch, we populate first everything, and then we call
> > > sparse_init_one_section() in sparse_init().
> > > As I said I could be mistaken because I just checked the surface.

Yes, this is right, sparse_init_one_section() is needed after every
populate call on ppc64. I am adding this to my sparse_init re-write,
and it actually simplifies code, as it avoids one extra loop, and
makes ppc64 to work.

Pavel
