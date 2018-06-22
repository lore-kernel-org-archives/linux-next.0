From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH -next] cred: conditionally declare groups-related functions
Date: Fri, 22 Jun 2018 09:47:16 +0200
Message-ID: <CAFqZXNs_cKtTZKGkhL4KwTweKEMdVwgS0RAQS_Soqw1c1HSNyw@mail.gmail.com>
References: <CAHC9VhQv26uPWSYmhNdhJ4QM+AMKK=JFkMmDftLb1WpvOUyN8Q@mail.gmail.com>
 <20180621083316.8765-1-omosnace@redhat.com> <CAHC9VhQk42UA5c_XAaG20h3TZt20TQyJxDMfqWHHgu2=8+kcVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhQk42UA5c_XAaG20h3TZt20TQyJxDMfqWHHgu2=8+kcVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: akpm@linux-foundation.org, rdunlap@infradead.org, sfr@canb.auug.org.au, Eric Paris <eparis@redhat.com>, Linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Linux-Audit Mailing List <linux-audit@redhat.com>
List-Id: linux-next.vger.kernel.org

št 21. 6. 2018 o 23:17 Paul Moore <paul@paul-moore.com> napísal(a):
>
> On Thu, Jun 21, 2018 at 4:33 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > The groups-related functions declared in include/linux/cred.h are
> > defined in kernel/groups.c, which is compiled only when
> > CONFIG_MULTIUSER=y. Move all these function declarations under #ifdef
> > CONFIG_MULTIUSER to help avoid accidental usage in contexts where
> > CONFIG_MULTIUSER might be disabled.
> >
> > This patch also adds a fallback for groups_search(). Currently this
> > function is only called from kernel/groups.c itself and
> > keys/permissions.c, which depends on CONFIG_MULTIUSER. However, the
> > audit subsystem (which does not depend on CONFIG_MULTIUSER) calls this
> > function in -next, so the fallback will be needed to avoid compilation
> > errors or ugly workarounds.
> >
> > See also:
> > https://lkml.org/lkml/2018/6/20/670
> > https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git/commit/?h=next&id=af85d1772e31fed34165a1b3decef340cf4080c0
> >
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >  include/linux/cred.h | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/cred.h b/include/linux/cred.h
> > index 631286535d0f..8917768453cc 100644
> > --- a/include/linux/cred.h
> > +++ b/include/linux/cred.h
> > @@ -65,6 +65,12 @@ extern void groups_free(struct group_info *);
> >
> >  extern int in_group_p(kgid_t);
> >  extern int in_egroup_p(kgid_t);
> > +
> > +extern int set_current_groups(struct group_info *);
> > +extern void set_groups(struct cred *, struct group_info *);
> > +extern int groups_search(const struct group_info *, kgid_t);
> > +extern bool may_setgroups(void);
> > +extern void groups_sort(struct group_info *);
> >  #else
> >  static inline void groups_free(struct group_info *group_info)
> >  {
> > @@ -78,12 +84,12 @@ static inline int in_egroup_p(kgid_t grp)
> >  {
> >          return 1;
> >  }
> > +
> > +static inline int groups_search(const struct group_info *group_info, kgid_t grp)
> > +{
> > +       return 0;
>
> Is this the right fallback value?  If CONFIG_MULTIUSER is disabled,
> wouldn't we always want to indicate a group match?  The in_group_p()
> and in_egroup_p() dummy functions would seem to indicate that is the
> correct behavior ...

Hm, indeed this is a bit tricky and I'm guilty of not noticing this...

The way I see it (now that I though about it a little), there are
basically two possible semantics of groups_search():
1. as an (auxiliary) permissions checking function (like
in_[e]group_p()) -- in this case we would expect the same return value
as in_group_p(), i.e. 1.
2. as a function that simply checks if a group is contained in a list
of groups (taken from a cred struct) -- in this case we would expect
it to return 0 in single-user mode, since there will be always no
supplemental groups set for any task (if I understand it right).

I guess no matter which semantic we pick, we might confuse someone
expecting the other one, so I would suggest dropping this patch (or at
least the fallbacks for groups_search) and explicitly handle the
single-user case in audit.

We should probably default to 1 in audit anyway, because the original
code used in_[e]group_p(). Even though 0 would seem more logical to
me, comparing GIDs doesn't really make sense in single-user mode
anyway, so keeping the legacy behavior will be safer. (In fact now
that I think of it, having audit enabled (or even compiled) in
single-user mode does not make much sense either... maybe we should
just make CONFIG_AUDIT depend on CONFIG_MULTIUSER...).

>
> > +}
> >  #endif
> > -extern int set_current_groups(struct group_info *);
> > -extern void set_groups(struct cred *, struct group_info *);
> > -extern int groups_search(const struct group_info *, kgid_t);
> > -extern bool may_setgroups(void);
> > -extern void groups_sort(struct group_info *);
> >
> >  /*
> >   * The security context of a task
> > --
> > 2.17.1
> >
>
>
> --
> paul moore
> www.paul-moore.com

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
