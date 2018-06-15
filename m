From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the y2038 tree with the overlayfs tree
Date: Fri, 15 Jun 2018 09:44:53 +0200
Message-ID: <CAK8P3a0QydiHLKr_0+k-nOVNZxAuh1AGbGK1xU6er8XgmNrGPQ@mail.gmail.com>
References: <20180615104324.76f86eae@canb.auug.org.au> <20180615124106.316e7401@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615124106.316e7401@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 15, 2018 at 4:41 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> This is now a conflict between the overlayfs tree and Linus' tree.  (I
> restarted my merging after I noticed that Linus merged more stuff.)

Right, I had mentioned this in my pull request message to Linus. Until
yesterday, I had the conflict resolution against the overlayfs and NFS
trees in my y2038 tree and was waiting for both to get merged first
so I could send the pull request. NFS got merged earlier this week,
and when I looked at the mail thread about overlayfs, I concluded that
it wouldn't make it: the changes in the overlayfs tree in linux-next
are the version that got Nak'ed earlier, and the discussion about
trying to fix it ended without a positive conclusion.

This should be addressed as soon as Miklos rebases his changes on
top of 4.18-rc1 for the following merge window.

     Arnd
