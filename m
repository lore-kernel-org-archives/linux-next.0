From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH -next] metag: Fix ioremap_wc/ioremap_cached build errors
Date: Wed, 25 Mar 2015 11:30:41 +0100
Message-ID: <20150325103041.GA32429@kroah.com>
References: <1427113575-29222-1-git-send-email-james.hogan@imgtec.com>
 <20150323195401.GA863@kroah.com>
 <20150324080238.222953d5@canb.auug.org.au>
 <55117FDE.1030904@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55117FDE.1030904-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 24, 2015 at 03:16:46PM +0000, James Hogan wrote:
> On 23/03/15 21:02, Stephen Rothwell wrote:
> > Hi Greg,
> >=20
> > On Mon, 23 Mar 2015 20:54:01 +0100 Greg Kroah-Hartman <gregkh@linux=
foundation.org> wrote:
> >>
> >> On Mon, Mar 23, 2015 at 12:26:15PM +0000, James Hogan wrote:
> >>> When ioremap_wc() or ioremap_cached() are used without first incl=
uding
> >>> asm/pgtable.h, the _PAGE_CACHEABLE or _PAGE_WR_COMBINE definition=
s
> >>> aren't found, resulting in build errors like the following (in
> >>> next-20150323 due to "lib: devres: add a helper function for
> >>> ioremap_wc"):
> >>>
> >>> lib/devres.c: In function =E2=80=98devm_ioremap_wc=E2=80=99:
> >>> lib/devres.c:91: error: =E2=80=98_PAGE_WR_COMBINE=E2=80=99 undecl=
ared
> >>>
> >>> We can't easily include asm/pgtable.h in asm/io.h due to dependen=
cy
> >>> problems, so split out the _PAGE_* definitions from asm/pgtable.h=
 into a
> >>> separate asm/pgtable-bits.h header (as a couple of other architec=
tures
> >>> already do), and include that in io.h instead.
> >>>
> >>> Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> >>> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> >>> ---
> >>> GregKH: I can apply this patch to the metag tree for 4.0. However=
 commit
> >>> 34644524bce9 "lib: devres: add a helper function for ioremap_wc" =
in
> >>> your char-misc-next branch in next-20150323 will still break the =
metag
> >>> build until the two changes merge. How do you want to handle that=
?
> >>
> >> I don't know, I can't pull that into 4.0-final as it's not 4.0-fin=
al
> >> material.  So there's nothing I can do from my end, sorry.
> >=20
> > Am I missing something?  Why can't you just put that commit in your
> > char-misc-next branch along with the commit that causes the need fo=
r
> > that commit?  If James put it in it's own (non rebasing) branch, yo=
u
> > could even both merge it into your trees ...
>=20
> Greg: I've pushed a fix_ioremap_wc branch to:
> git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/metag.git
>=20
> based on v4.0-rc3, with just this patch. Feel free to merge it if you=
're
> happy to do so.

I've now done this, thanks.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
