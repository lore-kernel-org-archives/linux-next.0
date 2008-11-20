From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: proc tree build failure
Date: Thu, 20 Nov 2008 00:43:26 -0800
Message-ID: <m163mibxe9.fsf@frodo.ebiederm.org>
References: <20081120172425.135c8cf8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:44767 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753843AbYKTIp7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 03:45:59 -0500
In-Reply-To: <20081120172425.135c8cf8.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Thu, 20 Nov 2008 17:24:25 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Alexey,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> security/selinux/hooks.c: In function 'selinux_proc_get_sid':
> security/selinux/hooks.c:1182: error: 'struct super_block' has no member named
> 'type'
> security/selinux/hooks.c:1183: error: 'struct super_block' has no member named
> 'type'
> security/selinux/hooks.c:1189: error: too few arguments to function 'memcpy'
>
> Caused by commit e23b822350796e690a46873058d220878a18564c ("proc:
> make /proc/net it's own filesystem"). This has clearly never been
> compiled with CONFIG_PROC_FS set!

Nah.  Never compiled with CONFIG_SELINUX set.  I thought I had compile
tested that case but apparently not.

Sorry there was some stupid security drama going on when these patches
were written and that always seems to throws me off and reduces the
quality of my code.

Eric
