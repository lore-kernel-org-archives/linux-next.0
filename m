From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Oct 25 (sb_edac.c)
Date: Wed, 26 Oct 2011 11:47:34 -0700
Message-ID: <4EA855C6.806@xenotime.net>
References: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:33208 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932759Ab1JZSrm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2011 14:47:42 -0400
In-Reply-To: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, bluesmoke-devel@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@redhat.com>

On 10/25/11 02:36, Stephen Rothwell wrote:
> Hi all,


sb_edac.c:(.text.unlikely+0x8370): undefined reference to `x86_mce_decoder_chain'
sb_edac.c:(.text.unlikely+0x87aa): undefined reference to `x86_mce_decoder_chain'



when CONFIG_X86_MCE is not enabled.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
