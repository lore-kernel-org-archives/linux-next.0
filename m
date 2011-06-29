From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: build failure after merge of the security-testing
 tree
Date: Wed, 29 Jun 2011 17:36:05 +1000 (EST)
Message-ID: <alpine.LRH.2.00.1106291735410.5093@tundra.namei.org>
References: <20110629134800.9ee0d5b7.sfr@canb.auug.org.au> <201106291316.CDF48413.JtQVLOFSFOOFMH@I-love.SAKURA.ne.jp>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:47233 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751736Ab1F2HgS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jun 2011 03:36:18 -0400
In-Reply-To: <201106291316.CDF48413.JtQVLOFSFOOFMH@I-love.SAKURA.ne.jp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 29 Jun 2011, Tetsuo Handa wrote:

>  From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Date: Wed, 29 Jun 2011 13:07:52 +0900
> Subject: [PATCH] TOMOYO: Fix build error with CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y .
> 
> I forgot to add #ifndef in commit 0e4ae0e0 "TOMOYO: Make several options
> configurable.", resulting
> 
>   security/built-in.o: In function `tomoyo_bprm_set_creds':
>   tomoyo.c:(.text+0x4698e): undefined reference to `tomoyo_load_policy'
> 

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
