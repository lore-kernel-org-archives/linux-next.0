From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 9 Dec 2015 23:53:49 +0100
Message-ID: <CAHpGcM+eADwnuFLzqZztxhx_yZWb+m7uQt1o=X0y6oV7xDhUDg@mail.gmail.com>
References: <20151209121916.1d4cdba4@canb.auug.org.au>
	<CAOg9mSRoyq-yYXh2RMicwvjVPF8EGN=XdvSfZPfbTP62B+szDg@mail.gmail.com>
	<20151210092025.7c356624@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151210092025.7c356624@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Marshall <hubcap@omnibond.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

2015-12-09 23:20 GMT+01:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> OK, I wrote all that and then I realised that the preferred names
> (XATTR_NAME_POSIX_ACL_..) have been in Linus' tree for a long time (in
> include/uapi/linux/xattr.h), so you could just change the orangefs tree
> to use those already. i.e. my patch should apply cleanly to the
> orangefs tree and build and work correctly independently of the vfs
> tree change (I think).

Yes, I think that would be best.

Thanks, in particular for all the linux-next work!

Andreas
