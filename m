From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Thu, 29 Nov 2018 16:57:20 -0800
Message-ID: <84796ec6-2603-7957-b159-e4c8b1e7362c@schaufler-ca.com>
References: <20181127115246.00967523@canb.auug.org.au>
 <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
 <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAHC9VhRthWKfgYenGq6Az+jVQ+76wCeBhBcMyo9zZwv+nBhy3A@mail.gmail.com>
 <20181129235130.GI2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129235130.GI2217@ZenIV.linux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>, Paul Moore <paul@paul-moore.com>
Cc: omosnace@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/29/2018 3:51 PM, Al Viro wrote:

I've added linux-security-module to the CC list.

> On Thu, Nov 29, 2018 at 05:23:24PM -0500, Paul Moore wrote:
>
>>> OK, I will verify that the SELinux submount fix rebased on top of
>>> vfs/work.mount in the way I suggested above passes the same testing
>>> (seliinux-testsuite + NFS crossmnt reproducer). I am now building two
>>> kernels (vfs/work.mount with and without the fix) to test. Let me know
>>> if there is anything more to do.
>> Thanks.
>>
>> The big thing is just making sure that we don't regress on the fix in
>> selinux/next if/when David's mount rework hits Linus' tree.
> FWIW, the whole thing is getting massaged/reordered/etc. and I would
> like some input from you guys at some point - assuming that I recover
> the ability to talk about LSM without obscenities...
>
> Question: what *should* happen if we try to cross into a submount and find
> that the thing on the other side is already mounted elsewhere, with incompatible
> LSM options?  Ditto for referrals, with an extra twist - what if we are given
> 3 alternatives, the first two already mounted elsewhere with incompatible
> options, the third one not mounted anywhere yet?

I fear that the safe answer and the containers answer are likely
to differ. The safe answer has to be to refuse the mount.

> Incidentally, should smack have ->sb_clone_mnt_opts()?

Probably, but I could never figure out what it was for,
and haven't identified a problem with not using it.
