From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: linux-next: error fetching the cris tree
Date: Tue, 28 Oct 2014 09:30:03 +0100
Message-ID: <20141028083002.GK30087@axis.com>
References: <20141028110857.06bfae62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141028110857.06bfae62@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesper Nilsson <jespern@axis.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 28, 2014 at 01:08:57AM +0100, Stephen Rothwell wrote:
> Hi Jesper,

Hi Stephen!

> Fetching the cris tree (git://www.jni.nu/cris.git#for-next) this
> morning produced this error:
> 
> fatal: Couldn't find remote ref refs/heads/for-next

Ah sorry, my bad, I just changed the cris-mirror to copy from my
kernel.org tree, which had no for-next branch. Re-pushed now,
so it should be ok after the mirror has updated.

However, it might be better to switch over linux-next for cris
to use the for-next branch of this tree:

git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris.git

Should go a bit faster from there. The old mirror (repo.or.cz) will still
be there, but the tree at jni.nu will probably not come back.

> I will use the cris tree from yesterday.

Thanks,

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
