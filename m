From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH -next v2] cred: conditionally declare groups-related functions
Date: Tue, 26 Jun 2018 10:12:58 +0200
Message-ID: <CAFqZXNs5y4AWCnPntGhR_DcrX1d-6h4uPuMKy-WoyCN2Wh1H+A@mail.gmail.com>
References: <20180625065532.7268-1-omosnace@redhat.com> <CAHC9VhSQwAH1k-cnpQ4iYs-gtHiQRfFvX9aSVW1_-cFEtJ1JCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhSQwAH1k-cnpQ4iYs-gtHiQRfFvX9aSVW1_-cFEtJ1JCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Eric Paris <eparis@redhat.com>, Linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Linux-Audit Mailing List <linux-audit@redhat.com>, dhowells@redhat.com
List-Id: linux-next.vger.kernel.org

po 25. 6. 2018 o 23:04 Paul Moore <paul@paul-moore.com> napísal(a):
>
> On Mon, Jun 25, 2018 at 2:56 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> >  include/linux/cred.h | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/cred.h b/include/linux/cred.h
> > index 631286535d0f..7eed6101c791 100644
> > --- a/include/linux/cred.h
> > +++ b/include/linux/cred.h
> > @@ -65,6 +65,12 @@ extern void groups_free(struct group_info *);
> >
> >  extern int in_group_p(kgid_t);
> >  extern int in_egroup_p(kgid_t);
> > +extern int groups_search(const struct group_info *, kgid_t);
> > +
> > +extern int set_current_groups(struct group_info *);
> > +extern void set_groups(struct cred *, struct group_info *);
> > +extern bool may_setgroups(void);
> > +extern void groups_sort(struct group_info *);
> >  #else
> >  static inline void groups_free(struct group_info *group_info)
> >  {
> > @@ -78,12 +84,11 @@ static inline int in_egroup_p(kgid_t grp)
> >  {
> >          return 1;
> >  }
> > +static inline int groups_search(const struct group_info *group_info, kgid_t grp)
> > +{
> > +       return 1;
> > +}
> >  #endif
> > -extern int set_current_groups(struct group_info *);
> > -extern void set_groups(struct cred *, struct group_info *);
> > -extern int groups_search(const struct group_info *, kgid_t);
> > -extern bool may_setgroups(void);
> > -extern void groups_sort(struct group_info *);
>
> I was going through the list of functions to make sure it was safe to
> move all of these under CONFIG_MULTIUSER and I believe there may be an
> issue with key_task_permission() and groups_search(), specifically one
> can disable CONFIG_MULTIUSER yet keep CONFIG_KEYS enabled.

Oh, you're right, CONFIG_KEYS does not depend on CONFIG_MULTIUSER, for
some reason I was looking at CONFIG_SECURITY instead, which does :/ I
will need to update the commit message...

> I'm going to guess that the fix is going to be to have CONFIG_KEYS
> depend on CONFIG_MULTIUSER, but I would talk with the keys folks (I've
> CC'd David Howells) to see what they would prefer.

I was wondering why the security/keys/permissions.c did not give the
link error and it turns out that it is due to the definition of
__kgid_val(), which is hard-coded to 0 if CINFIG_MULTIUSER=n, so the
compiler just optimizes out most of the code in key_task_permission()
(including the groups_search() call). Thus, for permissions.c it does
not matter which fallback we choose (and since this patch always
defines groups_search(), it will not lead to compile errors in
permissions.c either).

TL;DR: There is no need to fix anything in the keys code (beyond this
patch). I also checked the other functions and they are only used in
places that either depend on MULTIUSER or use also groups_alloc(),
which is already declared only when CONFIG_MULTIUSER=y.

>
> --
> paul moore
> www.paul-moore.com

--
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
