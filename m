From: Nishanth Aravamudan <nacc@linux.vnet.ibm.com>
Subject: Re: mmotm 2014-04-22-15-20 uploaded (uml 32- and 64-bit defconfigs)
Date: Wed, 23 Apr 2014 12:24:59 -0700
Message-ID: <20140423192459.GG4335@linux.vnet.ibm.com>
References: <20140422222121.2FAB45A431E@corp2gmr1-2.hot.corp.google.com>
 <5357F405.20205@infradead.org>
 <20140423134131.778f0d0a@redhat.com>
 <5357FCEB.2060507@infradead.org>
 <20140423141600.4a303d95@redhat.com>
 <20140423112442.5a5c8f23d580a65575e0c5fc@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20140423112442.5a5c8f23d580a65575e0c5fc@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luiz Capitulino <lcapitulino@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

On 23.04.2014 [11:24:42 -0700], Andrew Morton wrote:
> On Wed, 23 Apr 2014 14:16:00 -0400 Luiz Capitulino <lcapitulino@redhat.com> wrote:
> 
> > On Wed, 23 Apr 2014 10:48:27 -0700
> > > >>> You will need quilt to apply these patches to the latest Linus release (3.x
> > > >>> or 3.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> > > >>> http://ozlabs.org/~akpm/mmotm/series
> > > >>>
> > > >>
> > > >> include/linux/hugetlb.h:468:9: error: 'HPAGE_SHIFT' undeclared (first use in this function)
> > > > 
> > > > The patch adding HPAGE_SHIFT usage to hugetlb.h in current mmotm is this:
> > > > 
> > > > http://www.ozlabs.org/~akpm/mmotm/broken-out/hugetlb-ensure-hugepage-access-is-denied-if-hugepages-are-not-supported.patch
> > > > 
> > > > But I can't reproduce the issue to be sure what the problem is. Are you
> > > > building the kernel on 32bits? Can you provide the output of
> > > > "grep -i huge .config" or send your .config in private?
> > > > 
> > > 
> > > [adding Richard to cc:]
> > > 
> > > 
> > > As in $subject, if I build uml x86 32-bit or 64-bit defconfig, the build fails with
> > > this error.
> > 
> > Oh, I missed the subject info completely. Sorry about that.
> > 
> > So, the issue really seems to be introduced by patch:
> > 
> >  hugetlb-ensure-hugepage-access-is-denied-if-hugepages-are-not-supported.patch
> > 
> > And the problem is that UML doesn't define HPAGE_SHIFT. The following patch
> > fixes it, but I'll let Nishanth decide what to do here.
> 
> I'll try moving hugepages_supported() into the #ifdef
> CONFIG_HUGETLB_PAGE section.

This does seem like the right fix, I apologize for not doing enough
build coverage!

Acked-by: Nishanth Aravamudan <nacc@linux.vnet.ibm.com>

> --- a/include/linux/hugetlb.h~hugetlb-ensure-hugepage-access-is-denied-if-hugepages-are-not-supported-fix-fix
> +++ a/include/linux/hugetlb.h
> @@ -412,6 +412,16 @@ static inline spinlock_t *huge_pte_lockp
>  	return &mm->page_table_lock;
>  }
> 
> +static inline bool hugepages_supported(void)
> +{
> +	/*
> +	 * Some platform decide whether they support huge pages at boot
> +	 * time. On these, such as powerpc, HPAGE_SHIFT is set to 0 when
> +	 * there is no such support
> +	 */
> +	return HPAGE_SHIFT != 0;
> +}
> +
>  #else	/* CONFIG_HUGETLB_PAGE */
>  struct hstate {};
>  #define alloc_huge_page_node(h, nid) NULL
> @@ -460,14 +470,4 @@ static inline spinlock_t *huge_pte_lock(
>  	return ptl;
>  }
> 
> -static inline bool hugepages_supported(void)
> -{
> -	/*
> -	 * Some platform decide whether they support huge pages at boot
> -	 * time. On these, such as powerpc, HPAGE_SHIFT is set to 0 when
> -	 * there is no such support
> -	 */
> -	return HPAGE_SHIFT != 0;
> -}
> -
>  #endif /* _LINUX_HUGETLB_H */
> _
> 

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
