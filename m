From: Rajat Jain <rajatja@google.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 net-next tree
Date: Wed, 15 Aug 2018 17:05:23 -0700
Message-ID: <CACK8Z6GbNozvdyrXdZyBEKKMC-U=puggpaPzMRWF0MAqC0Lf_g@mail.gmail.com>
References: <20180723151224.69a73892@canb.auug.org.au> <20180723062046.GA2577@kroah.com>
 <20180816094254.6e0bd68c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816094254.6e0bd68c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: greg@kroah.com, davem@davemloft.net, netdev@vger.kernel.org, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 15, 2018 at 4:43 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 23 Jul 2018 08:20:46 +0200 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jul 23, 2018 at 03:12:24PM +1000, Stephen Rothwell wrote:
> > >
> > > Today's linux-next merge of the driver-core tree got a conflict in:
> > >
> > >   fs/sysfs/group.c
> > >
> > > between commit:
> > >
> > >   5f81880d5204 ("sysfs, kobject: allow creating kobject belonging to arbitrary users")
> > >
> > > from the net-next tree and commit:
> > >
> > >   c855cf2759d2 ("sysfs: Fix internal_create_group() for named group updates")
> > >
> > > from the driver-core tree.
> > >
> > > I fixed it up (I think - see below) and can carry the fix as
> > > necessary. This is now fixed as far as linux-next is concerned, but any
> > > non trivial conflicts should be mentioned to your upstream maintainer
> > > when your tree is submitted for merging.  You may also want to consider
> > > cooperating with the maintainer of the conflicting tree to minimise any
> > > particularly complex conflicts.
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> > >
> > > diff --cc fs/sysfs/group.c
> > > index c7a716c4acc9,38240410f831..000000000000
> > > --- a/fs/sysfs/group.c
> > > +++ b/fs/sysfs/group.c
> > > @@@ -122,15 -118,23 +122,24 @@@ static int internal_create_group(struc
> > >                     kobj->name, grp->name ?: "");
> > >             return -EINVAL;
> > >     }
> > >  +  kobject_get_ownership(kobj, &uid, &gid);
> > >     if (grp->name) {
> > > -           kn = kernfs_create_dir_ns(kobj->sd, grp->name,
> > > -                                     S_IRWXU | S_IRUGO | S_IXUGO,
> > > -                                     uid, gid, kobj, NULL);
> > > -           if (IS_ERR(kn)) {
> > > -                   if (PTR_ERR(kn) == -EEXIST)
> > > -                           sysfs_warn_dup(kobj->sd, grp->name);
> > > -                   return PTR_ERR(kn);
> > > +           if (update) {
> > > +                   kn = kernfs_find_and_get(kobj->sd, grp->name);
> > > +                   if (!kn) {
> > > +                           pr_warn("Can't update unknown attr grp name: %s/%s\n",
> > > +                                   kobj->name, grp->name);
> > > +                           return -EINVAL;
> > > +                   }
> > > +           } else {
> > >  -                  kn = kernfs_create_dir(kobj->sd, grp->name,
> > >  -                                         S_IRWXU | S_IRUGO | S_IXUGO,
> > >  -                                         kobj);
> > > ++                  kn = kernfs_create_dir_ns(kobj->sd, grp->name,
> > > ++                                            S_IRWXU | S_IRUGO | S_IXUGO,
> > > ++                                            uid, gid, kobj, NULL);
> > > +                   if (IS_ERR(kn)) {
> > > +                           if (PTR_ERR(kn) == -EEXIST)
> > > +                                   sysfs_warn_dup(kobj->sd, grp->name);
> > > +                           return PTR_ERR(kn);
> > > +                   }
> > >             }
> > >     } else
> > >             kn = kobj->sd;
> >
> >
> > I think this is correct.  Rajat, can you verify it please?

Sorry, I saw this very late. Yes, this is correct.

>
>
> This is now a conflict between Linus' tree and the driver-core tree.

Greg, please let me know if there is anything I need to do about this.

Thanks & Best Regards,

Rajat

> --
> Cheers,
> Stephen Rothwell
