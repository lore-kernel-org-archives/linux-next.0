From: Gabriel C <nix.or.die@googlemail.com>
Subject: Re: Invalid module format
Date: Mon, 06 Apr 2009 13:22:13 +0200
Message-ID: <49D9E5E5.9080505@googlemail.com>
References: <20090401164450.f8192631.sfr@canb.auug.org.au>	<20090401150928.GA5886@denkbrett.schottelius.org> <20090402123223.f31370cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:36447 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755269AbZDFLVr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 07:21:47 -0400
In-Reply-To: <20090402123223.f31370cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

Stephen Rothwell wrote:

> Hi Nico,
> 
> On Wed, 1 Apr 2009 17:09:28 +0200 Nico -telmich- Schottelius <nico-linux-next@schottelius.org> wrote:
>> Stephen Rothwell [Wed, Apr 01, 2009 at 04:44:50PM +1100]:
>>> Changes since 20090331:
>> Same problem since 20090324.
>>
>> arch=amd64, config attached, all modules have that problem.
> 
> Does Linus' kernel with this config show the problem?
> 


Now it does , CONFIG_MODVERSIONS is broken in Linus tree too.

I reverted this commit :

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=9cb610d8e35fe3ec95a2fe2030b02f85aeea83c1

and after that modules loading seems to work again here.


Gabriel

 
