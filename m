From: Matt Mackall <mpm@selenic.com>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Tue, 20 Jan 2009 00:01:44 -0600
Message-ID: <1232431304.5202.126.camel@calx>
References: <20090120145759.e707b9de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from waste.org ([66.93.16.53]:54020 "EHLO waste.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751841AbZATGC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 01:02:57 -0500
In-Reply-To: <20090120145759.e707b9de.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, "=?ISO-8859-1?Q?=22Am=E9rico?= Wang\"" <xiyou.wangcong@gmail.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Tue, 2009-01-20 at 14:57 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the slab tree got a conflict in mm/slob.c
> between commit 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
> hooks") from the ftrace tree and commit
> 6e9ed0cc4b963fde66ab47d9fb19147631e44555 ("slob: clean up the code") from
> the slab tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks Stephen.

-- 
http://selenic.com : development and support for Mercurial and Linux
