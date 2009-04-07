From: James Morris <jmorris@selinuxproject.org>
Subject: Re: Invalid module format
Date: Mon, 6 Apr 2009 20:14:16 -0700 (PDT)
Message-ID: <alpine.LRH.2.00.0904062013440.21264@taiga.selinuxproject.org>
References: <20090401164450.f8192631.sfr@canb.auug.org.au> <20090401150928.GA5886@denkbrett.schottelius.org> <20090402123223.f31370cd.sfr@canb.auug.org.au> <49D9E5E5.9080505@googlemail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from taiga.selinuxproject.org ([71.6.217.77]:40137 "EHLO
	taiga.selinuxproject.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045AbZDGEcw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 00:32:52 -0400
In-Reply-To: <49D9E5E5.9080505@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gabriel C <nix.or.die@googlemail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, 6 Apr 2009, Gabriel C wrote:

>
> Now it does , CONFIG_MODVERSIONS is broken in Linus tree too.
>
> I reverted this commit :
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=9cb610d8e35fe3ec95a2fe2030b02f85aeea83c1
>
> and after that modules loading seems to work again here.

I've been seeing the same problem, and the above fix works for me too.


- James
-- 
James Morris
<jmorris@selinuxproject.org>
