From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 19 Jun 2018 15:38:05 +0200
Message-ID: <CAJfpegvjM3Eh4ZPdepB240UyAVwca8qw+v4sGyEHRO1YBYyNSg@mail.gmail.com>
References: <20180619112140.58be35dd@canb.auug.org.au> <22145.1529397638@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22145.1529397638@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 19, 2018 at 10:40 AM, David Howells <dhowells@redhat.com> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>>  /* These sb flags are internal to the kernel */
>>  #define MS_SUBMOUNT     (1<<26)
>> -#define MS_NOREMOTELOCK      (1<<27)
>>  #define MS_NOSEC     (1<<28)
>>  #define MS_BORN              (1<<29)
>>  #define MS_ACTIVE    (1<<30)
>
> Ummm...  Can MS_NOREMOTELOCK be removed?  I know it's listed in the internal
> flags section, but all of these have been exposed to userspace for over a
> year.  Ideally, I'd remove all of these from UAPI, but can anyone guarantee
> that no pieces of userspace refer to them?

The number of potential users of these flags is pretty low, so I think
we can try and remove them and hope nothing breaks.

Probably best left after the dust settles.

Thanks,
Miklos
