From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Sat, 18 Oct 2008 21:30:24 -0700
Message-ID: <200810182130.24946.jbarnes@virtuousgeek.org>
References: <20081016144105.fd0f5d5b.sfr@canb.auug.org.au> <200810181541.00638.jbarnes@virtuousgeek.org> <20081019151526.2e21b2b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-142.bluehost.com ([67.222.38.32]:46473 "HELO
	outbound-mail-142.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750698AbYJSEhI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Oct 2008 00:37:08 -0400
In-Reply-To: <20081019151526.2e21b2b7.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: benh@kernel.crashing.org, linux-next@vger.kernel.org

On Saturday, October 18, 2008 9:15 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> On Sat, 18 Oct 2008 15:41:00 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> 
wrote:
> > No I've got them.  I must have accidentally dropped the 1/2 when I
> > rebased last time, so d965c04f27d4df28b1ce77b0aea6329c07a8e13d is an
> > orphan (btw Stephen how did you find it?).
>
> I have older versions of your tree in my git repository.

Ah cool.  I was using 'git fsck --lost-found' and couldn't see the ones I 
clobbered.  Oh well.

Jesse
