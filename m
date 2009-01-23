From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: proc tree build failure
Date: Fri, 23 Jan 2009 22:41:09 +0300
Message-ID: <20090123194109.GG8491@localhost>
References: <20090123171515.a0af4f8b.sfr@canb.auug.org.au> <20090123070955.GA8491@localhost> <20090123184147.GA3340@x200.localdomain> <20090123192607.GF8491@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f20.google.com ([209.85.219.20]:41331 "EHLO
	mail-ew0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbZAWTlJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2009 14:41:09 -0500
Received: by ewy13 with SMTP id 13so3946708ewy.13
        for <linux-next@vger.kernel.org>; Fri, 23 Jan 2009 11:41:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20090123192607.GF8491@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmi>

[Cyrill Gorcunov - Fri, Jan 23, 2009 at 10:26:07PM +0300]
| [Alexey Dobriyan - Fri, Jan 23, 2009 at 09:48:37PM +0300]
| ...
| | > Hi Stephen,
| | > 
| | > thanks for catching this. Until I miss something --
| | > s_fs_info for /proc is struct pid_namespace* right?
| | > So maybe_get_net will convert it to net*, which is
| | > not right I guess. On the other hand -- and PDE, and
| | > PDE_NET is defined in proc_fs.h regardless if CONIG_PROC_FS
| | > is turned on/off. Confused...
| | > 
| | > (to be fair -- this maybe_get_net(PDE_NET(PDE(inode))) is
| | >  taken from proc_net.c:get_proc_net, but to eliminate #ifdef
| | >  I reimplemented it, which is not good too -- maybe I've been
| | >  to put get_proc_net into some header, Eric?)
| | 
| | PDE_NET here is bogus. you should use seq_open_net/seq_release_net.
| | See how other code does this, plenty of examples.
| | 
| 
| The question is not in examples, I saw that code.
| There is some problem with seq_open_net/seq_release_net --
| I don't need additional private data for sequential files,
| all I need is just a pointer (ie -- seq_file.private) which
| is already allocated for seq_file structure itself. So
| Alexey, why should I use seq_open_net then and ask for
| additional memory which I don't need? (side note:
| actually get_net/put_net is really needed here indeed).
| 
| 		- Cyrill -

On the other hand - Alexey could we 'teach' seq_open_net/seq_release_net
to handle 0 private size? So then I could be able to set
seq_file.private to NULL
and call seq_release_net without problems?

		- Cyrill -
