From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH -next] metag: Fix ioremap_wc/ioremap_cached build errors
Date: Mon, 23 Mar 2015 20:54:01 +0100
Message-ID: <20150323195401.GA863@kroah.com>
References: <1427113575-29222-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427113575-29222-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 23, 2015 at 12:26:15PM +0000, James Hogan wrote:
> When ioremap_wc() or ioremap_cached() are used without first includin=
g
> asm/pgtable.h, the _PAGE_CACHEABLE or _PAGE_WR_COMBINE definitions
> aren't found, resulting in build errors like the following (in
> next-20150323 due to "lib: devres: add a helper function for
> ioremap_wc"):
>=20
> lib/devres.c: In function =E2=80=98devm_ioremap_wc=E2=80=99:
> lib/devres.c:91: error: =E2=80=98_PAGE_WR_COMBINE=E2=80=99 undeclared
>=20
> We can't easily include asm/pgtable.h in asm/io.h due to dependency
> problems, so split out the _PAGE_* definitions from asm/pgtable.h int=
o a
> separate asm/pgtable-bits.h header (as a couple of other architecture=
s
> already do), and include that in io.h instead.
>=20
> Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> ---
> GregKH: I can apply this patch to the metag tree for 4.0. However com=
mit
> 34644524bce9 "lib: devres: add a helper function for ioremap_wc" in
> your char-misc-next branch in next-20150323 will still break the meta=
g
> build until the two changes merge. How do you want to handle that?

I don't know, I can't pull that into 4.0-final as it's not 4.0-final
material.  So there's nothing I can do from my end, sorry.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
