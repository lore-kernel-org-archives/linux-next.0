From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the mtd tree
Date: Wed, 25 Jul 2012 17:21:00 +0200
Message-ID: <50100EDC.3010109@keymile.com>
References: <20120717110025.35e6d8404104e77019bef6ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.ch.keymile.com ([193.17.201.103]:32234 "HELO
	mail.ch.keymile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751860Ab2GYPdR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jul 2012 11:33:17 -0400
In-Reply-To: <20120717110025.35e6d8404104e77019bef6ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DavidWoodhouse <dwmw2@infradead.org>

Hi folks, Stepehen,

On 07/17/2012 03:00 AM, Stephen Rothwell wrote:
> Hi Artem,
>
> Today's linux-next merge of the l2-mtd tree got a conflict in
> drivers/mtd/chips/cfi_cmdset_0002.c between commit 420962884379 ("mtd:
> cfi_cmdset_0002: Micron M29EW bugfixes as per TN-13-07") from the mtd
> tree and commit 39c0c188e160 ("mtd: cfi_cmdset_0002: Micron M29EW
> bugfixes as per TN-13-07") from the l2-mtd tree.
>
> I just used the version in the mtd tree.

I have no clue how the whole linux integration process works, so please 
forgive me if what I'm about to say will sound silly to all of you...

I'm just reading the above mail (a few days later than the original 
post) and I can't figure out what happened.
At first I could not find commit 39c0c188e160 out of the master branch 
in l2-mtd (http://git.infradead.org/users/dedekind/l2-mtd.git), then I 
tried again with the commit ID and found it, but now I can't figure out 
what branch it belongs to (looks like an orphaned branch).
Except that it differs from the "good" commit 420962884379 in that it 
has been commited by Artem (as opposed to David), and *not* 
signed-off-by David.

So could someone please spend a few words on what happened in the meantime?
To me it looks like the l2-mtd tree got rebased at some point, but I'm 
quite at loss about this whole back-and-forth between trees.
I'm sure a few words could make my life much easier... :-)

Thanks a lot!
Gerlando
