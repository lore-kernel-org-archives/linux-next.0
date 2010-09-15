From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bkl-vfs tree with the nilfs2 tree
Date: Wed, 15 Sep 2010 10:48:43 +0200
Message-ID: <201009151048.44071.arnd@arndb.de>
References: <20100915140114.81406c4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100915140114.81406c4f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Blunck <jblunck@infradead.org>, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
List-Id: linux-next.vger.kernel.org

On Wednesday 15 September 2010, Stephen Rothwell wrote:
> Today's linux-next merge of the bkl-vfs tree got a conflict in
> fs/nilfs2/super.c between commit 38999dca4fdc4a0d1b92a540bc0772a32b07388a
> ("nilfs2: do not allocate multiple super block instances for a device")
> from the nilfs2 tree and commit 3fec873dc6e9026d98e2359202fa50fd06ee7b64
> ("BKL: Remove BKL from NILFS2") from the bkl-vfs tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Ok, thanks!

> P.S. Arndt, the first of the above bkl/vfs commits does not have a SOB
> line from you and has a bug (missing open brace) that is fixed in the
> second.  Just in case you decide to rebase this branch at any point ...

I'm still rebasing all the branches while people take patches into their
own trees, so I'll fix this up soon. Thanks for the info.

	Arnd
