From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Fri, 30 Nov 2018 01:36:49 +0000
Message-ID: <20181130013648.GL2217@ZenIV.linux.org.uk>
References: <20181127115246.00967523@canb.auug.org.au>
 <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
 <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAHC9VhRthWKfgYenGq6Az+jVQ+76wCeBhBcMyo9zZwv+nBhy3A@mail.gmail.com>
 <20181129235130.GI2217@ZenIV.linux.org.uk>
 <84796ec6-2603-7957-b159-e4c8b1e7362c@schaufler-ca.com>
 <20181130012707.GK2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130012707.GK2217@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>, omosnace@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 30, 2018 at 01:27:07AM +0000, Al Viro wrote:

> And then there's sb_mount, with 3 instances and arseloads of
> races in 2 out of 3.

PS: the 3rd one (in selinux) is, AFAICS, TOCTOU-free, because
it ignores everything except the mountpoint, which is already
looked up by the caller.  No idea what any out-of-tree ones do,
of course, but judging by the in-tree sample...
