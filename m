From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Fri, 30 Nov 2018 01:27:07 +0000
Message-ID: <20181130012707.GK2217@ZenIV.linux.org.uk>
References: <20181127115246.00967523@canb.auug.org.au>
 <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
 <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAHC9VhRthWKfgYenGq6Az+jVQ+76wCeBhBcMyo9zZwv+nBhy3A@mail.gmail.com>
 <20181129235130.GI2217@ZenIV.linux.org.uk>
 <84796ec6-2603-7957-b159-e4c8b1e7362c@schaufler-ca.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <84796ec6-2603-7957-b159-e4c8b1e7362c@schaufler-ca.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>, omosnace@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2018 at 04:57:20PM -0800, Casey Schaufler wrote:

> > Question: what *should* happen if we try to cross into a submount and find
> > that the thing on the other side is already mounted elsewhere, with incompatible
> > LSM options?  Ditto for referrals, with an extra twist - what if we are given
> > 3 alternatives, the first two already mounted elsewhere with incompatible
> > options, the third one not mounted anywhere yet?
> 
> I fear that the safe answer and the containers answer are likely
> to differ. The safe answer has to be to refuse the mount.
> 
> > Incidentally, should smack have ->sb_clone_mnt_opts()?
> 
> Probably, but I could never figure out what it was for,
> and haven't identified a problem with not using it.

Transferring the Linux S&M options when crossing into a submount.

Frankly, the set of mount-related hooks is atrocious - way too much
duplication between them (sb_kern_mount vs. sb_set_mnt_opts vs.
sb_parse_opts_str vs. sb_clone_mnt_opts) and that, actually, is the
worst part of safely untangling the mount-API series ;-/

And then there's sb_mount, with 3 instances and arseloads of
races in 2 out of 3.  Consider e.g. this:
        if (need_dev) {
                /* Get mount point or device file. */
                if (!dev_name || kern_path(dev_name, LOOKUP_FOLLOW, &path)) {
                        error = -ENOENT;
                        goto out;
                }
                obj.path1 = path;
                requested_dev_name = tomoyo_realpath_from_path(&path);
                if (!requested_dev_name) {
                        error = -ENOENT;
                        goto out;
                }
in tomoyo.  OK, so we do a pathname resolution of dev_name (including
the source in mount --bind case).  Then we apply checks to it...
and proceed to...
        if (obj.path1.dentry)
                path_put(&obj.path1);
... discard the result of lookup.  Then the caller proceeds to do
the work, including (at various locations, depending upon the
mount(2) flags, fs type, etc.) looking dev_name up.  Could you spell TOCTOU?

Or, for example, this:
        if (!dev_name || !*dev_name)
                return -EINVAL;

        flags &= MS_REC | MS_BIND;

        error = kern_path(dev_name, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT, &old_path);
        if (error)
                return error;

        get_buffers(buffer, old_buffer);
        error = fn_for_each_confined(label, profile,
                        match_mnt(profile, path, buffer, &old_path, old_buffer,
                                  NULL, flags, NULL, false));
        put_buffers(buffer, old_buffer);
        path_put(&old_path);
Same story, same TOCTOU race, this time in apparmour...
