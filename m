From: Xin Long <lucien.xin@gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next tree
Date: Thu, 8 Mar 2018 21:29:45 +0800
Message-ID: <CADvbK_e7uif+suSaoVygvdDwvffJ=j6LunCdh25vor2Qj+_DUw@mail.gmail.com>
References: <20180305124054.09966cb0@canb.auug.org.au> <20180308130703.7365f733@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308130703.7365f733@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Haines <richard_c_haines@btinternet.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 8, 2018 at 10:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 5 Mar 2018 12:40:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the selinux tree got a conflict in:
>>
>>   net/sctp/socket.c
>>
>> between several refactoring commits from the net-next tree and commit:
>>
>>   2277c7cd75e3 ("sctp: Add LSM hooks")
>>
>> from the selinux tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>>
>> --
>> Cheers, it
>> Stephen Rothwell
>
> The resolution now looks like below (there were more changes to this
> file in the net-next tree).  It will keep changing every time this file
> is touched :-(
This is the last change causing this conflict, as it touched
sctp_sendmsg_new_asoc.
The following patches for sctp update that will be posted soon will
NOT touch this function again.
