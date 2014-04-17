From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Thu, 17 Apr 2014 00:18:44 -0700
Message-ID: <87bnw0ctkb.fsf@x220.int.ebiederm.org>
References: <20140417151245.467efa8bd8d084277fd471c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140417151245.467efa8bd8d084277fd471c9@canb.auug.org.au>
	(Stephen Rothwell's message of "Thu, 17 Apr 2014 15:12:45 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/namespace.c: In function 'new_mountpoint':
> fs/namespace.c:725:9: error: implicit declaration of function 'hash' [-Werror=implicit-function-declaration]
>   struct list_head *chain = mountpoint_hashtable + hash(NULL, dentry);
>          ^
> fs/namespace.c:725:28: warning: initialization from incompatible pointer type [enabled by default]
>   struct list_head *chain = mountpoint_hashtable + hash(NULL, dentry);
>                             ^
> fs/namespace.c:741:2: warning: passing argument 2 of 'hlist_add_head' from incompatible pointer type [enabled by default]
>   hlist_add_head(&mp->m_hash, chain);
>   ^
> In file included from include/linux/signal.h:4:0,
>                  from include/linux/syscalls.h:72,
>                  from fs/namespace.c:11:
> include/linux/list.h:637:20: note: expected 'struct hlist_head *' but argument is of type 'struct list_head *'
>  static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
>                     ^
>
> So clearly my merge conflict resolution was not sufficient.
>
> I will just drop the userns tree for today.  Please give me some help
> with the resolutions - or fix this stuff up yourselves.

You had this exact conflict succesfully resolved yesterday.  Sigh.

Line 725 of fs/namespace.c: Simply need to read.
	struct hlist_head *chain = mp_hash(dentry);

Eric
