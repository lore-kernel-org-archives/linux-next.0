From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next
 tree
Date: Wed, 07 Mar 2018 11:41:39 -0500 (EST)
Message-ID: <20180307.114139.680250568317481879.davem@davemloft.net>
References: <20180305124054.09966cb0@canb.auug.org.au>
        <CADvbK_cMVBWO7zgnyG=L8T5cTKfjyUXQAAv+a2ne5WVZ9TBJ4g@mail.gmail.com>
        <CAHC9VhST6LhUj6H28Ws96EaRzkp4FN91h46iGKpd2Yk44H7Jpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhST6LhUj6H28Ws96EaRzkp4FN91h46iGKpd2Yk44H7Jpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paul@paul-moore.com
Cc: lucien.xin@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richard_c_haines@btinternet.com
List-Id: linux-next.vger.kernel.org

From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Mar 2018 11:34:31 -0500

> On Mon, Mar 5, 2018 at 2:03 AM, Xin Long <lucien.xin@gmail.com> wrote:
>> On Mon, Mar 5, 2018 at 9:40 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi Paul,
>>>
>>> Today's linux-next merge of the selinux tree got a conflict in:
>>>
>>>   net/sctp/socket.c
>>>
>>> between several refactoring commits from the net-next tree and commit:
>>>
>>>   2277c7cd75e3 ("sctp: Add LSM hooks")
>>>
>>> from the selinux tree.
>>>
>>> I fixed it up (I think - see below) and can carry the fix as
>> The fixup is great!  the same as I mentioned in:
>> https://patchwork.ozlabs.org/patch/879898/
>> for net-next.git
>>
>>> necessary. This is now fixed as far as linux-next is concerned, but any
>>> non trivial conflicts should be mentioned to your upstream maintainer
>>> when your tree is submitted for merging.  You may also want to consider
>>> cooperating with the maintainer of the conflicting tree to minimise any
>>> particularly complex conflicts.
>>
>> [net-next,0/9] sctp: clean up sctp_sendmsg, this patchset was just applied
>> in net-next. So I just guess it might not yet be there when selinux tree was
>> being submitted.
> 
> The selinux/next branch is based on v4.16-rc1 and doesn't feed into
> the netdev tree, it goes straight to Linus during the merge window so
> unfortunately I think we may need to carry this for some time and
> relay this fix-up patch up to Linus during the merge window.

What a mess.

The SCTP option changes should have gone through my tree in retrospect.
