From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] kgdb: more barrier in blank weak function
Date: Sat, 27 Dec 2008 09:17:37 +0100
Message-ID: <20081227081737.GA26218@elte.hu>
References: <494C0BF0.3080109@kernel.org> <20081223132127.GA5450@linux.vnet.ibm.com> <495153A4.5060201@kernel.org> <20081224163400.GA11562@linux.vnet.ibm.com> <49529CE1.4040005@kernel.org> <20081226091217.GA5100@linux.vnet.ibm.com> <4954AC7B.3020603@kernel.org> <20081226102716.GA31450@uranus.ravnborg.org> <4955B782.3030407@kernel.org> <4955B7EC.7050002@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:33182 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751338AbYL0ISW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Dec 2008 03:18:22 -0500
Content-Disposition: inline
In-Reply-To: <4955B7EC.7050002@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie


* Yinghai Lu <yinghai@kernel.org> wrote:

> Impact: fix panic possible panic etc
> 
> some compiler seems to inline the weak global function if no line in it

>  kgdb_post_primary_code(struct pt_regs *regs, int e_vector, int err_code)
>  {
> -	return;
> +	barrier();
>  }

>  void __weak kgdb_disable_hw_debug(struct pt_regs *regs)
>  {
> +	barrier();
>  }

seems like the barrier() is not enough - the only safe sequence seems to 
be to turn it into a function that returns an integer.

	Ingo
