From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next 0/3] x86 insn decoder test updates (Re: linux-next:
 Tree for October 29 (x86 posttest))
Date: Tue, 17 Nov 2009 07:13:52 +0100
Message-ID: <20091117061352.GE30852@elte.hu>
References: <20091116230611.5250.86656.stgit@harusame>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39864 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753293AbZKQGOR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Nov 2009 01:14:17 -0500
Content-Disposition: inline
In-Reply-To: <20091116230611.5250.86656.stgit@harusame>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, Jim Keniston <jkenisto@us.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, lkml <linux-kernel@vger.kernel.org>, systemtap <systemtap@sources.redhat.com>, DLE <dle-develop@lists.sourceforge.net>


* Masami Hiramatsu <mhiramat@redhat.com> wrote:

> Here are the patches which update x86 instruction decoder build-time 
> test. As Stephen reported on linux-next, sometimes objdump decodes bad 
> instructions as normal. This will cause a false positive result on x86 
> insn decoder test. This patches update the test as below;
>
>  - Show more information with V=1
>  - Show in which symbol the difference places.
>  - Just warning instead of build failure.

yes, -tip testing was showing such build bugs too:

 Error: ffffffff8104aae3:	c5 83 3d 49 80 ee    	lds    0xffffffffee80493d(%rbx),%eax
 Error: objdump says 6 bytes, but insn_get_length() says 3 (attr:0)

it happens with older tools, such as binutils-2.17. Modern binutils 
(2.19) is fine.

We dont want to remove the build error: it helped us fix a number of 
real bugs in the decoder - instead please try to create a make based 
workaround based on binutils, to not run the test with binutils older 
than 2.19 or so.

Thanks,

	Ingo
